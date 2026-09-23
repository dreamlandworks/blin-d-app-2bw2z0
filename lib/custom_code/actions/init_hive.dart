// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future initHive() async {
  try {
    ui.channelBuffers.resize('flutter/lifecycle', 10);
  } catch (_) {}
  await Hive.initFlutter();
  await Hive.openBox('userProfile');
  await Hive.openBox('userChats');
  await Hive.openBox('userStats');
  // Add any other boxes you need here
  if (kDebugMode) {
    print("Hive: Boxes open and are ready");
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
