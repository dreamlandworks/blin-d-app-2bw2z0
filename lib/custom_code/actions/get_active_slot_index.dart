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

Future<int?> getActiveSlotIndex(
  String readyStatus,
  List<int>? slotTimers,
) async {
  // 1. If chatting, user is busy. Return null.
  if (readyStatus == 'chatting' || slotTimers == null || slotTimers.isEmpty) {
    if (kDebugMode) {
      print("slotTimers is null or Empty");
    }
    return null;
  }

  // 2. Map timestamps to their original indices: {timestamp: originalIndex}
  // Example: {1711041000: 0, 1711051000: 1 ...}
  Map<int, int> originMap = {};
  for (int i = 0; i < slotTimers.length; i++) {
    originMap[slotTimers[i]] = i;
  }

  // 3. Create a sorted version of the timestamps
  List<int> sortedTimers = List<int>.from(slotTimers)..sort();

  int now = DateTime.now().millisecondsSinceEpoch;

  // 4. Find the first slot that has NOT started yet
  for (int timestamp in sortedTimers) {
    if (timestamp > now) {
      // Return the index this timestamp HAD in the original list
      return originMap[timestamp];
    }
  }

  // 5. If all slots have started, return null
  if (kDebugMode) {
    print("All Slots have started");
  }
  return null;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
