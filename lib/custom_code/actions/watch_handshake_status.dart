// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '/custom_code/actions/rtdb_now_ms.dart';

StreamSubscription<DatabaseEvent>? _handshakeWatchSub;

Future watchHandshakeStatus(
  BuildContext context,
  String handshakeID,
  String slotFolder,
) async {
  await _handshakeWatchSub?.cancel();
  _handshakeWatchSub = null;

  final id = handshakeID.trim();
  final folder = slotFolder.trim();
  if (id.isEmpty || folder.isEmpty) {
    return;
  }

  await rtdbNowMsAction();

  final DatabaseReference ref = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
  ).ref("handshake_queue/$folder/$id");

  var handled = false;

  void openChat(String chatID, int endAt, int startAt, int durationMs) {
    final remaining = endAt > 1000000000000
        ? (endAt - rtdbNowMs()).clamp(0, 7200000).toInt()
        : durationMs;
    final allotted = durationMs > 0
        ? durationMs
        : (startAt > 1000000000000 && endAt > startAt
            ? endAt - startAt
            : remaining);
    FFAppState().update(() {
      FFAppState().chatId = chatID;
      if (startAt > 0) {
        FFAppState().startTime = startAt;
      }
      if (endAt > 0) {
        FFAppState().chatEndTime = endAt;
      }
      if (allotted > 0) {
        FFAppState().endTime = allotted;
      }
      FFAppState().updateOnReadyStruct(
        (s) => s..readyStatus = 'chatting',
      );
    });
    final nav = appNavigatorKey.currentContext ?? context;
    if (!nav.mounted) {
      return;
    }
    try {
      nav.goNamed(
        'ActiveChatPage',
        queryParameters: {
          'chatID': chatID,
          if (endAt > 0) 'endTime': '$endAt',
        },
      );
    } catch (e) {
      debugPrint('watchHandshakeStatus openChat nav error: $e');
    }
  }

  _handshakeWatchSub = ref.onValue.listen((DatabaseEvent event) {
    if (handled) {
      return;
    }

    final currentContext = appNavigatorKey.currentContext ?? context;

    if (!event.snapshot.exists) {
      handled = true;
      _handshakeWatchSub?.cancel();
      if (FFAppState().chatId.isNotEmpty) {
        openChat(
          FFAppState().chatId,
          FFAppState().chatEndTime,
          FFAppState().startTime,
          FFAppState().endTime,
        );
        return;
      }
      if (currentContext.mounted) {
        currentContext.goNamed('dashboard');
      }
      return;
    }

    final value = event.snapshot.value;
    if (value is! Map) {
      return;
    }

    final data = <String, dynamic>{};
    value.forEach((key, val) {
      data[key.toString()] = val;
    });
    final String status = data['status']?.toString() ?? '';
    final String chatID = data['chatID']?.toString() ?? '';
    final int endAt = int.tryParse(data['endTime']?.toString() ?? '') ?? 0;
    final int startAt = int.tryParse(data['startTime']?.toString() ?? '') ?? 0;
    final int durationMs =
        int.tryParse(data['durationMs']?.toString() ?? '') ?? 0;

    if (status == 'rejected') {
      handled = true;
      _handshakeWatchSub?.cancel();
      if (currentContext.mounted) {
        currentContext.goNamed('ChatRejectPage');
      }
      return;
    }

    if (chatID.isEmpty || chatID == 'null') {
      return;
    }

    handled = true;
    _handshakeWatchSub?.cancel();
    openChat(chatID, endAt, startAt, durationMs);
  }, onError: (error) {
    debugPrint('watchHandshakeStatus error: $error');
  });
}
