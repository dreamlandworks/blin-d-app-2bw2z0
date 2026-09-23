import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "real_id" field.
  RealIdStruct? _realId;
  RealIdStruct get realId => _realId ?? RealIdStruct();
  bool hasRealId() => _realId != null;

  // "preferences" field.
  PreferencesStruct? _preferences;
  PreferencesStruct get preferences => _preferences ?? PreferencesStruct();
  bool hasPreferences() => _preferences != null;

  // "verification" field.
  VerificationStruct? _verification;
  VerificationStruct get verification => _verification ?? VerificationStruct();
  bool hasVerification() => _verification != null;

  // "app_stats" field.
  AppStatsStruct? _appStats;
  AppStatsStruct get appStats => _appStats ?? AppStatsStruct();
  bool hasAppStats() => _appStats != null;

  // "ai_persona" field.
  AiPersonaStruct? _aiPersona;
  AiPersonaStruct get aiPersona => _aiPersona ?? AiPersonaStruct();
  bool hasAiPersona() => _aiPersona != null;

  // "consent" field.
  ConsentStruct? _consent;
  ConsentStruct get consent => _consent ?? ConsentStruct();
  bool hasConsent() => _consent != null;

  // "social" field.
  SocialStruct? _social;
  SocialStruct get social => _social ?? SocialStruct();
  bool hasSocial() => _social != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "photo_file_paths" field.
  FilePathsStruct? _photoFilePaths;
  FilePathsStruct get photoFilePaths => _photoFilePaths ?? FilePathsStruct();
  bool hasPhotoFilePaths() => _photoFilePaths != null;

  // "fcm_token" field.
  List<String>? _fcmToken;
  List<String> get fcmToken => _fcmToken ?? const [];
  bool hasFcmToken() => _fcmToken != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _realId = snapshotData['real_id'] is RealIdStruct
        ? snapshotData['real_id']
        : RealIdStruct.maybeFromMap(snapshotData['real_id']);
    _preferences = snapshotData['preferences'] is PreferencesStruct
        ? snapshotData['preferences']
        : PreferencesStruct.maybeFromMap(snapshotData['preferences']);
    _verification = snapshotData['verification'] is VerificationStruct
        ? snapshotData['verification']
        : VerificationStruct.maybeFromMap(snapshotData['verification']);
    _appStats = snapshotData['app_stats'] is AppStatsStruct
        ? snapshotData['app_stats']
        : AppStatsStruct.maybeFromMap(snapshotData['app_stats']);
    _aiPersona = snapshotData['ai_persona'] is AiPersonaStruct
        ? snapshotData['ai_persona']
        : AiPersonaStruct.maybeFromMap(snapshotData['ai_persona']);
    _consent = snapshotData['consent'] is ConsentStruct
        ? snapshotData['consent']
        : ConsentStruct.maybeFromMap(snapshotData['consent']);
    _social = snapshotData['social'] is SocialStruct
        ? snapshotData['social']
        : SocialStruct.maybeFromMap(snapshotData['social']);
    _photoUrl = snapshotData['photo_url'] as String?;
    _photoFilePaths = snapshotData['photo_file_paths'] is FilePathsStruct
        ? snapshotData['photo_file_paths']
        : FilePathsStruct.maybeFromMap(snapshotData['photo_file_paths']);
    _fcmToken = getDataList(snapshotData['fcm_token']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? uid,
  String? phoneNumber,
  DateTime? createdTime,
  DateTime? updatedAt,
  RealIdStruct? realId,
  PreferencesStruct? preferences,
  VerificationStruct? verification,
  AppStatsStruct? appStats,
  AiPersonaStruct? aiPersona,
  ConsentStruct? consent,
  SocialStruct? social,
  String? photoUrl,
  FilePathsStruct? photoFilePaths,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'phone_number': phoneNumber,
      'created_time': createdTime,
      'updated_at': updatedAt,
      'real_id': RealIdStruct().toMap(),
      'preferences': PreferencesStruct().toMap(),
      'verification': VerificationStruct().toMap(),
      'app_stats': AppStatsStruct().toMap(),
      'ai_persona': AiPersonaStruct().toMap(),
      'consent': ConsentStruct().toMap(),
      'social': SocialStruct().toMap(),
      'photo_url': photoUrl,
      'photo_file_paths': FilePathsStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "real_id" field.
  addRealIdStructData(firestoreData, realId, 'real_id');

  // Handle nested data for "preferences" field.
  addPreferencesStructData(firestoreData, preferences, 'preferences');

  // Handle nested data for "verification" field.
  addVerificationStructData(firestoreData, verification, 'verification');

  // Handle nested data for "app_stats" field.
  addAppStatsStructData(firestoreData, appStats, 'app_stats');

  // Handle nested data for "ai_persona" field.
  addAiPersonaStructData(firestoreData, aiPersona, 'ai_persona');

  // Handle nested data for "consent" field.
  addConsentStructData(firestoreData, consent, 'consent');

  // Handle nested data for "social" field.
  addSocialStructData(firestoreData, social, 'social');

  // Handle nested data for "photo_file_paths" field.
  addFilePathsStructData(firestoreData, photoFilePaths, 'photo_file_paths');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdTime == e2?.createdTime &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.realId == e2?.realId &&
        e1?.preferences == e2?.preferences &&
        e1?.verification == e2?.verification &&
        e1?.appStats == e2?.appStats &&
        e1?.aiPersona == e2?.aiPersona &&
        e1?.consent == e2?.consent &&
        e1?.social == e2?.social &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.photoFilePaths == e2?.photoFilePaths &&
        listEquality.equals(e1?.fcmToken, e2?.fcmToken);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.phoneNumber,
        e?.createdTime,
        e?.updatedAt,
        e?.realId,
        e?.preferences,
        e?.verification,
        e?.appStats,
        e?.aiPersona,
        e?.consent,
        e?.social,
        e?.photoUrl,
        e?.photoFilePaths,
        e?.fcmToken
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
