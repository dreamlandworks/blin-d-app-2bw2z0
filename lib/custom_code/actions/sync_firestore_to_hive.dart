// Automatic FlutterFlow imports
import '/backend/backend.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

Future syncFirestoreToHive(
    DocumentReference? userRef, String hiveBoxName) async {
  if (userRef == null) return;

  try {
    final box = Hive.isBoxOpen(hiveBoxName)
        ? Hive.box(hiveBoxName)
        : await Hive.openBox(hiveBoxName);
    DocumentSnapshot snapshot = await userRef.get();

    if (!snapshot.exists) return;

    // 1. Get the data as a raw Map
    final rawData = snapshot.data() as Map<String, dynamic>;

    // 2. RECURSIVE CLEANER with explicit String key casting
    dynamic cleanDataForHive(dynamic value) {
      if (value is Timestamp) {
        return value.toDate().toIso8601String();
      } else if (value is Map) {
        // Here is the fix: We map the entries and ensure keys are cast to Strings
        return value
            .map((key, val) => MapEntry(key.toString(), cleanDataForHive(val)));
      } else if (value is List) {
        return value.map((item) => cleanDataForHive(item)).toList();
      } else if (value is DocumentReference) {
        return value.path;
      }
      return value;
    }

    // 3. Clean and explicitly cast the final result
    final cleanedResult = cleanDataForHive(rawData);

    if (cleanedResult is Map) {
      // Create a typed map from the cleaned dynamic map
      final Map<String, dynamic> finalMap =
          Map<String, dynamic>.from(cleanedResult);
      await box.put('profile', finalMap);
      if (kDebugMode) {
        print("Sync Success: Profile saved to Hive.");
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print("Sync Error: $e");
    }
  }
}
