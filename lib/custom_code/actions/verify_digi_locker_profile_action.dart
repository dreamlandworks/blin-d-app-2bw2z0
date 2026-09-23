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

Future<dynamic> verifyDigiLockerProfileAction(String sessionId) async {
  try {
    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('getDigiLockerUserProfile');

    final response = await callable.call({
      'sessionId': sessionId,
    });

    return response.data;
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching profile: $e');
    }
    return {'success': false, 'error': e.toString()};
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
