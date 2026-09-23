// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppStatsStruct extends FFFirebaseStruct {
  AppStatsStruct({
    int? chatsCount,
    bool? isPremium,
    int? coins,
    DateTime? expiryAt,
    double? avgRating,
    int? vibeScore,
    List<VibeHistoryStruct>? vibeHistory,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _chatsCount = chatsCount,
        _isPremium = isPremium,
        _coins = coins,
        _expiryAt = expiryAt,
        _avgRating = avgRating,
        _vibeScore = vibeScore,
        _vibeHistory = vibeHistory,
        super(firestoreUtilData);

  // "chats_count" field.
  int? _chatsCount;
  int get chatsCount => _chatsCount ?? 0;
  set chatsCount(int? val) => _chatsCount = val;

  void incrementChatsCount(int amount) => chatsCount = chatsCount + amount;

  bool hasChatsCount() => _chatsCount != null;

  // "is_premium" field.
  bool? _isPremium;
  bool get isPremium => _isPremium ?? false;
  set isPremium(bool? val) => _isPremium = val;

  bool hasIsPremium() => _isPremium != null;

  // "coins" field.
  int? _coins;
  int get coins => _coins ?? 0;
  set coins(int? val) => _coins = val;

  void incrementCoins(int amount) => coins = coins + amount;

  bool hasCoins() => _coins != null;

  // "expiry_at" field.
  DateTime? _expiryAt;
  DateTime? get expiryAt => _expiryAt;
  set expiryAt(DateTime? val) => _expiryAt = val;

  bool hasExpiryAt() => _expiryAt != null;

  // "avg_rating" field.
  double? _avgRating;
  double get avgRating => _avgRating ?? 0.0;
  set avgRating(double? val) => _avgRating = val;

  void incrementAvgRating(double amount) => avgRating = avgRating + amount;

  bool hasAvgRating() => _avgRating != null;

  // "vibe_score" field.
  int? _vibeScore;
  int get vibeScore => _vibeScore ?? 0;
  set vibeScore(int? val) => _vibeScore = val;

  void incrementVibeScore(int amount) => vibeScore = vibeScore + amount;

  bool hasVibeScore() => _vibeScore != null;

  // "vibe_history" field.
  List<VibeHistoryStruct>? _vibeHistory;
  List<VibeHistoryStruct> get vibeHistory => _vibeHistory ?? const [];
  set vibeHistory(List<VibeHistoryStruct>? val) => _vibeHistory = val;

  void updateVibeHistory(Function(List<VibeHistoryStruct>) updateFn) {
    updateFn(_vibeHistory ??= []);
  }

  bool hasVibeHistory() => _vibeHistory != null;

  static AppStatsStruct fromMap(Map<String, dynamic> data) => AppStatsStruct(
        chatsCount: castToType<int>(data['chats_count']),
        isPremium: data['is_premium'] as bool?,
        coins: castToType<int>(data['coins']),
        expiryAt: data['expiry_at'] as DateTime?,
        avgRating: castToType<double>(data['avg_rating']),
        vibeScore: castToType<int>(data['vibe_score']),
        vibeHistory: getStructList(
          data['vibe_history'],
          VibeHistoryStruct.fromMap,
        ),
      );

  static AppStatsStruct? maybeFromMap(dynamic data) =>
      data is Map ? AppStatsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'chats_count': _chatsCount,
        'is_premium': _isPremium,
        'coins': _coins,
        'expiry_at': _expiryAt,
        'avg_rating': _avgRating,
        'vibe_score': _vibeScore,
        'vibe_history': _vibeHistory?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chats_count': serializeParam(
          _chatsCount,
          ParamType.int,
        ),
        'is_premium': serializeParam(
          _isPremium,
          ParamType.bool,
        ),
        'coins': serializeParam(
          _coins,
          ParamType.int,
        ),
        'expiry_at': serializeParam(
          _expiryAt,
          ParamType.DateTime,
        ),
        'avg_rating': serializeParam(
          _avgRating,
          ParamType.double,
        ),
        'vibe_score': serializeParam(
          _vibeScore,
          ParamType.int,
        ),
        'vibe_history': serializeParam(
          _vibeHistory,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static AppStatsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppStatsStruct(
        chatsCount: deserializeParam(
          data['chats_count'],
          ParamType.int,
          false,
        ),
        isPremium: deserializeParam(
          data['is_premium'],
          ParamType.bool,
          false,
        ),
        coins: deserializeParam(
          data['coins'],
          ParamType.int,
          false,
        ),
        expiryAt: deserializeParam(
          data['expiry_at'],
          ParamType.DateTime,
          false,
        ),
        avgRating: deserializeParam(
          data['avg_rating'],
          ParamType.double,
          false,
        ),
        vibeScore: deserializeParam(
          data['vibe_score'],
          ParamType.int,
          false,
        ),
        vibeHistory: deserializeStructParam<VibeHistoryStruct>(
          data['vibe_history'],
          ParamType.DataStruct,
          true,
          structBuilder: VibeHistoryStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AppStatsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AppStatsStruct &&
        chatsCount == other.chatsCount &&
        isPremium == other.isPremium &&
        coins == other.coins &&
        expiryAt == other.expiryAt &&
        avgRating == other.avgRating &&
        vibeScore == other.vibeScore &&
        listEquality.equals(vibeHistory, other.vibeHistory);
  }

  @override
  int get hashCode => const ListEquality().hash([
        chatsCount,
        isPremium,
        coins,
        expiryAt,
        avgRating,
        vibeScore,
        vibeHistory
      ]);
}

AppStatsStruct createAppStatsStruct({
  int? chatsCount,
  bool? isPremium,
  int? coins,
  DateTime? expiryAt,
  double? avgRating,
  int? vibeScore,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppStatsStruct(
      chatsCount: chatsCount,
      isPremium: isPremium,
      coins: coins,
      expiryAt: expiryAt,
      avgRating: avgRating,
      vibeScore: vibeScore,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppStatsStruct? updateAppStatsStruct(
  AppStatsStruct? appStats, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    appStats
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppStatsStructData(
  Map<String, dynamic> firestoreData,
  AppStatsStruct? appStats,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (appStats == null) {
    return;
  }
  if (appStats.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && appStats.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appStatsData = getAppStatsFirestoreData(appStats, forFieldValue);
  final nestedData = appStatsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = appStats.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppStatsFirestoreData(
  AppStatsStruct? appStats, [
  bool forFieldValue = false,
]) {
  if (appStats == null) {
    return {};
  }
  final firestoreData = mapToFirestore(appStats.toMap());

  // Add any Firestore field values
  mapToFirestore(appStats.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppStatsListFirestoreData(
  List<AppStatsStruct>? appStatss,
) =>
    appStatss?.map((e) => getAppStatsFirestoreData(e, true)).toList() ?? [];
