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

Future<dynamic> callManagePermRequest(
    String partnerUid,
    String? chatId,
    bool isActiveChat,
    String action // Default to 'accept', can also pass 'decline' or 'request
    ) async {
  try {
    final HttpsCallable callable = FirebaseFunctions.instanceFor(
      region: 'us-central1', // Replace with your Firebase region if different
    ).httpsCallable('managePermRequest');

    final response = await callable.call(<String, dynamic>{
      'partnerUid': partnerUid,
      'chatId': chatId ?? '',
      'isActiveChat': isActiveChat,
      'action': action, // 👈 Explicitly passed to backend
    });

    return response.data;
  } on FirebaseFunctionsException catch (e) {
    if (kDebugMode) {
      print('Firebase Function Error: ${e.code} - ${e.message}');
    }
    return {
      'success': false,
      'error': e.message ?? 'Failed to send permanent request.',
    };
  } catch (e) {
    if (kDebugMode) {
      print('Generic Error: $e');
    }
    return {
      'success': false,
      'error': e.toString(),
    };
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
