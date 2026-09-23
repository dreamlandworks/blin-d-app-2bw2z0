// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

// Imports custom functions

// Imports custom functions

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import '/flutter_flow/flutter_flow_util.dart';

final Set<String> _missedSyncInFlight = <String>{};

Future<bool> checkForMissedChatSync(String currentUid) async {
  try {
    if (FFAppState().onReady.readyStatus == 'chatting') {
      return false;
    }

    final dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ).ref();

    final activeChatSnap =
        await dbRef.child('appStats/$currentUid/activeChatId').get();
    if (!activeChatSnap.exists) return false; // no dangling chat

    final activeChatId = activeChatSnap.value?.toString() ?? '';
    if (activeChatId.isEmpty || activeChatId == 'null') return false;
    if (!_missedSyncInFlight.add(activeChatId)) return false;

    try {
      // Check if the chat node still exists in RTDB
      final chatExistsSnap = await dbRef.child('chats/$activeChatId').get();
      if (!chatExistsSnap.exists) {
        await dbRef.child('appStats/$currentUid/activeChatId').remove();
        if (kDebugMode) {
          print(
              "🧹 Cleared stale activeChatId — chat $activeChatId no longer exists.");
        }
        return false;
      }

      final statsSnap = await dbRef.child('chats/$activeChatId/stats').get();
      final stats = statsSnap.value is Map
          ? Map<dynamic, dynamic>.from(statsSnap.value as Map)
          : <dynamic, dynamic>{};
      final status = stats['status']?.toString() ?? '';
      final endAt = int.tryParse(stats['end_at']?.toString() ?? '') ?? 0;
      final stillLive = status == 'active' &&
          (endAt == 0 || endAt > DateTime.now().millisecondsSinceEpoch);
      if (stillLive) {
        if (kDebugMode) {
          print(
              "⏸️ Skipping missed sync — $activeChatId is still an active chat.");
        }
        return false;
      }

      final syncedSnap = await dbRef
          .child('chats/$activeChatId/stats/$currentUid/synced')
          .get();
      final alreadySynced = syncedSnap.exists && syncedSnap.value == true;
      if (alreadySynced) {
        await dbRef.child('appStats/$currentUid/activeChatId').remove();
        return false;
      }

      if (kDebugMode) {
        print("🔄 Missed sync detected for $activeChatId. Running catch-up...");
      }
      return await syncOriginalAndMetrics(activeChatId, currentUid, true);
    } finally {
      _missedSyncInFlight.remove(activeChatId);
    }
  } catch (e) {
    if (kDebugMode) {
      print("❌ checkForMissedChatSync error: $e");
    }
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
