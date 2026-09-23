// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SocialStruct extends FFFirebaseStruct {
  SocialStruct({
    String? website,
    String? fbId,
    String? instaId,
    String? xHandle,
    String? tiktokId,
    String? spotifyUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _website = website,
        _fbId = fbId,
        _instaId = instaId,
        _xHandle = xHandle,
        _tiktokId = tiktokId,
        _spotifyUrl = spotifyUrl,
        super(firestoreUtilData);

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  set website(String? val) => _website = val;

  bool hasWebsite() => _website != null;

  // "fb_id" field.
  String? _fbId;
  String get fbId => _fbId ?? '';
  set fbId(String? val) => _fbId = val;

  bool hasFbId() => _fbId != null;

  // "insta_id" field.
  String? _instaId;
  String get instaId => _instaId ?? '';
  set instaId(String? val) => _instaId = val;

  bool hasInstaId() => _instaId != null;

  // "x_handle" field.
  String? _xHandle;
  String get xHandle => _xHandle ?? '';
  set xHandle(String? val) => _xHandle = val;

  bool hasXHandle() => _xHandle != null;

  // "tiktok_id" field.
  String? _tiktokId;
  String get tiktokId => _tiktokId ?? '';
  set tiktokId(String? val) => _tiktokId = val;

  bool hasTiktokId() => _tiktokId != null;

  // "spotify_url" field.
  String? _spotifyUrl;
  String get spotifyUrl => _spotifyUrl ?? '';
  set spotifyUrl(String? val) => _spotifyUrl = val;

  bool hasSpotifyUrl() => _spotifyUrl != null;

  static SocialStruct fromMap(Map<String, dynamic> data) => SocialStruct(
        website: data['website'] as String?,
        fbId: data['fb_id'] as String?,
        instaId: data['insta_id'] as String?,
        xHandle: data['x_handle'] as String?,
        tiktokId: data['tiktok_id'] as String?,
        spotifyUrl: data['spotify_url'] as String?,
      );

  static SocialStruct? maybeFromMap(dynamic data) =>
      data is Map ? SocialStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'website': _website,
        'fb_id': _fbId,
        'insta_id': _instaId,
        'x_handle': _xHandle,
        'tiktok_id': _tiktokId,
        'spotify_url': _spotifyUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'website': serializeParam(
          _website,
          ParamType.String,
        ),
        'fb_id': serializeParam(
          _fbId,
          ParamType.String,
        ),
        'insta_id': serializeParam(
          _instaId,
          ParamType.String,
        ),
        'x_handle': serializeParam(
          _xHandle,
          ParamType.String,
        ),
        'tiktok_id': serializeParam(
          _tiktokId,
          ParamType.String,
        ),
        'spotify_url': serializeParam(
          _spotifyUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static SocialStruct fromSerializableMap(Map<String, dynamic> data) =>
      SocialStruct(
        website: deserializeParam(
          data['website'],
          ParamType.String,
          false,
        ),
        fbId: deserializeParam(
          data['fb_id'],
          ParamType.String,
          false,
        ),
        instaId: deserializeParam(
          data['insta_id'],
          ParamType.String,
          false,
        ),
        xHandle: deserializeParam(
          data['x_handle'],
          ParamType.String,
          false,
        ),
        tiktokId: deserializeParam(
          data['tiktok_id'],
          ParamType.String,
          false,
        ),
        spotifyUrl: deserializeParam(
          data['spotify_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SocialStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SocialStruct &&
        website == other.website &&
        fbId == other.fbId &&
        instaId == other.instaId &&
        xHandle == other.xHandle &&
        tiktokId == other.tiktokId &&
        spotifyUrl == other.spotifyUrl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([website, fbId, instaId, xHandle, tiktokId, spotifyUrl]);
}

SocialStruct createSocialStruct({
  String? website,
  String? fbId,
  String? instaId,
  String? xHandle,
  String? tiktokId,
  String? spotifyUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SocialStruct(
      website: website,
      fbId: fbId,
      instaId: instaId,
      xHandle: xHandle,
      tiktokId: tiktokId,
      spotifyUrl: spotifyUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SocialStruct? updateSocialStruct(
  SocialStruct? social, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    social
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSocialStructData(
  Map<String, dynamic> firestoreData,
  SocialStruct? social,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (social == null) {
    return;
  }
  if (social.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && social.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final socialData = getSocialFirestoreData(social, forFieldValue);
  final nestedData = socialData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = social.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSocialFirestoreData(
  SocialStruct? social, [
  bool forFieldValue = false,
]) {
  if (social == null) {
    return {};
  }
  final firestoreData = mapToFirestore(social.toMap());

  // Add any Firestore field values
  mapToFirestore(social.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSocialListFirestoreData(
  List<SocialStruct>? socials,
) =>
    socials?.map((e) => getSocialFirestoreData(e, true)).toList() ?? [];
