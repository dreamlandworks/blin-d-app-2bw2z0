// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:flutter/foundation.dart';

Future<String?> sendPhoneVerificationCode(String phoneNumber) async {
  final Completer<String?> completer = Completer<String?>();

  try {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieval or instant verification (optional handling)
      },
      verificationFailed: (FirebaseAuthException e) {
        //print('Phone verification failed: ${e.message}');
        if (!completer.isCompleted) {
          completer.complete(null);
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        if (kDebugMode) {
          print('SMS Code sent. Verification ID: $verificationId');
        }
        if (!completer.isCompleted) {
          completer.complete(verificationId);
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        if (!completer.isCompleted) {
          completer.complete(verificationId);
        }
      },
    );
  } catch (e) {
    //print('Error sending SMS code: $e');
    if (!completer.isCompleted) {
      completer.complete(null);
    }
  }

  return completer.future;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
