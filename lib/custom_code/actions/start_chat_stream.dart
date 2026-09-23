// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/custom_code/actions/cancel_all_chat_streams.dart';
import '/custom_code/actions/rtdb_now_ms.dart';

Future startChatStream(String chatID) async {
  if (chatID.isEmpty || chatID == 'romantic_demo') {
    return;
  }

  final rtdb = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
  );

  await ensureRtdbClock(rtdb);

  final DatabaseReference chatRef = rtdb.ref("chats/$chatID/messages");

  try {
    final statsSnap = await rtdb.ref("chats/$chatID/stats").get();
    if (statsSnap.exists && statsSnap.value is Map) {
      final stats = Map<dynamic, dynamic>.from(statsSnap.value as Map);
      final endAt = int.tryParse(
            (stats['end_at'] ?? stats['endTime'])?.toString() ?? '',
          ) ??
          0;
      final startAt = int.tryParse(
            (stats['start_at'] ?? stats['startTime'])?.toString() ?? '',
          ) ??
          0;
      FFAppState().chatId = chatID;
      if (startAt > 0) {
        FFAppState().startTime = startAt;
      }
      applyChatEndTime(endAt);
      final stillLive = endAt <= 0 || endAt > rtdbNowMs();
      if (stillLive && FFAppState().onReady.readyStatus != 'chatting') {
        FFAppState().updateOnReadyStruct(
          (s) => s..readyStatus = 'chatting',
        );
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print("startChatStream stats hydrate error: $e");
    }
  }

  await chatStatsSubscription?.cancel();
  var lastEndAt = 0;
  chatStatsSubscription =
      rtdb.ref("chats/$chatID/stats/end_at").onValue.listen((event) {
    final endAt = int.tryParse(event.snapshot.value?.toString() ?? '') ?? 0;
    if (endAt <= 0 || endAt == lastEndAt) {
      return;
    }
    lastEndAt = endAt;
    applyChatEndTime(endAt);
  });

  final Box originalBox = await Hive.openBox('userChats_${chatID}_original');
  final Box scrubbedBox = await Hive.openBox('userChats_${chatID}_scrubbed');

  try {
    final DataSnapshot historySnapshot = await chatRef.get();

    if (historySnapshot.exists) {
      for (var child in historySnapshot.children) {
        final String msgID = child.key!;
        final dynamic rawValue = child.value;

        if (rawValue is Map) {
          final Map msgData = rawValue;
          final String rawText = msgData['msg']?.toString() ?? '';
          final String senderId = msgData['senderId']?.toString() ?? '';
          final int ts = int.tryParse(msgData['ts']?.toString() ?? '') ??
              rtdbNowMs();

          await originalBox.put(msgID, {
            'senderId': senderId,
            'msg': rawText,
            'ts': ts,
          });

          await scrubbedBox.put(msgID, {
            'senderId': senderId,
            'msg': msgData['scrubbedMsg'] ?? rawText,
            'ts': ts,
          });
        }
      }
      if (kDebugMode) {
        print("✅ Sync complete. Box count: ${originalBox.length}");
      }
    } else if (kDebugMode) {
      print("⚠️ No history found in RTDB at: ${chatRef.path}");
    }
  } catch (e) {
    if (kDebugMode) {
      print("❌ Sync Error: $e");
    }
  }

  await messageStreamSubscription?.cancel();
  messageStreamSubscription =
      chatRef.onChildAdded.listen((DatabaseEvent event) async {
    final String msgID = event.snapshot.key ?? rtdbNowMs().toString();

    final raw = event.snapshot.value;
    if (raw is! Map) {
      return;
    }
    final data = Map<dynamic, dynamic>.from(raw);
    final String rawText = data['msg']?.toString() ?? '';
    final String senderId = data['senderId']?.toString() ?? '';
    final int ts = int.tryParse(data['ts']?.toString() ?? '') ?? rtdbNowMs();

    await originalBox.put(msgID, {
      'senderId': senderId,
      'msg': rawText,
      'ts': ts,
    });

    await scrubbedBox.put(msgID, {
      'senderId': senderId,
      'msg': data['scrubbedMsg'] ?? rawText,
      'ts': ts,
    });

    if (kDebugMode) {
      print("📥 New live message synced: $msgID");
    }
  });
}
