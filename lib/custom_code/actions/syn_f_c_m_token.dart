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

import 'package:firebase_messaging/firebase_messaging.dart';
import '/custom_code/actions/mirror_matching_data_to_r_t_d_b.dart';

Future synFCMToken(
  DocumentReference userDoc,
  List<String>? currentTokens,
) async {
  // Add your function code here!
  if (kIsWeb) return;

  if (defaultTargetPlatform == TargetPlatform.iOS) {
    try {
      await FirebaseMessaging.instance.getAPNSToken();
    } catch (_) {}
  }

  String? newToken;
  for (var i = 0; i < 5; i++) {
    try {
      newToken = await FirebaseMessaging.instance.getToken();
    } catch (e) {
      if (kDebugMode) {
        print('synFCMToken getToken try ${i + 1}: $e');
      }
    }
    if (newToken != null && newToken.isNotEmpty) break;
    await Future.delayed(Duration(milliseconds: 700 * (i + 1)));
  }
  if (newToken == null || newToken.isEmpty) {
    if (kDebugMode) {
      print('synFCMToken skipped: no token after retries');
    }
    return;
  }

  await upsertRotatedFcmToken(userDoc, newToken);
  if (kDebugMode) {
    print("✨ Sync: rotated fcm_token[0]/[1] onto appStats/${userDoc.id}/f");
  }
}
