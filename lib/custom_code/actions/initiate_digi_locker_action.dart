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

Future<dynamic> initiateDigiLockerAction(
  String redirectUrl,
  String? verifiedMobile,
) async {
  try {
    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('initiateDigiLockerSession');

    final response = await callable.call({
      'redirectUrl': redirectUrl,
      'verifiedMobile': verifiedMobile ?? '',
    });

    return response.data;
  } catch (e) {
    if (kDebugMode) {
      print('Error initiating session: $e');
    }
    return {'success': false, 'error': e.toString()};
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
