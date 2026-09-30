// Automatic FlutterFlow imports
import '/backend/backend.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<dynamic> processUserReadyStatus(
    bool isPremiumStatus, String userId) async {
  if (userId.isEmpty) return null;

  try {
    final bool isPremium = isPremiumStatus;
    DateTime now = DateTime.now();

    final rtdb = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
    );

    final snap = await rtdb.ref('appStats/$userId').get();
    if (snap.exists) {
      final data = snap.value;
      if (data is Map) {
        final st = data['st']?.toString() ?? '';
        final ct = int.tryParse(data['ct']?.toString() ?? '') ?? 0;
        if ((st == 'cooldown' || st == 'chatting') &&
            ct > now.millisecondsSinceEpoch) {
          if (kDebugMode) {
            print('processUserReadyStatus blocked — st=$st ct=$ct');
          }
          return {
            'ready_status': 'cooldown',
            'ready_time': data['la'],
            'cooldown_until': ct,
            'is_premium': isPremium,
            'blocked': true,
          };
        }
      }
    }

    int cooldownHours = isPremium ? 2 : 24;
    DateTime cooldownTarget = now.add(Duration(hours: cooldownHours));

    int readyTimeStamp = now.millisecondsSinceEpoch;
    int cooldownUntilStamp = cooldownTarget.millisecondsSinceEpoch;
    String status = 'active';

    await rtdb
        .ref('appStats/$userId')
        .update({'la': readyTimeStamp, 'st': status, 'ct': cooldownUntilStamp});

    if (kDebugMode) {
      print("User Status Processed: $status. Cooldown until: $cooldownTarget");
    }

    return {
      'ready_status': status,
      'ready_time': readyTimeStamp,
      'cooldown_until': cooldownUntilStamp,
      'is_premium': isPremium,
    };
  } catch (e) {
    if (kDebugMode) {
      print("Process Status Error: $e");
    }
    return null;
  }
}
