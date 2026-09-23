// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

// Imports other custom actions

// Imports other custom actions

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

Future permProcessAndSendFlow(
  String chatID,
  String inputMessage,
  dynamic metrics,
) async {
  // 1. Decode metrics parameter into a Map
  Map<String, dynamic> actualMetricsMap = {};
  if (kDebugMode) {
    print("Metrics received are: $metrics");
  }
  if (metrics is String) {
    try {
      actualMetricsMap = jsonDecode(metrics);
    } catch (e) {
      if (kDebugMode) {
        print("Error: Metrics parameter received a non-JSON string: $metrics");
      }
    }
  } else if (metrics is Map) {
    actualMetricsMap = Map<String, dynamic>.from(metrics);
  }

  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final String msgID = DateTime.now().millisecondsSinceEpoch.toString();
  final int timestamp = DateTime.now().millisecondsSinceEpoch;

  // 2. Clean message content using internal moderation logic
  final cleanedData = await internalCleanMessage(inputMessage);
  String scrubbedText = cleanedData['inputMessage'] as String;
  bool isFlagged = cleanedData['isFlagged'] as bool;

  // 3. Save entries locally in Hive sub-boxes
  final originalBox = await Hive.openBox('userChats_${chatID}_original');
  final scrubbedBox = await Hive.openBox('userChats_${chatID}_scrubbed');
  final metricsBox = await Hive.openBox('userChats_${chatID}_metrics');

  // Save to Original Box
  await originalBox.put(msgID, {
    'senderId': uid,
    'msg': inputMessage,
    'ts': timestamp,
  });

  // Save to Scrubbed Box
  await scrubbedBox.put(msgID, {
    'senderId': uid,
    'msg': scrubbedText,
    'ts': timestamp,
  });

  // Save to Metrics Box
  await metricsBox.put(msgID, {
    ...actualMetricsMap,
    'senderId': uid,
    'isFlagged': isFlagged,
    'ts': msgID,
  });

  // 4. Update Realtime Database under perm/$chatID
  final rtdb = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
  );

  final Map<String, dynamic> rtdbUpdates = {};

  // Real-time Message Node: perm/$chatID/messages/$msgID
  rtdbUpdates["perm/$chatID/messages/$msgID"] = {
    'msg': scrubbedText,
    'senderId': uid,
    'ts': timestamp,
  };

  // Live Metrics Node under perm/$chatID/stats/$uid/messages/$msgID
  rtdbUpdates["perm/$chatID/stats/$uid/messages/$msgID"] = {
    ...actualMetricsMap,
    'f': isFlagged ? 1 : 0,
    'ts': timestamp,
  };

  // Execute atomic RTDB write
  await rtdb.ref().update(rtdbUpdates);

  // 5. App State Update for moderation flags
  if (isFlagged) {
    FFAppState().update(() {
      FFAppState().lastViolationMsg = scrubbedText;
    });
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
