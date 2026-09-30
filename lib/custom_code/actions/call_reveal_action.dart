// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_functions/cloud_functions.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/custom_code/actions/fetch_revealed_profile.dart';

Future<dynamic> callRevealAction(
  String baseRequestId,
  String senderUid,
  String chatId,
  String action,
  List<String> revealList,
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

    final data = jsonSafe(result.data);
    if (action == 'accept' && data is Map) {
      final cost = int.tryParse(data['cost']?.toString() ?? '') ?? 0;
      final coinsLeft = int.tryParse(data['coins']?.toString() ?? '');
      final iPaid = currentUserUid == senderUid.trim();
      FFAppState().update(() {
        FFAppState().updateChatStatsStruct((s) {
          s.isRevealed = true;
        });
        if (iPaid) {
          if (coinsLeft != null) {
            FFAppState().coins = coinsLeft;
          } else if (cost > 0 && FFAppState().coins >= cost) {
            FFAppState().coins = FFAppState().coins - cost;
          }
        }
      });
      final partner = senderUid.trim();
      if (partner.isNotEmpty) {
        await fetchRevealedProfile(partner);
      }
    }

    return {
      'success': true,
      'status': data is Map ? data['status']?.toString() ?? '' : '',
      'cost': data is Map ? data['cost'] ?? 0 : 0,
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
