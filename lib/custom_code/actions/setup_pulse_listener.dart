// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

// Imports custom functions

// Imports custom functions

import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

final List<StreamSubscription> pulseSubscriptions = [];
bool pulseListenersStarted = false;
String? pulseListenersUid;

/// Helper function to format timestamp in milliseconds to "DD MMM YYYY" (e.g. "17 APR 2026")
String formatExpiryTimestamp(dynamic rawValue) {
  if (rawValue == null) return 'N/A';

  int? ms;
  if (rawValue is int) {
    ms = rawValue;
  } else if (rawValue is String) {
    ms = int.tryParse(rawValue);
  }

  if (ms == null || ms == 0) return 'N/A';

  DateTime date = DateTime.fromMillisecondsSinceEpoch(ms);

  const List<String> months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];

  String day = date.day.toString().padLeft(2, '0');
  String month = months[date.month - 1];
  String year = date.year.toString();

  return '$day $month $year';
}

Future setupPulseListener(String uid) async {
  if (pulseListenersStarted && pulseListenersUid == uid) {
    if (kDebugMode) {
      print('Pulse listeners already initialized for $uid');
    }
    return;
  }

  if (pulseListenersStarted && pulseListenersUid != uid) {
    await resetPulseListeners();
  }

  pulseListenersStarted = true;
  pulseListenersUid = uid;

  // 1. Reference to Database instance
  FirebaseDatabase database = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        "https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/",
  );

  // 2. References to RTDB nodes
  DatabaseReference pulseRef = database.ref("sync_pulses/$uid");
  DatabaseReference coinsRef = database.ref("appStats/$uid/c");
  DatabaseReference premiumRef = database.ref("appStats/$uid/is_premium");
  DatabaseReference expiryRef = database.ref("appStats/$uid/subs_expiry");

  // -------------------------------------------------------------
  // 1. SYNC PULSE LISTENER
  // -------------------------------------------------------------
  pulseSubscriptions.add(
    pulseRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        final data = event.snapshot.value;
        String pulseValue = data?.toString() ?? "0";

        FFAppState().update(() {
          FFAppState().currentPulse = pulseValue;
        });
        if (kDebugMode) {
          print("🐣 Pulse Updated: $pulseValue");
        }
      } else {
        if (kDebugMode) {
          print("🐣 No pulse found for user $uid");
        }
      }
    }, onError: (error) {
      if (kDebugMode) {
        print("❌ Pulse Listener Error: $error");
      }
    }),
  );

  // -------------------------------------------------------------
  // 2. COINS LISTENER (int)
  // -------------------------------------------------------------
  pulseSubscriptions.add(
    coinsRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        final rawData = event.snapshot.value;
        // Safely convert RTDB numeric data to Dart int
        int coinsValue = 0;
        if (rawData is int) {
          coinsValue = rawData;
        } else if (rawData is num) {
          coinsValue = rawData.toInt();
        } else if (rawData is String) {
          coinsValue = int.tryParse(rawData) ?? 0;
        }

        FFAppState().update(() {
          FFAppState().coins = coinsValue; // expects int in FFAppState
        });
        if (kDebugMode) {
          print("💰 Coins Updated: $coinsValue");
        }
      }
    }, onError: (error) {
      if (kDebugMode) {
        print("❌ Coins Listener Error: $error");
      }
    }),
  );

  // -------------------------------------------------------------
  // 3. IS_PREMIUM LISTENER (bool)
  // -------------------------------------------------------------
  pulseSubscriptions.add(
    premiumRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        final rawData = event.snapshot.value;

        // Safely parse boolean value
        bool isPremiumValue = false;
        if (rawData is bool) {
          isPremiumValue = rawData;
        } else if (rawData is String) {
          isPremiumValue = rawData.toLowerCase() == 'true';
        }

        FFAppState().update(() {
          FFAppState().isPremium = isPremiumValue; // expects bool in FFAppState
        });
        if (kDebugMode) {
          print("👑 Premium Status Updated: $isPremiumValue");
        }
      }
    }, onError: (error) {
      if (kDebugMode) {
        print("❌ Premium Listener Error: $error");
      }
    }),
  );

  // -------------------------------------------------------------
  // 4. SUBS EXPIRY LISTENER (Formatted String: "DD MMM YYYY")
  // -------------------------------------------------------------
  pulseSubscriptions.add(
    expiryRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        final rawData = event.snapshot.value;
        String formattedExpiry = formatExpiryTimestamp(rawData);

        FFAppState().update(() {
          FFAppState().expiryDate = formattedExpiry; // String state variable
        });
        if (kDebugMode) {
          print("📅 Expiry Date Updated: $formattedExpiry");
        }
      } else {
        FFAppState().update(() {
          FFAppState().expiryDate = "N/A";
        });
      }
    }, onError: (error) {
      if (kDebugMode) {
        print("❌ Expiry Listener Error: $error");
      }
    }),
  );
}
