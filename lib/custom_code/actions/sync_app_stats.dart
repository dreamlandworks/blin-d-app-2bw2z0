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

import 'package:firebase_database/firebase_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future syncAppStats(
  String uid,
  int? coins,
  int? chatsCount,
  DateTime? lastActive,
  double? avgScore,
  DateTime? expiryAt,
  DateTime? profileUpdatedAt,
  DateTime? personaUpdatedAt,
  bool? verifiedStatus,
) async {
  // Add your function code here!
  final box = await Hive.openBox('app_stats');
  final database = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
  );

  // 2. Create the reference directly to the UID path
  final DatabaseReference ref = database.ref("app_stats/$uid");

  Map<String, dynamic> currentData = {};

  // 1. Check if local data exists
  if (box.containsKey(uid)) {
    // Found in Hive: Load it
    currentData = Map<String, dynamic>.from(box.get(uid));
    if (kDebugMode) {
      print("📦 Found local stats for $uid");
    }
  } else {
    // Not in Hive: Bootstrap from RTDB
    if (kDebugMode) {
      print("🔍 Local stats missing. Fetching from RTDB...");
    }
    final snapshot = await ref.get();
    if (snapshot.exists) {
      currentData = Map<String, dynamic>.from(snapshot.value as Map);
      if (kDebugMode) {
        print("📥 Bootstrapped from RTDB");
      }
    } else {
      if (kDebugMode) {
        print("✨ No remote stats found. Creating new entry.");
      }
    }
  }

  // 2. Map DateTime to Epoch (Int)
  int? toEpoch(DateTime? dt) => dt?.millisecondsSinceEpoch;

  // 3. Selective Update (Partial)
  // Using your short-keys: c, cc, la, as, ex, pu, psu, st
  if (coins != null) currentData['c'] = coins;
  if (chatsCount != null) currentData['cc'] = chatsCount;
  if (lastActive != null) currentData['la'] = toEpoch(lastActive);
  if (avgScore != null) currentData['as'] = avgScore;
  if (expiryAt != null) currentData['ex'] = toEpoch(expiryAt);
  if (profileUpdatedAt != null) currentData['pu'] = toEpoch(profileUpdatedAt);
  if (personaUpdatedAt != null) currentData['psu'] = toEpoch(personaUpdatedAt);
  if (verifiedStatus != null) currentData['vs'] = verifiedStatus;

  // 4. Atomic Save to Local Hive
  await box.put(uid, currentData);

  // 5. Sync to RTDB
  try {
    // We use update() here because it's more efficient for partials
    // and ensures we don't overwrite other fields if the bootstrap missed something

    await database.ref("app_stats/$uid").update(currentData);
    if (kDebugMode) {
      print("✅ Successfully synced stats for $uid");
    }
  } catch (e) {
    if (kDebugMode) {
      print("❌ Firebase Sync Error: $e");
    }
  }
}
