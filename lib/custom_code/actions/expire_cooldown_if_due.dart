// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '/backend/schema/enums/enums.dart';
import '/custom_code/actions/get_future_slot_timestamps.dart';
import '/custom_code/actions/rtdb_now_ms.dart';

bool _expireCooldownInFlight = false;

FirebaseDatabase _cooldownRtdb() => FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
    );

/// Clears an expired cooldown on RTDB + appState.
/// Promotes to `active` only when a future slot remains; otherwise `inactive`
/// and leftover slot ids are removed so Ready stays tappable.
Future<bool> expireCooldownIfDue() async {
  if (_expireCooldownInFlight) {
    return false;
  }
  _expireCooldownInFlight = true;
  try {
    return await _expireCooldownIfDueBody();
  } finally {
    _expireCooldownInFlight = false;
  }
}

Future<bool> _expireCooldownIfDueBody() async {
  final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
  if (uid.isEmpty) {
    return false;
  }

  final now = rtdbNowMs();
  final chatId = FFAppState().chatId.trim();
  final chatEnd = FFAppState().chatEndTime;
  if (chatId.isNotEmpty && chatEnd > now) {
    return false;
  }

  var status = FFAppState().onReady.readyStatus;
  var cooldownUntil = FFAppState().onReady.cooldownUntil;
  var ids = List<String>.from(FFAppState().onReady.slotId);
  var titles = List<String>.from(FFAppState().onReady.slotTitle);
  var descs = List<String>.from(FFAppState().onReady.slotDesc);
  var starts = List<int>.from(FFAppState().onReady.slotStartTimer);

  final rtdb = _cooldownRtdb();
  await ensureRtdbClock(rtdb);

  try {
    final snap = await rtdb.ref('appStats/$uid').get();
    if (snap.exists && snap.value is Map) {
      final data = Map<dynamic, dynamic>.from(snap.value as Map);
      final rtdbStatus = data['st']?.toString() ?? '';
      if (rtdbStatus.isNotEmpty) {
        status = rtdbStatus;
      }
      final rtdbCt = int.tryParse(data['ct']?.toString() ?? '');
      if (rtdbCt != null) {
        cooldownUntil = rtdbCt;
      }
      final rtdbIds = _asStringList(data['sid']);
      if (rtdbIds.isNotEmpty) {
        ids = rtdbIds;
        titles = _asStringList(data['stt']);
        descs = _asStringList(data['sds']);
        starts = _asIntList(data['sst']);
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print('expireCooldownIfDue read: $e');
    }
  }

  if (status == 'chatting' || status == 'banned') {
    return false;
  }

  if (status != 'cooldown') {
    if (FFAppState().onReady.readyStatus == 'cooldown' &&
        (status == 'inactive' || status == 'active' || status.isEmpty)) {
      _alignLists(ids, titles, descs, starts);
      await _commitExpired(
        uid: uid,
        rtdb: rtdb,
        status: status.isEmpty ? 'inactive' : status,
        ids: ids,
        titles: titles,
        descs: descs,
        starts: starts,
      );
      return true;
    }
    return false;
  }

  if (cooldownUntil > now) {
    return false;
  }

  _alignLists(ids, titles, descs, starts);
  final keepIds = <String>[];
  final keepTitles = <String>[];
  final keepDescs = <String>[];
  final keepStarts = <int>[];
  for (var i = 0; i < ids.length; i++) {
    final start = i < starts.length ? starts[i] : 0;
    if (start > now) {
      keepIds.add(ids[i]);
      keepTitles.add(i < titles.length ? titles[i] : ids[i]);
      keepDescs.add(i < descs.length ? descs[i] : '');
      keepStarts.add(start);
    }
  }

  final nextStatus = keepIds.isEmpty ? 'inactive' : 'active';
  await _commitExpired(
    uid: uid,
    rtdb: rtdb,
    status: nextStatus,
    ids: keepIds,
    titles: keepTitles,
    descs: keepDescs,
    starts: keepStarts,
  );

  if (kDebugMode) {
    print('expireCooldownIfDue → $nextStatus slots=${keepIds.length}');
  }
  return true;
}

Future<void> _commitExpired({
  required String uid,
  required FirebaseDatabase rtdb,
  required String status,
  required List<String> ids,
  required List<String> titles,
  required List<String> descs,
  required List<int> starts,
}) async {
  FFAppState().update(() {
    FFAppState().updateOnReadyStruct((s) {
      s.readyStatus = status;
      s.cooldownUntil = 0;
      s.slotId = ids;
      s.slotTitle = titles;
      s.slotDesc = descs;
      s.slotStartTimer = starts;
    });
    FFAppState().updateAppStatsRtdbStruct((s) {
      s.readyStatus = status == 'active'
          ? ReadyStatus.active
          : status == 'inactive'
              ? ReadyStatus.inactive
              : s.readyStatus;
    });
  });

  await rtdb.ref('appStats/$uid').update({
    'st': status,
    'ct': 0,
    'sid': ids.isEmpty ? null : ids,
    'stt': titles.isEmpty ? null : titles,
    'sds': descs.isEmpty ? null : descs,
    'sst': starts.isEmpty ? null : starts,
  });
}

void _alignLists(
  List<String> ids,
  List<String> titles,
  List<String> descs,
  List<int> starts,
) {
  if (ids.isEmpty) {
    titles.clear();
    descs.clear();
    starts.clear();
    return;
  }
  if (titles.length == ids.length &&
      descs.length == ids.length &&
      starts.length == ids.length) {
    return;
  }

  final catalog = {
    for (final slot in getFutureSlotTimestamps())
      slot['slot_id'].toString(): slot,
  };
  titles
    ..clear()
    ..addAll(List<String>.filled(ids.length, ''));
  descs
    ..clear()
    ..addAll(List<String>.filled(ids.length, ''));
  starts
    ..clear()
    ..addAll(List<int>.filled(ids.length, 0));
  for (var i = 0; i < ids.length; i++) {
    final id = ids[i];
    final slot = catalog[id] ?? catalog[_paddedSlotId(id)];
    titles[i] = slot?['title']?.toString() ?? id;
    descs[i] = slot?['desc']?.toString() ?? '';
    final startMs = slot?['start_ms'];
    starts[i] = startMs is int
        ? startMs
        : int.tryParse(startMs?.toString() ?? '') ?? 0;
  }
}

List<String> _asStringList(dynamic value) {
  if (value is List) {
    return value.map((e) => e.toString()).where((e) => e.isNotEmpty).toList();
  }
  if (value is Map) {
    final entries = value.entries.toList()
      ..sort((a, b) => a.key.toString().compareTo(b.key.toString()));
    return entries
        .map((e) => e.value.toString())
        .where((e) => e.isNotEmpty)
        .toList();
  }
  if (value is String && value.isNotEmpty) {
    return [value];
  }
  return [];
}

List<int> _asIntList(dynamic value) {
  final raw = value is Map
      ? (value.entries.toList()
            ..sort((a, b) => a.key.toString().compareTo(b.key.toString())))
          .map((e) => e.value)
          .toList()
      : value;
  if (raw is! List) return [];
  return raw
      .map((e) => int.tryParse(e.toString()) ?? 0)
      .where((e) => e > 0)
      .toList();
}

String _paddedSlotId(String id) {
  final parts = id.split('_');
  if (parts.length != 4) return id;
  return '${parts[0]}_${parts[1].padLeft(2, '0')}_${parts[2].padLeft(2, '0')}_${parts[3]}';
}
