// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

import '/custom_code/actions/rtdb_now_ms.dart';

Future<dynamic> callExtendChatAction(
  String chatID,
  String partnerUid,
) async {
  var id = chatID.trim();
  if (id.isEmpty || !id.startsWith('chat_')) {
    id = FFAppState().chatId.trim();
  }
  var partner = partnerUid.trim();
  if (partner.isEmpty || partner == 'null') {
    partner = FFAppState().partnerData.pUid?.id ?? '';
  }
  if (id.isEmpty || partner.isEmpty) {
    return {
      'status': 'error',
      'message': 'Missing chatID or partnerUid',
    };
  }
  if (kDebugMode) {
    print('⏳ Extend chat starting chatID=$id');
  }
  try {
    final result = await FirebaseFunctions.instanceFor(region: 'us-central1')
        .httpsCallable(
          'extend_chat_session',
          options: HttpsCallableOptions(timeout: const Duration(seconds: 30)),
        )
        .call({'chatID': id, 'partnerUid': partner});
    final data = result.data;
    final newEnd = data is Map
        ? int.tryParse(data['newEndTime']?.toString() ?? '') ?? 0
        : 0;
    if (newEnd > 0) {
      applyChatEndTime(newEnd);
    }
    if (kDebugMode) {
      print(
          '✅ Extend chat success newEndTime=$newEnd remaining=${FFAppState().endTime}');
    }
    return data;
  } on FirebaseFunctionsException catch (e) {
    if (kDebugMode) {
      print('Extend Chat Error ${e.code}: ${e.message}');
    }
    return {
      'status': 'error',
      'code': e.code,
      'message': e.message ?? e.code,
    };
  } catch (e) {
    if (kDebugMode) {
      print('Extend Chat Error: $e');
    }
    return {'status': 'error', 'message': e.toString()};
  }
}
