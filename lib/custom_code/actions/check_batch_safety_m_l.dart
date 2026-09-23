// Automatic FlutterFlow imports
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

import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart'; // FIX 1: Added this
import 'package:firebase_database/firebase_database.dart' as rtdb;
import 'package:google_mlkit_entity_extraction/google_mlkit_entity_extraction.dart';

Future checkBatchSafetyML(String chatID) async {
  // 1. Define Paths
  final String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
  final Box scrubbedBox = Hive.box('userChats_${chatID}_scrubbed');

  // 2. Filter for MY messages only
  List allMessages = scrubbedBox.values.toList();
  List myMessages = allMessages.where((m) => m['senderId'] == uid).toList();

// 3. Safety Check: Only proceed if we have at least 5 messages to check
  if (myMessages.length < 5) return;

  // 4. Grab last 5 and join into a blob
  int start = myMessages.length - 5;
  List lastFive = myMessages.sublist(start);
  String contextBlob = lastFive.map((m) => m['msg'] as String).join(" | ");

  // 3. Initialize AI Extractor
  final extractor = EntityExtractor(language: EntityExtractorLanguage.english);
  bool violationDetected = false;

  try {
    // 4. Run AI Analysis
    final List<EntityAnnotation> annotations =
        await extractor.annotateText(contextBlob);

    // Check for contextual PII (Addresses, Phones, etc.)
    if (annotations.isNotEmpty) {
      for (var annotation in annotations) {
        for (var entity in annotation.entities) {
          if (entity.type == EntityType.address ||
              entity.type == EntityType.phone ||
              entity.type == EntityType.email ||
              entity.type == EntityType.url) {
            violationDetected = true;
          }
        }
      }
    }

    // --- 2. Tone & Mood Detection (Non-Emoji Logic) ---
    // We analyze the "Context Blob" (your last 5 messages joined by " | ")

    List<String> messages = contextBlob.split(" | ");
    int totalWords = contextBlob.split(' ').length;
    double avgWordCount = totalWords / messages.length;

    // Logic: Identify "Pressure" (Short, repetitive questions)
    // vs "Engagement" (Longer, descriptive sentences)
    bool hasManyQuestions = RegExp(r'\?').allMatches(contextBlob).length > 2;
    bool isAggressive =
        contextBlob == contextBlob.toUpperCase() && totalWords > 4;

    String detectedMood = "Neutral";

    if (violationDetected) {
      detectedMood = "High Risk / Leaking";
    } else if (isAggressive) {
      detectedMood = "Aggressive (Caps)";
    } else if (hasManyQuestions && avgWordCount < 4) {
      detectedMood = "Pressuring / Tense";
    } else if (avgWordCount > 8) {
      detectedMood = "Engaged / Friendly";
    } else {
      detectedMood = "Casual";
    }

    // 6. Handle Violations
    if (violationDetected) {
      // Update RTDB Strike Count
      rtdb.DatabaseReference chatRef =
          rtdb.FirebaseDatabase.instance.ref("chats/$chatID/stats");
      await chatRef.child("vc").runTransaction((Object? current) {
        int count = (current as int? ?? 0) + 1;
        return rtdb.Transaction.success(count);
      });

      // Update Global State for UI Response
      FFAppState().update(() {
        FFAppState().lastViolationMsg =
            "Warning: Safety check triggered. PII or harmful patterns detected.";
      });
    }

    rtdb.DatabaseReference moodRef =
        rtdb.FirebaseDatabase.instance.ref("chats/$chatID/stats");

    // Build the new mood entry
    final newMoodEntry = {
      "mood": detectedMood,
      "ts": rtdb.ServerValue.timestamp,
    };

    // Get existing chat_mood list and append
    final snapshot = await moodRef.child("chat_mood").get();

    List<dynamic> moodHistory = [];
    if (snapshot.exists && snapshot.value != null) {
      // RTDB returns lists/maps, handle both cases
      final existing = snapshot.value;
      if (existing is List) {
        moodHistory = List<dynamic>.from(existing.whereType<Object>());
      } else if (existing is Map) {
        moodHistory = existing.values.toList();
      }
    }

    moodHistory.add(newMoodEntry);

    await moodRef.child("chat_mood").set(moodHistory);
  } catch (e) {
    if (kDebugMode) {
      print("AI Batch Check Error: $e");
    }
  } finally {
    extractor.close(); // Crucial for memory cleanup
  }
}
