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

Future<dynamic> fetchRevealedProfile(
  String partnerUid,
) async {
  try {
    final result = await FirebaseFunctions.instanceFor(region: 'us-central1')
        .httpsCallable('getRevealedProfile')
        .call({
      'partnerUid': partnerUid,
    });

    final data = result.data;

    return {
      'success': true,
      'data': data['data'],
    };
  } on FirebaseFunctionsException catch (e) {
    return {
      'success': false,
      'errorCode': e.code,
      'errorMessage': e.message ?? 'Unknown error occurred',
    };
  } catch (e) {
    return {
      'success': false,
      'errorCode': 'unknown',
      'errorMessage': e.toString(),
    };
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
