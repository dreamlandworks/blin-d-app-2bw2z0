// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

import '/custom_code/actions/fetch_revealed_profile.dart';

Future<dynamic> getMyRevealedUsersList() async {
  try {
    final result = await FirebaseFunctions.instanceFor(region: 'us-central1')
        .httpsCallable('getMyRevealedUsersList')
        .call();

    final data = jsonSafe(result.data);
    if (data is Map && data['success'] == true) {
      bumpUiAfterAssign();
      return data;
    }

    bumpUiAfterAssign();
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
