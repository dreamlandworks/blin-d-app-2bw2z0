// Automatic FlutterFlow imports
import '/backend/backend.dart';
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

Future<dynamic> processUserReadyStatus(
    bool isPremiumStatus, String userId) async {
  if (userId.isEmpty) return null;

  try {
    final bool isPremium = isPremiumStatus;
    DateTime now = DateTime.now(); // This is already local time

    // 1. Define Cooldown Duration
    int cooldownHours = isPremium ? 2 : 24;
    DateTime cooldownTarget = now.add(Duration(hours: cooldownHours));

    // 2. Prepare Timestamps (Integers)
    int readyTimeStamp = now.millisecondsSinceEpoch;
    int cooldownUntilStamp = cooldownTarget.millisecondsSinceEpoch;
    String status = 'active';

    // 3. Initialize RTDB
    final rtdb = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
    );

    // 4. Update RTDB directly
    // Using a Map is safer for 'update' operations in RTDB
    await rtdb
        .ref('appStats/$userId')
        .update({'la': readyTimeStamp, 'st': status, 'ct': cooldownUntilStamp});

    if (kDebugMode) {
      print("User Status Processed: $status. Cooldown until: $cooldownTarget");
    }

    // 5. Return JSON to FlutterFlow
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
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
