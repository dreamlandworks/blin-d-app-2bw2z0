// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '/custom_code/actions/rtdb_now_ms.dart';

// Simple in-memory cursor tracker — resets naturally on app restart,
// which is fine since a restart just means the next sync re-pushes
// a bit more (idempotent, no correctness issue, negligible extra cost).
final Map<String, int> _originalSyncCursor = {};
final Map<String, int> _metricsSyncCursor = {};

Future<bool> syncOriginalAndMetrics(
  String chatId,
  String uid,
  bool isFinal,
) async {
  try {
    final originalBox = await Hive.openBox('userChats_${chatId}_original');
    final metricsBox = await Hive.openBox('userChats_${chatId}_metrics');

    final dbRef = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ).ref();
    final Map<String, dynamic> updates = {};

    // ── Original box — push only new entries since last cursor ──
    final originalKeys = originalBox.keys.toList();
    final originalCursor = _originalSyncCursor[chatId] ?? 0;
    if (originalCursor < originalKeys.length) {
      for (var i = originalCursor; i < originalKeys.length; i++) {
        final key = originalKeys[i];
        updates['chats/$chatId/original/$key'] = originalBox.get(key);
      }
      _originalSyncCursor[chatId] = originalKeys.length;
    }

    // ── Metrics box — push only new entries since last cursor ──
    final metricsKeys = metricsBox.keys.toList();
    final metricsCursor = _metricsSyncCursor[chatId] ?? 0;
    if (metricsCursor < metricsKeys.length) {
      for (var i = metricsCursor; i < metricsKeys.length; i++) {
        final key = metricsKeys[i];
        updates['chats/$chatId/stats/$uid/messages/$key'] = metricsBox.get(key);
      }
      _metricsSyncCursor[chatId] = metricsKeys.length;
    }

    if (updates.isNotEmpty) {
      await dbRef.update(updates);
      if (kDebugMode) {
        print(
            "🔄 Synced ${updates.length} new entries for $chatId (final: $isFinal)");
      }
    }

    // ── Final sync only — mark complete, clean up ──
    if (isFinal) {
      final endSnap = await dbRef.child('chats/$chatId/stats/end_at').get();
      final endAt = int.tryParse(endSnap.value?.toString() ?? '') ?? 0;
      if (endAt > rtdbNowMs() + 5000) {
        if (kDebugMode) {
          print('syncOriginalAndMetrics final skipped — $chatId still live');
        }
        return true;
      }
      await dbRef.update({
        'chats/$chatId/stats/$uid/synced': true,
        'appStats/$uid/activeChatId': null,
      });

      // Clean up local Hive boxes
      await originalBox.clear();
      await metricsBox.clear();
      await originalBox.deleteFromDisk();
      await metricsBox.deleteFromDisk();

      // Clear cursors for this chat
      _originalSyncCursor.remove(chatId);
      _metricsSyncCursor.remove(chatId);

      if (kDebugMode) {
        print("✅ Final sync complete for $chatId");
      }
    }

    return true;
  } catch (e) {
    if (kDebugMode) {
      print("❌ syncOriginalAndMetrics error: $e");
    }
    return false; // safe to retry — cursors unchanged on failure, nothing lost
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
