// Automatic FlutterFlow imports
import '/backend/backend.dart';
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

Future enterMatchingSlot(
  List<String> slotId, // e.g., "2026_03_20_04"
  String userId,
  String verificationStatus,
) async {
  // 1. Safety Check
  if (verificationStatus == 'banned') {
    if (kDebugMode) {
      print("Mirror Safety: Banned user blocked from entry.");
    }
    return;
  }

  // 2. Correct Scoping: Assign to the variable, don't re-declare it
  String bucket = (verificationStatus == 'guest') ? 'unverified' : 'verified';
  final uid = userId.trim();
  if (uid.isEmpty) {
    return;
  }

  try {
    for (String id in slotId) {
      final slot = id.trim();
      if (slot.isEmpty) continue;
      DatabaseReference ref = FirebaseDatabase.instanceFor(
        app: Firebase.app(),
        databaseURL:
            'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
      ).ref('active_slots/$slot/$bucket/$uid');
      await ref.set({'try': 0});
    }

    await FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ).ref('appStats/$uid').update({'sid': slotId});

    // Optional: Set a local AppState to "Waiting" to update UI
    FFAppState().isSearching = true;
  } catch (e) {
    if (kDebugMode) {
      print('Error entering slot: $e');
    }
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
