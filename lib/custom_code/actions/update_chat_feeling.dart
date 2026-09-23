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

Future updateChatFeeling(
  String chatID,
  String uid,
  String feeling,
) async {
  // 1. Point directly to the deep, specific sub-branch for this user's feeling

  final feelingRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
  ).ref("chats/$chatID/feeling/$uid");

  try {
    // 2. Set the raw value instantly with zero metadata overhead
    await feelingRef.set(feeling);
  } catch (e) {
    if (kDebugMode) {
      print("Error updating chat feeling: $e");
    }
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
