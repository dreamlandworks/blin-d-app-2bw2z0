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

int _rtdbOffsetMs = 0;
StreamSubscription<DatabaseEvent>? _rtdbOffsetSub;

int rtdbNowMs() => DateTime.now().millisecondsSinceEpoch + _rtdbOffsetMs;

Future ensureRtdbClock(FirebaseDatabase rtdb) async {
  if (_rtdbOffsetSub != null) {
    return;
  }
  _rtdbOffsetSub = rtdb.ref('.info/serverTimeOffset').onValue.listen((event) {
    final value = event.snapshot.value;
    if (value is num) {
      _rtdbOffsetMs = value.toInt();
    }
  });
  try {
    final snap = await rtdb.ref('.info/serverTimeOffset').get();
    final value = snap.value;
    if (value is num) {
      _rtdbOffsetMs = value.toInt();
    }
  } catch (_) {}
}

Future applyChatEndTime(int newEndTimeEpoch) async {
  if (newEndTimeEpoch <= 1000000000000) {
    return;
  }
  final remaining = (newEndTimeEpoch - rtdbNowMs()).clamp(0, 7200000).toInt();
  var allotted = FFAppState().endTime;
  final startAt = FFAppState().startTime;
  if (startAt > 1000000000000 && newEndTimeEpoch > startAt) {
    allotted = newEndTimeEpoch - startAt;
  } else if (remaining > allotted) {
    allotted = remaining;
  }
  FFAppState().update(() {
    FFAppState().chatEndTime = newEndTimeEpoch;
    if (allotted > 1000) {
      FFAppState().endTime = allotted.toInt();
    }
  });
}

Future rtdbNowMsAction() async {
  await ensureRtdbClock(FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
  ));
}
