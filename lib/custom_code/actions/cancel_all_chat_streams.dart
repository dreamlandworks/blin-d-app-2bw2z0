// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

// Reference the global file-level subscription placeholders
StreamSubscription<DatabaseEvent>?
    messageStreamSubscription; // Your chatID/messages stream
StreamSubscription<DatabaseEvent>?
    feelingStreamSubscription; // Your chatID/feeling stream
StreamSubscription<DatabaseEvent>? chatStatsSubscription;

Future cancelAllChatStreams() async {
  if (feelingStreamSubscription != null) {
    await feelingStreamSubscription!.cancel();
    feelingStreamSubscription = null;
  }

  if (messageStreamSubscription != null) {
    await messageStreamSubscription!.cancel();
    messageStreamSubscription = null;
  }

  if (chatStatsSubscription != null) {
    await chatStatsSubscription!.cancel();
    chatStatsSubscription = null;
  }

  if (kDebugMode) {
    print("🧹 All deep path sockets for this chat ID closed cleanly.");
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
