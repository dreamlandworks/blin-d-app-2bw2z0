// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

Future enableChatScreenGuard() async {
  try {
    await const MethodChannel('blin_d/secure_screen').invokeMethod('enable');
  } catch (e) {
    if (kDebugMode) {
      print('enableChatScreenGuard: $e');
    }
  }
}
