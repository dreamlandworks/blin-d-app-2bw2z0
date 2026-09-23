// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/rtdb_now_ms.dart';
import '/custom_code/actions/watch_handshake_status.dart';

Map<String, dynamic> _asStringKeyedMap(dynamic raw) {
  if (raw is! Map) return {};
  return raw.map((key, value) => MapEntry(key.toString(), value));
}

List<String> _asStringList(dynamic value) {
  if (value == null) return [];
  if (value is List) {
    return value.map((e) => e.toString()).where((e) => e.isNotEmpty).toList();
  }
  if (value is String && value.isNotEmpty) {
    try {
      final decoded = jsonDecode(value);
      if (decoded is List) {
        return decoded
            .map((e) => e.toString())
            .where((e) => e.isNotEmpty)
            .toList();
      }
    } catch (_) {}
    return value == '[]' ? [] : [value];
  }
  return [];
}

/// Fills ActiveChat App State from handshake_accept callable or FCM data.
void applyHandshakeChatState(dynamic raw) {
  final data = _asStringKeyedMap(raw);
  final chatID = data['chatID']?.toString() ?? '';
  if (chatID.isEmpty || chatID == 'null') return;

  final endTimeVal = data['endTime'] is int
      ? data['endTime'] as int
      : int.tryParse(data['endTime']?.toString() ?? '') ?? 0;
  final startTimeVal = data['startTime'] is int
      ? data['startTime'] as int
      : int.tryParse(data['startTime']?.toString() ?? '') ?? 0;
  final durationMs = data['durationMs'] is int
      ? data['durationMs'] as int
      : int.tryParse(data['durationMs']?.toString() ?? '') ?? 0;
  var remaining = 0;
  if (endTimeVal > 1000000000000) {
    remaining = (endTimeVal - rtdbNowMs()).clamp(0, 7200000).toInt();
  } else if (durationMs > 0) {
    remaining = durationMs;
  } else if (endTimeVal > startTimeVal) {
    remaining = endTimeVal - startTimeVal;
  }

  final pUid = data['p_uid']?.toString() ?? '';
  DocumentReference? pUidRef;
  if (pUid.isNotEmpty && pUid != 'null') {
    pUidRef = FirebaseFirestore.instance.doc('users/$pUid');
  }
  final pIce = _asStringList(data['p_ice']);

  FFAppState().update(() {
    FFAppState().chatId = chatID;
    if (startTimeVal > 0) {
      FFAppState().startTime = startTimeVal;
    }
    if (endTimeVal > 0) {
      FFAppState().chatEndTime = endTimeVal;
    }
    if (durationMs > 0) {
      FFAppState().endTime = durationMs;
    } else if (remaining > 0) {
      FFAppState().endTime = remaining;
    }
    if (pUidRef != null) {
      FFAppState().partnerData = PartnerDataStruct(
        pUid: pUidRef,
        pName: data['p_name']?.toString() ?? FFAppState().partnerData.pName,
        pPhoto: data['p_photo']?.toString() ?? FFAppState().partnerData.pPhoto,
        pAge: data['p_age']?.toString() ?? FFAppState().partnerData.pAge,
        pGender:
            data['p_gender']?.toString() ?? FFAppState().partnerData.pGender,
        pDesc: data['p_desc']?.toString() ?? FFAppState().partnerData.pDesc,
        pBio: data['p_bio']?.toString() ?? FFAppState().partnerData.pBio,
        pInterests: _asStringList(data['p_interests']).isNotEmpty
            ? _asStringList(data['p_interests'])
            : FFAppState().partnerData.pInterests,
        pScore: data['p_score']?.toString() ?? FFAppState().partnerData.pScore,
        pStat: data['stat']?.toString() ?? FFAppState().partnerData.pStat,
        pIce: pIce.isNotEmpty ? pIce : FFAppState().partnerData.pIce,
      );
    }
    FFAppState().updateOnReadyStruct(
      (s) => s..readyStatus = 'chatting',
    );
  });
}

Future<dynamic> callHandshakeAction(
  String? handshakeID,
  String? slotFolderName,
  String action,
) async {
  var id = handshakeID?.trim() ?? '';
  var folder = slotFolderName?.trim() ?? '';
  if (id.isEmpty) {
    id = FFAppState().fcmHandShake.trim();
  }
  if (folder.isEmpty) {
    folder = FFAppState().fcmSlotID.trim();
  }
  if (id.isEmpty || folder.isEmpty) {
    return {
      'status': 'error',
      'message': 'Missing handshakeID or slotFolder',
    };
  }
  try {
    await rtdbNowMsAction();
    final result = await FirebaseFunctions.instanceFor(region: 'us-central1')
        .httpsCallable(
          'handshake_accept',
          options: HttpsCallableOptions(
            timeout: const Duration(seconds: 30),
          ),
        )
        .call({
      'handshakeID': id,
      'slotFolderName': folder,
      'slotFolder': folder,
      'action': action,
    });
    applyHandshakeChatState(result.data);
    final payload = _asStringKeyedMap(result.data);
    if (payload['status']?.toString() == 'waiting') {
      final ctx = appNavigatorKey.currentContext;
      if (ctx != null) {
        watchHandshakeStatus(ctx, id, folder);
      }
    }
    return result.data;
  } on FirebaseFunctionsException catch (e) {
    debugPrint('Handshake callable ${e.code}: ${e.message}');
    return {
      'status': 'error',
      'code': e.code,
      'message': e.message ?? e.code,
    };
  } catch (e) {
    debugPrint('Handshake Error: $e');
    return {'status': 'error', 'message': e.toString()};
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
