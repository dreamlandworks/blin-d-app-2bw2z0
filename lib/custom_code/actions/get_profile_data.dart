// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// This runs in less than 1 millisecond
Future<dynamic> getProfileData() async {
  var box = Hive.box('userProfile');
  // If it's empty, it returns null immediately
  return box.get('profile');
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
