// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_functions/cloud_functions.dart';

Future<dynamic> submitReport(
  String partnerUid,
  String chatId,
  String category,
  String additionalDetails,
) async {
  var id = chatId.trim();
  if (id.isEmpty || id == 'null') {
    id = FFAppState().chatId.trim();
  }
  var partner = partnerUid.trim();
  if (partner.isEmpty || partner == 'null') {
    partner = FFAppState().partnerData.pUid?.id ?? '';
  }
  try {
    final result = await FirebaseFunctions.instanceFor(region: 'us-central1')
        .httpsCallable('submitReport')
        .call({
      'partnerUid': partner,
      'chatId': id,
      'chatID': id,
      'category': category,
      'additionalDetails': additionalDetails,
    });

    return {
      'success': true,
      'reportId': result.data['reportId'],
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
