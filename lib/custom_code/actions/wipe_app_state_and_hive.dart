// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:hive_flutter/hive_flutter.dart';
// To reset specific DataStructs if needed

Future wipeAppStateAndHive() async {
  // 1. Clear the FlutterFlow App State in memory
  FFAppState().update(() {
    // Manually reset your key variables to their defaults here
    // Example:
    FFAppState().partnerData = PartnerDataStruct();
    FFAppState().mobile = '';
    FFAppState().currentPulse = '';
    FFAppState().appStatsRtdb = AppStatsRtdbStruct();
    FFAppState().onReady = OnReadyStruct();
    FFAppState().isSearching = false;

    // Add any other critical persistent variables here
  });

  // 2. Wipe the actual Hive boxes from disk
  // FlutterFlow typically stores persisted state in a box named 'ff_user_push_notifications'
  // or 'flutterflow_app_state'. We can clear all boxes that aren't system-critical.

  try {
    // This clears all data in all currently open Hive boxes
    // WARNING: This may also clear local push notification tokens,
    // but those are repopulated on the next login/initialization.
    await Hive.close();
    await Hive.deleteFromDisk();

    await Hive.openBox('userProfile');
    await Hive.openBox('userChats');
    await Hive.openBox('userStats');

    if (kDebugMode) {
      print("Successfully wiped Hive and AppState.");
    }
  } catch (e) {
    if (kDebugMode) {
      print("Error wiping Hive: $e");
    }
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
