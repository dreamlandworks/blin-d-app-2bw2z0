// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<dynamic> getFromHive(
  String boxName,
  String path, // e.g., "profile.Verification.status"
) async {
  try {
    final box = Hive.isBoxOpen(boxName)
        ? Hive.box(boxName)
        : await Hive.openBox(boxName);

    // 1. Split the path into keys: ["profile", "Verification", "status"]
    List<String> keys = path.split('.');

    // 2. Get the root object from Hive
    dynamic current = box.get(keys.first);

    if (current == null) return null;

    // 3. Traverse the map for the remaining keys
    for (int i = 1; i < keys.length; i++) {
      if (current is Map && current.containsKey(keys[i])) {
        current = current[keys[i]];
      } else {
        // Path doesn't exist
        return null;
      }
    }

    return current;
  } catch (e) {
    if (kDebugMode) {
      print("Hive Get Error: $e");
    }
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
