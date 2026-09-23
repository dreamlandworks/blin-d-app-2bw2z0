// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:firebase_database/firebase_database.dart';
import '/custom_code/actions/get_future_slot_timestamps.dart';

Future rtdbToAppState(String userId) async {
  // Add your function code here!
  if (userId.isEmpty) return;

  try {
    final rtdb = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
    );

    // Path matches your structure: appStats/{uid}/currentData
    final snapshot = await rtdb.ref('appStats/$userId').get();

    if (snapshot.exists) {
      final data = snapshot.value as Map<dynamic, dynamic>;

      // --- HELPER: Convert Epoch to DateTime ---
      DateTime? fromEpoch(dynamic value) {
        if (value == null) return null;
        // If your epoch is in Seconds (common in Unix), multiply by 1000
        // If it's already in Milliseconds, leave as is.
        try {
          int timestamp = (value is int) ? value : int.parse(value.toString());

          // .toLocal() ensures it uses the phone's current timezone (IST for your target users)
          return DateTime.fromMillisecondsSinceEpoch(timestamp).toLocal();
        } catch (e) {
          return null;
        }
      }

      final statsData = AppStatsRtdbStruct(
        coins: data['c'] ?? 0,
        chatsCount: data['cc'] ?? 0,
        lastActive: fromEpoch(data['la']),
        readyStatus:
            deserializeEnum<ReadyStatus>(data['st']?.toString() ?? 'active'),
        avgScore: (data['as'] ?? 0).toDouble(),
        expiryAt: fromEpoch(data['ex']),
        profileUpdatedAt: fromEpoch(data['pu']),
        personaUpdatedAt: fromEpoch(data['psu']),
      );

      // 2. Use the standard FFAppState call
      FFAppState().appStatsRtdb = statsData;

      if (FFAppState().onReady.readyStatus != 'chatting' &&
          FFAppState().onReady.slotId.isEmpty) {
        final restored = _onReadyFromRtdb(data);
        if (restored != null) {
          FFAppState().onReady = restored;
        }
      }

      if (kDebugMode) {
        print("RTDB to AppState: Successfully mapped currentData to Struct.");
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print("RTDB Sync Mapping Error: $e");
    }
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

int _asInt(dynamic value) {
  if (value is int) return value;
  return int.tryParse(value?.toString() ?? '') ?? 0;
}

String _paddedSlotId(String id) {
  final parts = id.split('_');
  if (parts.length != 4) return id;
  return '${parts[0]}_${parts[1].padLeft(2, '0')}_${parts[2].padLeft(2, '0')}_${parts[3]}';
}

OnReadyStruct? _onReadyFromRtdb(Map<dynamic, dynamic> data) {
  final ids = _asStringList(data['sid']);
  if (ids.isEmpty && _asInt(data['ct']) <= 0 && (data['st'] == null)) {
    return null;
  }

  var titles = _asStringList(data['stt']);
  var descs = _asStringList(data['sds']);
  var starts = _asIntList(data['sst']);

  if (ids.isNotEmpty &&
      (titles.length != ids.length || starts.length != ids.length)) {
    final catalog = {
      for (final slot in getFutureSlotTimestamps())
        slot['slot_id'].toString(): slot
    };
    titles = [];
    descs = [];
    starts = [];
    for (final id in ids) {
      final slot = catalog[id] ?? catalog[_paddedSlotId(id)];
      titles.add(slot?['title']?.toString() ?? id);
      descs.add(slot?['desc']?.toString() ?? '');
      final startMs = slot?['start_ms'];
      starts.add(startMs is int
          ? startMs
          : int.tryParse(startMs?.toString() ?? '') ?? 0);
    }
  }

  final status = data['st']?.toString() ?? '';
  if (status.isEmpty && ids.isEmpty) return null;

  return OnReadyStruct(
    readyStatus: status.isEmpty ? 'active' : status,
    readyTime: _asInt(data['la']),
    cooldownUntil: _asInt(data['ct']),
    slotId: ids,
    slotTitle: titles,
    slotDesc: descs,
    slotStartTimer: starts,
  );
}
