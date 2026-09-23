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

import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import '/custom_code/actions/cancel_all_chat_streams.dart';

Future setupFeelingListener(String chatID, String partnerUid) async {
  if (chatID.isEmpty || partnerUid.isEmpty) {
    return;
  }
  await feelingStreamSubscription?.cancel();
  feelingStreamSubscription = null;

  // 2. Aim the database reference strictly at the targeted flat feeling node
  final feelingRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
  ).ref("chats/$chatID/feeling");

  // 3. Fire up the continuous realtime stream socket
  feelingStreamSubscription = feelingRef.onValue.listen((DatabaseEvent event) {
    if (event.snapshot.exists && event.snapshot.value != null) {
      try {
        final rawMap = event.snapshot.value as Map<Object?, Object?>;
        String? partnerCode;

        // 4. Look specifically for the partner's UID key
        if (rawMap.containsKey(partnerUid)) {
          final partnerValue = rawMap[partnerUid];
          if (partnerValue != null) {
            partnerCode = partnerValue.toString();
          }
        }

        // 5. Update the global app state with the single integer
        FFAppState().update(() {
          FFAppState().feeling =
              partnerCode ?? '0'; // Default to 0 if not set or cleared
        });

        if (kDebugMode) {
          print("Synchronized partner feeling code: ${partnerCode ?? 0}");
        }
      } catch (e) {
        if (kDebugMode) {
          print("Parsing exception inside feeling schema loop: $e");
        }
      }
    } else {
      // Clear state if the tree branch is empty
      FFAppState().update(() {
        FFAppState().feeling = '0';
      });
    }
  });
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
