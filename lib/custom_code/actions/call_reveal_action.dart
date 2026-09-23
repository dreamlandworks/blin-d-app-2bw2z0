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

Future<dynamic> callRevealAction(
  String baseRequestId,
  String senderUid,
  String chatId,
  String action,
  List<String> revealList, // ✅ non-nullable — pass [] when action is "reject"
) async {
  try {
    final Map<String, dynamic> payload = {
      'baseRequestId': baseRequestId,
      'senderUid': senderUid,
      'chatId': chatId,
      'action': action,
    };

    if (action == 'accept') {
      payload['revealList'] = revealList;
    }

    final result = await FirebaseFunctions.instanceFor(region: 'us-central1')
        .httpsCallable('confirm_reveal')
        .call(payload);

    final data = result.data;

    return {
      'success': true,
      'status': data['status']?.toString() ?? '',
      'cost': data['cost'] ?? 0,
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
// your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
