// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';

String getDisplayImage(String? localPath, String? networkUrl) {
  if (kIsWeb) return networkUrl ?? '';

  if (localPath != null && localPath.isNotEmpty) {
    if (File(localPath).existsSync()) {
      return localPath;
    }
  }
  return networkUrl ?? '';
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
