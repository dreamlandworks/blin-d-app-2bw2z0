// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

Future<dynamic> getMyRevealedUsersList() async {
  try {
    final result = await FirebaseFunctions.instanceFor(region: 'us-central1')
        .httpsCallable('getMyRevealedUsersList')
        .call();

    if (result.data['success'] == true) {
      return result
          .data; // return the whole object, not just result.data['reveals']
    }

    return {
      'success': false,
      'perm_connections': [],
      'reveals': [],
    };
  } on FirebaseFunctionsException catch (e) {
    if (kDebugMode) {
      print('getMyRevealedUsersList error: ${e.code} — ${e.message}');
    }
    return {'success': false, 'perm_connections': [], 'reveals': []};
  } catch (e) {
    if (kDebugMode) {
      print('getMyRevealedUsersList unexpected error: $e');
    }
    return {'success': false, 'perm_connections': [], 'reveals': []};
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
