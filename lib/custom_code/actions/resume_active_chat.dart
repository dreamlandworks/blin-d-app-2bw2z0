// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/custom_code/actions/expire_active_chat.dart';
import '/custom_code/actions/rtdb_now_ms.dart';
import '/custom_code/actions/start_chat_stream.dart';

Future resumeActiveChat(BuildContext context) async {
  await rtdbNowMsAction();

  var chatID = FFAppState().chatId.trim();
  if (chatID.isEmpty || chatID == 'null' || chatID == 'romantic_demo') {
    final uid = currentUserUid;
    if (uid.isNotEmpty) {
      final snap = await FirebaseDatabase.instanceFor(
        app: Firebase.app(),
        databaseURL:
            'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
      ).ref('appStats/$uid/activeChatId').get();
      chatID = snap.value?.toString().trim() ?? '';
      if (chatID == 'null') {
        chatID = '';
      }
      if (chatID.isNotEmpty) {
        FFAppState().chatId = chatID;
      }
    }
  }
  if (chatID.isEmpty || chatID == 'romantic_demo') {
    return;
  }

  await startChatStream(chatID);
  if (!context.mounted) {
    return;
  }

  final endAt = FFAppState().chatEndTime;
  if (endAt > 1000000000000 && endAt <= rtdbNowMs()) {
    await expireActiveChat();
    return;
  }

  context.goNamed(
    'ActiveChatPage',
    queryParameters: {
      'chatID': serializeParam(chatID, ParamType.String),
      if (endAt > 1000000000000)
        'endTime': serializeParam(endAt, ParamType.int),
    }.withoutNulls,
  );
}
