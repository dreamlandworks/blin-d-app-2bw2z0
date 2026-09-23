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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> updateFirebaseUserPhoneNumber(
  String verificationId,
  String smsCode,
  String newPhoneNumber,
) async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (kDebugMode) {
        print('No authenticated user found.');
      }
      return false;
    }

    // 1. Build the AuthCredential with SMS verification details
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    // 2. Update the user's primary phone credential in Firebase Auth
    await user.updatePhoneNumber(credential);

    // 3. Update the Firestore user document at users/{uid}
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'phone_number': newPhoneNumber,
      'updated_at': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    return true;
  } catch (e) {
    if (kDebugMode) {
      print('Error updating phone number in Auth or Firestore: $e');
    }
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
