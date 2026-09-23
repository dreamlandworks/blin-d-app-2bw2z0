// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';

import '/custom_code/actions/rtdb_now_ms.dart';

Future<dynamic> getChatSummaryAndNotify(String chatId) async {
  if (chatId.isEmpty || chatId == 'romantic_demo') {
    return {'success': false, 'errorMessage': 'invalid chat'};
  }
  try {
    final endSnap = await FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ).ref('chats/$chatId/stats/end_at').get();
    final endAt = int.tryParse(endSnap.value?.toString() ?? '') ?? 0;
    if (endAt > rtdbNowMs() + 5000) {
      if (kDebugMode) {
        print('getChatSummaryAndNotify skipped — $chatId still live');
      }
      return {'success': false, 'errorMessage': 'chat still active'};
    }

    final result = await FirebaseFunctions.instanceFor(region: 'us-central1')
        .httpsCallable('getChatSummaryAndNotify')
        .call({'chatId': chatId});

    FFAppState().update(() {
      FFAppState().chatStats = ChatStatsStruct(
        matchScore: result.data['match_score'],
        msgCountMe: result.data['my_messages'],
        msgCountPartner: result.data['partner_messages'],
        msgCountAll: result.data['total_messages'],
        isRevealed: result.data['is_revealed'],
      );
    });

    return {
      'success': true,
    };
  } on FirebaseFunctionsException catch (e) {
    if (kDebugMode) {
      print('getChatSummaryAndNotify error: ${e.code} — ${e.message}');
    }
    return {'success': false, 'errorMessage': e.message};
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
