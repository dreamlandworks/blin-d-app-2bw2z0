// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/custom_code/actions/get_chat_summary_and_notify.dart';
import '/custom_code/actions/sync_original_and_metrics.dart';

bool _chatExpiryRunning = false;

void _goPostChat(String chatId) {
  final nav = appNavigatorKey.currentContext;
  if (nav == null || !nav.mounted) {
    return;
  }
  try {
    nav.goNamed(
      'postChatScreen',
      queryParameters: {
        'survey': serializeParam(false, ParamType.bool),
        'chatID': serializeParam(chatId, ParamType.String),
      }.withoutNulls,
    );
  } catch (e) {
    if (kDebugMode) {
      print('expireActiveChat nav: $e');
    }
  }
}

Future expireActiveChat() async {
  final chatId = FFAppState().chatId.trim();
  if (chatId.isEmpty || chatId == 'romantic_demo') {
    return;
  }

  if (_chatExpiryRunning) {
    _goPostChat(chatId);
    return;
  }
  _chatExpiryRunning = true;

  try {
    final cooldownMs = FFAppState().isPremium ? 10800000 : 72000000;
    final cooldownUntil = DateTime.now().millisecondsSinceEpoch + cooldownMs;
    FFAppState().updateOnReadyStruct((s) {
      s.readyStatus = 'cooldown';
      s.cooldownUntil = cooldownUntil;
    });

    final uid = currentUserUid;
    if (uid.isNotEmpty) {
      final rtdb = FirebaseDatabase.instanceFor(
        app: Firebase.app(),
        databaseURL:
            'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
      );
      await rtdb.ref().update({
        'appStats/$uid/st': 'cooldown',
        'appStats/$uid/ct': cooldownUntil,
        'appStats/$uid/activeChatId': null,
      });
    }

    _goPostChat(chatId);

    if (uid.isNotEmpty) {
      await syncOriginalAndMetrics(chatId, uid, true);
    }
    await getChatSummaryAndNotify(chatId);
  } catch (e) {
    if (kDebugMode) {
      print('expireActiveChat: $e');
    }
    _chatExpiryRunning = false;
  }
}
