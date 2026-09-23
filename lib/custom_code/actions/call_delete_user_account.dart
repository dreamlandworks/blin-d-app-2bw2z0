// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

Future<bool> callDeleteUserAccount() async {
  try {
    final HttpsCallable callable = FirebaseFunctions.instanceFor(
      region: 'us-central1', // Update region if needed
    ).httpsCallable('deleteUserAccount');

    final response = await callable.call();

    // Safely extract success boolean directly in Dart
    if (response.data != null && response.data['success'] == true) {
      return true;
    }
    return false;
  } catch (e) {
    if (kDebugMode) {
      print('Error deleting account: $e');
    }
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
