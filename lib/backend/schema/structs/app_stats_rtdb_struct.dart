// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppStatsRtdbStruct extends FFFirebaseStruct {
  AppStatsRtdbStruct({
    int? chatsCount,
    int? coins,
    DateTime? lastActive,
    ReadyStatus? readyStatus,
    double? avgScore,
    DateTime? expiryAt,
    DateTime? profileUpdatedAt,
    DateTime? personaUpdatedAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _chatsCount = chatsCount,
        _coins = coins,
        _lastActive = lastActive,
        _readyStatus = readyStatus,
        _avgScore = avgScore,
        _expiryAt = expiryAt,
        _profileUpdatedAt = profileUpdatedAt,
        _personaUpdatedAt = personaUpdatedAt,
        super(firestoreUtilData);

  // "chats_count" field.
  int? _chatsCount;
  int get chatsCount => _chatsCount ?? 0;
  set chatsCount(int? val) => _chatsCount = val;

  void incrementChatsCount(int amount) => chatsCount = chatsCount + amount;

  bool hasChatsCount() => _chatsCount != null;

  // "coins" field.
  int? _coins;
  int get coins => _coins ?? 0;
  set coins(int? val) => _coins = val;

  void incrementCoins(int amount) => coins = coins + amount;

  bool hasCoins() => _coins != null;

  // "last_active" field.
  DateTime? _lastActive;
  DateTime? get lastActive => _lastActive;
  set lastActive(DateTime? val) => _lastActive = val;

  bool hasLastActive() => _lastActive != null;

  // "ready_status" field.
  ReadyStatus? _readyStatus;
  ReadyStatus? get readyStatus => _readyStatus;
  set readyStatus(ReadyStatus? val) => _readyStatus = val;

  bool hasReadyStatus() => _readyStatus != null;

  // "avg_score" field.
  double? _avgScore;
  double get avgScore => _avgScore ?? 0.0;
  set avgScore(double? val) => _avgScore = val;

  void incrementAvgScore(double amount) => avgScore = avgScore + amount;

  bool hasAvgScore() => _avgScore != null;

  // "expiry_at" field.
  DateTime? _expiryAt;
  DateTime? get expiryAt => _expiryAt;
  set expiryAt(DateTime? val) => _expiryAt = val;

  bool hasExpiryAt() => _expiryAt != null;

  // "profile_updated_at" field.
  DateTime? _profileUpdatedAt;
  DateTime? get profileUpdatedAt => _profileUpdatedAt;
  set profileUpdatedAt(DateTime? val) => _profileUpdatedAt = val;

  bool hasProfileUpdatedAt() => _profileUpdatedAt != null;

  // "persona_updated_at" field.
  DateTime? _personaUpdatedAt;
  DateTime? get personaUpdatedAt => _personaUpdatedAt;
  set personaUpdatedAt(DateTime? val) => _personaUpdatedAt = val;

  bool hasPersonaUpdatedAt() => _personaUpdatedAt != null;

  static AppStatsRtdbStruct fromMap(Map<String, dynamic> data) =>
      AppStatsRtdbStruct(
        chatsCount: castToType<int>(data['chats_count']),
        coins: castToType<int>(data['coins']),
        lastActive: data['last_active'] as DateTime?,
        readyStatus: data['ready_status'] is ReadyStatus
            ? data['ready_status']
            : deserializeEnum<ReadyStatus>(data['ready_status']),
        avgScore: castToType<double>(data['avg_score']),
        expiryAt: data['expiry_at'] as DateTime?,
        profileUpdatedAt: data['profile_updated_at'] as DateTime?,
        personaUpdatedAt: data['persona_updated_at'] as DateTime?,
      );

  static AppStatsRtdbStruct? maybeFromMap(dynamic data) => data is Map
      ? AppStatsRtdbStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'chats_count': _chatsCount,
        'coins': _coins,
        'last_active': _lastActive,
        'ready_status': _readyStatus?.serialize(),
        'avg_score': _avgScore,
        'expiry_at': _expiryAt,
        'profile_updated_at': _profileUpdatedAt,
        'persona_updated_at': _personaUpdatedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chats_count': serializeParam(
          _chatsCount,
          ParamType.int,
        ),
        'coins': serializeParam(
          _coins,
          ParamType.int,
        ),
        'last_active': serializeParam(
          _lastActive,
          ParamType.DateTime,
        ),
        'ready_status': serializeParam(
          _readyStatus,
          ParamType.Enum,
        ),
        'avg_score': serializeParam(
          _avgScore,
          ParamType.double,
        ),
        'expiry_at': serializeParam(
          _expiryAt,
          ParamType.DateTime,
        ),
        'profile_updated_at': serializeParam(
          _profileUpdatedAt,
          ParamType.DateTime,
        ),
        'persona_updated_at': serializeParam(
          _personaUpdatedAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static AppStatsRtdbStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppStatsRtdbStruct(
        chatsCount: deserializeParam(
          data['chats_count'],
          ParamType.int,
          false,
        ),
        coins: deserializeParam(
          data['coins'],
          ParamType.int,
          false,
        ),
        lastActive: deserializeParam(
          data['last_active'],
          ParamType.DateTime,
          false,
        ),
        readyStatus: deserializeParam<ReadyStatus>(
          data['ready_status'],
          ParamType.Enum,
          false,
        ),
        avgScore: deserializeParam(
          data['avg_score'],
          ParamType.double,
          false,
        ),
        expiryAt: deserializeParam(
          data['expiry_at'],
          ParamType.DateTime,
          false,
        ),
        profileUpdatedAt: deserializeParam(
          data['profile_updated_at'],
          ParamType.DateTime,
          false,
        ),
        personaUpdatedAt: deserializeParam(
          data['persona_updated_at'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'AppStatsRtdbStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppStatsRtdbStruct &&
        chatsCount == other.chatsCount &&
        coins == other.coins &&
        lastActive == other.lastActive &&
        readyStatus == other.readyStatus &&
        avgScore == other.avgScore &&
        expiryAt == other.expiryAt &&
        profileUpdatedAt == other.profileUpdatedAt &&
        personaUpdatedAt == other.personaUpdatedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        chatsCount,
        coins,
        lastActive,
        readyStatus,
        avgScore,
        expiryAt,
        profileUpdatedAt,
        personaUpdatedAt
      ]);
}

AppStatsRtdbStruct createAppStatsRtdbStruct({
  int? chatsCount,
  int? coins,
  DateTime? lastActive,
  ReadyStatus? readyStatus,
  double? avgScore,
  DateTime? expiryAt,
  DateTime? profileUpdatedAt,
  DateTime? personaUpdatedAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppStatsRtdbStruct(
      chatsCount: chatsCount,
      coins: coins,
      lastActive: lastActive,
      readyStatus: readyStatus,
      avgScore: avgScore,
      expiryAt: expiryAt,
      profileUpdatedAt: profileUpdatedAt,
      personaUpdatedAt: personaUpdatedAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppStatsRtdbStruct? updateAppStatsRtdbStruct(
  AppStatsRtdbStruct? appStatsRtdb, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    appStatsRtdb
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppStatsRtdbStructData(
  Map<String, dynamic> firestoreData,
  AppStatsRtdbStruct? appStatsRtdb,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (appStatsRtdb == null) {
    return;
  }
  if (appStatsRtdb.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && appStatsRtdb.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appStatsRtdbData =
      getAppStatsRtdbFirestoreData(appStatsRtdb, forFieldValue);
  final nestedData =
      appStatsRtdbData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = appStatsRtdb.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppStatsRtdbFirestoreData(
  AppStatsRtdbStruct? appStatsRtdb, [
  bool forFieldValue = false,
]) {
  if (appStatsRtdb == null) {
    return {};
  }
  final firestoreData = mapToFirestore(appStatsRtdb.toMap());

  // Add any Firestore field values
  mapToFirestore(appStatsRtdb.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppStatsRtdbListFirestoreData(
  List<AppStatsRtdbStruct>? appStatsRtdbs,
) =>
    appStatsRtdbs?.map((e) => getAppStatsRtdbFirestoreData(e, true)).toList() ??
    [];
