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
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_functions/cloud_functions.dart';

// In-memory cursor trackers
final Map<String, int> _originalSyncCursor = {};
final Map<String, int> _metricsSyncCursor = {};

Future<bool> permSyncOriginalAndMetrics(
  String chatId,
  String uid,
  bool isFinal,
) async {
  try {
    final originalBox = await Hive.openBox('userChats_${chatId}_original');
    final metricsBox = await Hive.openBox('userChats_${chatId}_metrics');

    final dbRef = FirebaseDatabase.instance.ref();
    final Map<String, dynamic> updates = {};

    // ── 1. Original messages — push incremental entries ──
    final originalKeys = originalBox.keys.toList();
    final originalCursor = _originalSyncCursor[chatId] ?? 0;
    if (originalCursor < originalKeys.length) {
      for (var i = originalCursor; i < originalKeys.length; i++) {
        final key = originalKeys[i].toString();
        updates['perm/$chatId/original/$key'] = originalBox.get(key);
      }
      _originalSyncCursor[chatId] = originalKeys.length;
    }

    // ── 2. Metrics — push incremental entries ──
    final metricsKeys = metricsBox.keys.toList();
    final metricsCursor = _metricsSyncCursor[chatId] ?? 0;
    if (metricsCursor < metricsKeys.length) {
      for (var i = metricsCursor; i < metricsKeys.length; i++) {
        final key = metricsKeys[i].toString();
        updates['perm/$chatId/stats/$uid/messages/$key'] = metricsBox.get(key);
      }
      _metricsSyncCursor[chatId] = metricsKeys.length;
    }

    // Push batch updates to RTDB
    if (updates.isNotEmpty) {
      await dbRef.update(updates);
      if (kDebugMode) {
        print(
            "🔄 Synced ${updates.length} new entries for $chatId (isFinal: $isFinal)");
      }
    }

    // ── 3. Final sync logic ──
    if (isFinal) {
      // Mark metric sync complete for this user
      await dbRef.child('perm/$chatId/stats/$uid').update({
        'synced': true,
        'synced_at': ServerValue.timestamp,
      });

      // Clean up local Hive boxes
      await originalBox.clear();
      await metricsBox.clear();
      await originalBox.deleteFromDisk();
      await metricsBox.deleteFromDisk();

      _originalSyncCursor.remove(chatId);
      _metricsSyncCursor.remove(chatId);

      if (kDebugMode) {
        print("✅ Final sync complete for $chatId");
      }

      // Check if deletion was requested by partner
      final deletionCheckSnap =
          await dbRef.child('perm/$chatId/stats/deletion_requested_by').get();

      if (deletionCheckSnap.exists) {
        if (kDebugMode) {
          print("🚀 Calling deletePermConnection Cloud Function directly...");
        }

        final HttpsCallable callable = FirebaseFunctions.instanceFor(
          region: 'us-central1', // Replace with your region if different
        ).httpsCallable('deletePermConnection');

        final response = await callable.call(<String, dynamic>{
          'chatId': chatId,
        });

        if (kDebugMode) {
          print("⚡ deletePermConnection response: ${response.data}");
        }
      }
    }

    return true;
  } catch (e) {
    if (kDebugMode) {
      print("❌ permSyncOriginalAndMetrics error: $e");
    }
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
