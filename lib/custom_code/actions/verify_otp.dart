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

Future<bool> verifyOtp(String verificationId, String smsCode) async {
  if (verificationId.isEmpty) {
    throw Exception('No verification ID. Request OTP first.');
  }

  try {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode.trim(),
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    return true;
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'invalid-verification-code':
        throw Exception('Wrong OTP. Try again.');
      case 'session-expired':
        throw Exception('OTP expired. Request a new one.');
      default:
        throw Exception(e.message ?? 'Verification failed (${e.code})');
    }
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
