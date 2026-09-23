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
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _rtdbUrl =
    'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/';
const _lastFcmStorageKey = 'ff_last_fcm_token';
const _secureStorage = FlutterSecureStorage();

DateTime? parseDob(dynamic dobValue) {
  if (dobValue == null) return null;
  if (dobValue is Timestamp) return dobValue.toDate();
  if (dobValue is DateTime) return dobValue;
  if (dobValue is String) return DateTime.tryParse(dobValue);
  if (dobValue is int) {
    return DateTime.fromMillisecondsSinceEpoch(dobValue);
  }
  return null;
}

int calculateAge(dynamic dobValue) {
  final birthDate = parseDob(dobValue);
  if (birthDate == null) return 0;
  final today = DateTime.now();
  int age = today.year - birthDate.year;
  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }
  return age;
}

List<String> _orderedFcmTokens(dynamic value) {
  if (value == null) return [];
  if (value is String && value.trim().length >= 20) {
    return [value.trim()];
  }
  if (value is Iterable) {
    return value
        .map((e) => e.toString().trim())
        .where((t) => t.length >= 20 && t != 'true' && t != 'false')
        .toList();
  }
  if (value is Map) {
    final entries = value.entries.toList()
      ..sort((a, b) {
        final ai = int.tryParse(a.key.toString()) ?? 0;
        final bi = int.tryParse(b.key.toString()) ?? 0;
        return ai.compareTo(bi);
      });
    return entries
        .map((e) => e.value.toString().trim())
        .where((t) => t.length >= 20 && t != 'true' && t != 'false')
        .toList();
  }
  return [];
}

Future<String?> _readLastLocalFcm() async {
  try {
    return await _secureStorage.read(key: _lastFcmStorageKey);
  } catch (_) {
    return null;
  }
}

Future<void> _writeLastLocalFcm(String token) async {
  try {
    await _secureStorage.write(key: _lastFcmStorageKey, value: token);
  } catch (_) {}
}

/// Two live devices: [0] this/newest, [1] the other device.
/// Same-device refresh: replace this install's old token, keep the other device.
List<String> _rotateFcmSlots(
  List<String> current,
  String newToken,
  String? previousLocalToken,
) {
  final token = newToken.trim();
  if (token.length < 20) {
    return current.take(2).toList();
  }
  var slots = current.take(2).toList();

  if (slots.isNotEmpty && slots[0] == token) {
    return slots;
  }
  if (slots.length > 1 && slots[1] == token) {
    return [token, slots[0]];
  }

  final oldLocal = (previousLocalToken ?? '').trim();
  if (oldLocal.length >= 20 && oldLocal != token) {
    final idx = slots.indexOf(oldLocal);
    if (idx >= 0) {
      slots[idx] = token;
      if (idx != 0) {
        slots = [token, ...slots.where((t) => t != token)];
      }
      return slots.take(2).toList();
    }
  }

  if (slots.isEmpty) {
    return [token];
  }
  return [token, slots[0]];
}

bool _sameTokenList(List<String> a, List<String> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

Future<void> _writeFcmSlotsToRtdb(String uid, List<String> slots) async {
  final rtdb = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: _rtdbUrl,
  );
  await rtdb.ref('appStats/$uid/f').set(slots);
  for (final bucket in ['verified', 'unverified']) {
    final parent = await rtdb.ref('matching_data/$bucket/$uid').get();
    if (parent.exists) {
      await rtdb.ref('matching_data/$bucket/$uid/f').set(slots);
    }
  }
}

/// Keeps at most two tokens: [0] = newest device, [1] = previous.
/// A new login inserts at [0] and drops the old [1].
Future<List<String>> upsertRotatedFcmToken(
  DocumentReference userRef,
  String newToken,
) async {
  final live = newToken.trim();
  if (live.length < 20) return [];

  List<String> current = [];
  try {
    final snap = await userRef.get();
    if (snap.exists) {
      final profile = Map<String, dynamic>.from(snap.data() as Map);
      current = _orderedFcmTokens(profile['fcm_token']);
    }
  } catch (e) {
    if (kDebugMode) {
      print('upsertRotatedFcmToken read error: $e');
    }
  }

  final previousLocal = await _readLastLocalFcm();
  final slots = _rotateFcmSlots(current, live, previousLocal);
  try {
    await userRef.update({'fcm_token': slots});
  } catch (e) {
    if (kDebugMode) {
      print('upsertRotatedFcmToken Firestore write error: $e');
    }
  }
  try {
    await _writeFcmSlotsToRtdb(userRef.id, slots);
    await _writeLastLocalFcm(live);
    if (kDebugMode) {
      print(
          'FCM rotate: users/${userRef.id}.fcm_token and appStats/${userRef.id}/f = ${slots.length} slot(s).');
    }
  } catch (e) {
    if (kDebugMode) {
      print('upsertRotatedFcmToken RTDB write error: $e');
    }
  }
  return slots;
}

Future mirrorMatchingDataToRTDB(
  DocumentReference? userRef,
  String userId,
  String currentPulse,
) async {
  // Add your function code here!
  if (userRef == null) return;

  try {
    final rtdb = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
    );

    // --- SMART GATE: Check RTDB Timestamp first ---
    // We check the specific bucket (verified or unverified) would be complex,
    // so we check a "last_mirrored" node or the data directly.
    // For simplicity and maximum savings, we look at the existing 'ts'

    final snapshotVerified =
        await rtdb.ref('matching_data/verified/$userId').get();
    final snapshotUnverified =
        await rtdb.ref('matching_data/unverified/$userId').get();

    final snapshot = await userRef.get();
    if (!snapshot.exists) return;
    final Map<String, dynamic> profile =
        snapshot.data() as Map<String, dynamic>;

    final firestoreTokens = _orderedFcmTokens(profile['fcm_token']).take(2).toList();
    final rtdbTokens = _orderedFcmTokens(
      (await rtdb.ref('appStats/$userId/f').get()).value,
    );
    if (firestoreTokens.isNotEmpty &&
        !_sameTokenList(firestoreTokens, rtdbTokens)) {
      await _writeFcmSlotsToRtdb(userId, firestoreTokens);
    }

    final existingData = snapshotVerified.value ?? snapshotUnverified.value;
    if (existingData is Map) {
      final existingTs = existingData['ts']?.toString();
      final existingGender = existingData['g']?.toString() ?? '';
      final existingAge = existingData['a'] is int
          ? existingData['a'] as int
          : int.tryParse(existingData['a']?.toString() ?? '') ?? 0;

      // Skip only when pulse matches AND age/gender were already mirrored.
      if (existingTs == currentPulse &&
          existingGender.isNotEmpty &&
          existingAge > 0) {
        if (kDebugMode) {
          print("Smart Gate: No changes detected. Skipping RTDB write.");
        }
        return;
      }
    }

    // 2. Routing & Status
    final verification = profile['Verification'] as Map<String, dynamic>? ??
        profile['verification'] as Map<String, dynamic>?;
    String status = verification?['status'] ?? 'guest';
    String bucket = (status == 'guest') ? 'unverified' : 'verified';
    bool verificationState = (status == 'guest') ? false : true;

    if (status == 'banned') {
      await rtdb.ref('matching_data/verified/$userId').remove();
      await rtdb.ref('matching_data/unverified/$userId').remove();
      return;
    }

    // 3. Data Extraction
    final photos = profile['photo_file_paths'] as Map<String, dynamic>?;
    final preferences = profile['preferences'] as Map<String, dynamic>?;
    final realId = profile['real_id'] as Map<String, dynamic>?;
    final aiPersona = profile['ai_persona'] as Map<String, dynamic>?;

    final matchingData = {
      'p': {
        'd': aiPersona?['three_word_desc'] ?? '',
        'b': aiPersona?['summary_bio'] ?? '',
        'r': aiPersona?['romantic'] ?? {},
      },
      'a': calculateAge(realId?['dob']),
      'i': List<String>.from(preferences?['interests'] ?? []),
      'l': preferences?['looking_for'] ?? '',
      'g': realId?['gender'] ?? '',
      'in': preferences?['interested_in'] ?? '',
      'u': photos?['gcsThumbUrl'] ?? '',
      'n': profile['display_name'] ?? '',
      'f': firestoreTokens,
      'ts': currentPulse, // Store the Pulse as the timestamp
    };

    // 4. PUSH TO RTDB
    await rtdb.ref('matching_data/$bucket/$userId').set(matchingData);
    await rtdb.ref('appStats/$userId').update({'vs': verificationState});
    if (kDebugMode) {
      print(
          "RTDB Mirror Success: $bucket pool updated with Pulse $currentPulse.");
    }
  } catch (e) {
    if (kDebugMode) {
      print("RTDB Mirror Error: $e");
    }
  }
}
