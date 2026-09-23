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

Future saveToHive(
  String boxName,
  String path, // e.g., "profile.Verification.status"
  dynamic newValue,
) async {
  try {
    final box = Hive.isBoxOpen(boxName)
        ? Hive.box(boxName)
        : await Hive.openBox(boxName);
    List<String> keys = path.split('.');

    // 1. Get the root object (e.g., 'profile')
    dynamic root = box.get(keys.first);

    if (root == null || root is! Map) {
      if (kDebugMode) {
        print(
            "Update Error: Root object '${keys.first}' not found or not a Map.");
      }
      return;
    }

    // Create a mutable copy of the map so we can modify it
    Map<String, dynamic> data = Map<String, dynamic>.from(root);
    dynamic current = data;

    // 2. Traverse to the parent of the final key
    for (int i = 1; i < keys.length - 1; i++) {
      String key = keys[i];
      if (current[key] is Map) {
        // Ensure nested maps are also mutable
        current[key] = Map<String, dynamic>.from(current[key]);
        current = current[key];
      } else {
        if (kDebugMode) {
          print("Update Error: Path ${keys[i]} is not a Map.");
        }
        return;
      }
    }

    // 3. Set the new value at the final key
    current[keys.last] = newValue;

    // 4. Save the modified root back to Hive
    await box.put(keys.first, data);

    if (kDebugMode) {
      print("Hive Update Success: $path set to $newValue");
    }
  } catch (e) {
    if (kDebugMode) {
      print("Hive Update Error: $e");
    }
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
