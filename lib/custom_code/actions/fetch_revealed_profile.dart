// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '/flutter_flow/flutter_flow_util.dart';

final Map<String, Map<String, dynamic>> revealedProfileCache = {};

dynamic jsonSafe(dynamic value) {
  if (value == null) return null;
  if (value is num || value is bool || value is String) return value;
  if (value is List) return value.map(jsonSafe).toList();
  if (value is Map) {
    return value.map((key, val) => MapEntry(key.toString(), jsonSafe(val)));
  }
  return value.toString();
}

void rebuildRevealedPages() {
  final root = WidgetsBinding.instance.rootElement;
  if (root == null) return;
  void walk(Element el) {
    if (el is StatefulElement) {
      final name = el.state.runtimeType.toString();
      if (name.contains('PublicPersona') || name.contains('Vibes')) {
        try {
          // Rebuild the FlutterFlow page after fetchProfile is assigned.
          // ignore: invalid_use_of_protected_member
          el.state.setState(() {});
        } catch (_) {}
      }
    }
    el.visitChildren(walk);
  }

  walk(root);
}

void bumpUiAfterAssign() {
  scheduleMicrotask(() {
    FFAppState().update(() {});
    rebuildRevealedPages();
  });
}

void applyRevealedProfileToAppState(dynamic profile) {
  if (profile is! Map) return;
  final photo = profile['photo']?.toString() ?? '';
  final name = profile['full_name']?.toString() ?? '';
  final age = profile['age']?.toString() ?? '';
  final gender = profile['gender']?.toString() ?? '';
  final bio = profile['summary_bio']?.toString() ?? '';
  final phone = profile['phone']?.toString() ?? '';
  final email = profile['email']?.toString() ?? '';
  final location = (profile['location_display'] ?? profile['location_city'])
          ?.toString() ??
      '';
  final social = profile['social'];
  final socialBits = <String>[];
  if (social is Map) {
    social.forEach((key, val) {
      final text = val?.toString() ?? '';
      if (text.isNotEmpty) socialBits.add(text);
    });
  }
  FFAppState().update(() {
    FFAppState().updateChatStatsStruct((s) {
      s.isRevealed = true;
    });
    FFAppState().updatePartnerDataStruct((s) {
      if (photo.isNotEmpty) s.pPhoto = photo;
      if (name.isNotEmpty) s.pName = name;
      if (age.isNotEmpty && age != 'null') s.pAge = age;
      if (gender.isNotEmpty) s.pGender = gender;
      if (bio.isNotEmpty) s.pBio = bio;
      if (phone.isNotEmpty) s.pStat = phone;
      if (email.isNotEmpty) s.pDesc = email;
      if (location.isNotEmpty && s.pDesc.isEmpty) s.pDesc = location;
      if (socialBits.isNotEmpty) s.pInterests = socialBits;
    });
  });
}

String resolvePartnerUid(String partnerUid) {
  var uid = partnerUid.trim();
  if (uid.isEmpty || uid == 'null') {
    uid = FFAppState().partnerData.pUid?.id ?? '';
  }
  return uid.trim();
}

Future<dynamic> fetchRevealedProfile(
  String partnerUid,
) async {
  final uid = resolvePartnerUid(partnerUid);
  if (uid.isEmpty) {
    return {
      'success': false,
      'errorCode': 'invalid-argument',
      'errorMessage': 'partnerUid is required',
    };
  }
  final cached = revealedProfileCache[uid];
  if (cached != null) {
    bumpUiAfterAssign();
    return {
      'success': true,
      'data': cached,
    };
  }
  try {
    final result = await FirebaseFunctions.instanceFor(region: 'us-central1')
        .httpsCallable('getRevealedProfile')
        .call({
      'partnerUid': uid,
    });

    final raw = jsonSafe(result.data);
    final data = raw is Map ? raw['data'] : null;
    if (data is Map) {
      final mapped = Map<String, dynamic>.from(data);
      revealedProfileCache[uid] = mapped;
      applyRevealedProfileToAppState(mapped);
    }
    bumpUiAfterAssign();
    return {
      'success': true,
      'data': data,
    };
  } on FirebaseFunctionsException catch (e) {
    if (kDebugMode) {
      print('fetchRevealedProfile ${e.code}: ${e.message}');
    }
    return {
      'success': false,
      'errorCode': e.code,
      'errorMessage': e.message ?? 'Unknown error occurred',
    };
  } catch (e) {
    return {
      'success': false,
      'errorCode': 'unknown',
      'errorMessage': e.toString(),
    };
  }
}
