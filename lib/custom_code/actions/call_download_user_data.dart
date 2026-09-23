// Automatic FlutterFlow imports
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

import 'package:cloud_functions/cloud_functions.dart';
import 'dart:convert';

Future<bool> callDownloadUserData() async {
  try {
    final HttpsCallable callable = FirebaseFunctions.instanceFor(
      region: 'us-central1', // Replace with your region if different
    ).httpsCallable('downloadUserData');

    final response = await callable.call();

    if (response.data != null && response.data['success'] == true) {
      final exportData = response.data['data'];
      final String jsonString =
          const JsonEncoder.withIndent('  ').convert(exportData);

      // You can store this string in AppState or write to local storage
      FFAppState().update(() {
        FFAppState().exportedUserDataJson = jsonString;
      });

      //print("✅ User data exported successfully!");
      return true;
    }
    return false;
  } catch (e) {
    if (kDebugMode) {
      print("❌ Error downloading user data: $e");
    }
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
