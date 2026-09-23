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
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> postChatFeedback(
  String chatID,
  String chatVibe,
  List<String> stoodOut,
  String? feedback,
) async {
  try {
    // 1. Get current logged-in user ID
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null || uid.isEmpty) {
      if (kDebugMode) {
        print('🔴 savePostChatFeedback Error: Current user UID is missing.');
      }
      return false;
    }

    if (chatID.isEmpty) {
      if (kDebugMode) {
        print('🔴 savePostChatFeedback Error: chatID is empty.');
      }
      return false;
    }

    // 4. Update RTDB (Messages & Metrics)
    final rtdb = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
    );
    // 2. Reference RTDB node: appStats/{uid}/feedback/{chatID}
    final DatabaseReference feedbackRef =
        rtdb.ref('appStats/$uid/feedback/$chatID');

    // 3. Construct payload safely
    final Map<String, dynamic> payload = {
      'chat_vibe': chatVibe,
      'stood_out': stoodOut,
      'feedback': (feedback != null && feedback.trim().isNotEmpty)
          ? feedback.trim()
          : null,
      'created_at': ServerValue.timestamp,
    };

    // 4. Save feedback payload to RTDB
    await feedbackRef.set(payload);
    if (kDebugMode) {
      print('✅ Feedback saved successfully for chat: $chatID');
    }
    return true;
  } catch (e) {
    if (kDebugMode) {
      print('🔴 savePostChatFeedback Exception: $e');
    }
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
