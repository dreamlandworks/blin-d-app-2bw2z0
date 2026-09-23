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
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '/custom_code/actions/rtdb_now_ms.dart';

Future processAndSendFlow(
  String chatID,
  String inputMessage,
  dynamic metrics,
) async {
  // 👈 2. DECODE THE METRICS STRING BACK INTO A MAP
  Map<String, dynamic> actualMetricsMap = {};
  if (kDebugMode) {
    print("Metrics received are: $metrics");
  }
  if (metrics is String) {
    try {
      // If the widget sent a JSON string, decode it
      actualMetricsMap = jsonDecode(metrics);
    } catch (e) {
      // If decoding fails, it means 'metrics' was accidentally sent the Message Text
      if (kDebugMode) {
        print("Error: Metrics parameter received a non-JSON string: $metrics");
      }
    }
  } else if (metrics is Map) {
    actualMetricsMap = Map<String, dynamic>.from(metrics);
  }

  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final rtdb = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
  );
  await ensureRtdbClock(rtdb);
  final msgRef = rtdb.ref("chats/$chatID/messages").push();
  final String msgID = msgRef.key ?? rtdbNowMs().toString();
  final int timestamp = rtdbNowMs();
  //final inputMessage = inputs['message'] as String;
  // 1. Run your cleanMessage Logic (Snippet integrated)
  // Regex Function Ends
  final cleanedData = await internalCleanMessage(inputMessage);
  String scrubbedText = cleanedData['inputMessage'] as String;
  bool isFlagged = cleanedData['isFlagged'] as bool;

  // 2. Access Hive "userChats" sub-folders
  // We open boxes based on your folder-like structure
  final originalBox = await Hive.openBox('userChats_${chatID}_original');
  final scrubbedBox = await Hive.openBox('userChats_${chatID}_scrubbed');
  final metricsBox = await Hive.openBox('userChats_${chatID}_metrics');
  // 1. Get the current timestamp and UID

  // 3. Save to Original Box (The Audit Log)
  await originalBox.put(msgID, {
    'senderId': uid,
    'msg': inputMessage,
    'ts': timestamp,
  });

// 4. Save to Scrubbed Box (The AI Audit Target)
  await scrubbedBox.put(msgID, {
    'senderId': uid,
    'msg': scrubbedText,
    'ts': timestamp,
  });

// 5. Save to Metrics Box (For Analytics)
  await metricsBox.put(msgID, {
    ...actualMetricsMap,
    'senderId': uid,
    'isFlagged': isFlagged,
    'ts': msgID,
  });

  Map<String, dynamic> newMessage = {
    'msg': scrubbedText,
    'senderId': uid,
    'ts': ServerValue.timestamp,
  };

  await msgRef.set(newMessage);

  if (isFlagged) {
    // You can trigger your "Red Popup" here via a Page State update
    // The correct way to update FFAppState from a Custom Action
    FFAppState().update(() {
      FFAppState().lastViolationMsg = scrubbedText;
    });
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
