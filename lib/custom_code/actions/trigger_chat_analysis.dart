// Automatic FlutterFlow imports
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

import 'dart:convert';
import 'package:http/http.dart' as http;

Future triggerChatAnalysis(String chatID) async {
  // 1. Your Cloud Function Trigger URL (Function 1)
  // Replace with the actual URL provided by GCP after deployment
  const String functionUrl =
      'https://aggregate-chat-data-ppj7q3agfq-uc.a.run.app';

  try {
    // 2. Send the ChatID to the backend
    final response = await http.post(
      Uri.parse(functionUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "chatID": chatID,
      }),
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("✅ Function 1 Triggered: Aggregation started for $chatID");
      }
    } else {
      if (kDebugMode) {
        print("❌ Trigger failed: ${response.statusCode} - ${response.body}");
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print("❌ Error calling Cloud Function: $e");
    }
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
