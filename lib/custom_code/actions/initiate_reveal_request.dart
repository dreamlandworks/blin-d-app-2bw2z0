// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

Future<String?> initiateRevealRequest(String chatId, String partnerUid) async {
  var id = chatId.trim();
  if (id.isEmpty || id == 'null') {
    id = FFAppState().chatId.trim();
  }
  var partner = partnerUid.trim();
  if (partner.isEmpty || partner == 'null') {
    partner = FFAppState().partnerData.pUid?.id ?? '';
  }
  if (id.isEmpty || partner.isEmpty) {
    return null;
  }

  final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
  if (uid.isEmpty) {
    return null;
  }

  try {
    final rtdb = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          'https://blindapp-489217-default-rtdb.asia-southeast1.firebasedatabase.app/',
    );
    final coinSnap = await rtdb.ref('appStats/$uid/c').get();
    var coins = 0;
    final raw = coinSnap.value;
    if (raw is int) {
      coins = raw;
    } else if (raw is num) {
      coins = raw.toInt();
    } else {
      coins = int.tryParse(raw?.toString() ?? '') ?? 0;
    }
    if (coins != FFAppState().coins) {
      FFAppState().update(() {
        FFAppState().coins = coins;
      });
    }
    if (coins < 10) {
      if (kDebugMode) {
        print('initiateRevealRequest blocked — coins=$coins');
      }
      return '';
    }

    final result = await FirebaseFunctions.instanceFor(region: 'us-central1')
        .httpsCallable('placeRevealRequest')
        .call({
      'chatId': id,
      'chatID': id,
      'partnerUid': partner,
    });

    final data = result.data;
    if (data is Map && data['success'] == true) {
      return data['requestId']?.toString();
    }
    return null;
  } on FirebaseFunctionsException catch (e) {
    if (e.code == 'already-exists') {
      return id;
    }
    if (kDebugMode) {
      print('placeRevealRequest error: ${e.code} — ${e.message}');
    }
    return e.code == 'resource-exhausted' ? '' : null;
  }
}
