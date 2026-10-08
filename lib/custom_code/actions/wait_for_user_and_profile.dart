// Automatic FlutterFlow imports
import '/backend/backend.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

// Custom Action: waitForUserAndProfile() -> Future<Map<String, dynamic>?>
// Returns user data map with display_name, or null if not authenticated
// waitForUserAndProfile() -> Future<String>
// Returns JSON string: {"displayName": "...", "uid": "..."} or "null" if not logged in
//
// checkProfileReady.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import '/custom_code/actions/expire_cooldown_if_due.dart';

Future<String> waitForUserAndProfile() async {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  // 1. Wait for auth (max 5s)
  User? user = auth.currentUser;
  if (user == null) {
    final completer = Completer<User?>();
    late StreamSubscription<User?> sub;
    sub = auth.authStateChanges().listen((u) {
      if (!completer.isCompleted) {
        completer.complete(u);
        sub.cancel();
      }
    });
    user = await completer.future.timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        sub.cancel();
        return null;
      },
    );
  }

  if (user == null) return 'auth_failed';

  // 2. Fresh token (ensures backend sees current user)
  await user.getIdToken(true);

  // 3. Single Firestore read (server + cache)
  final doc = await firestore
      .collection('users')
      .doc(user.uid)
      .get(const GetOptions(source: Source.serverAndCache))
      .timeout(const Duration(seconds: 8));

  if (!doc.exists || doc.data() == null) return 'onboarding';

  final data = doc.data()!;
  final name = data['display_name'] ?? data['displayName'] ?? '';
  if (name.isEmpty) {
    return 'onboarding';
  }
  await expireCooldownIfDue();
  return 'success';
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
