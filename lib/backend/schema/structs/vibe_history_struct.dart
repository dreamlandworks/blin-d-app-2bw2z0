// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class VibeHistoryStruct extends FFFirebaseStruct {
  VibeHistoryStruct({
    String? date,
    int? score,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _score = score,
        super(firestoreUtilData);

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  set score(int? val) => _score = val;

  void incrementScore(int amount) => score = score + amount;

  bool hasScore() => _score != null;

  static VibeHistoryStruct fromMap(Map<String, dynamic> data) =>
      VibeHistoryStruct(
        date: data['date'] as String?,
        score: castToType<int>(data['score']),
      );

  static VibeHistoryStruct? maybeFromMap(dynamic data) => data is Map
      ? VibeHistoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'score': _score,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'score': serializeParam(
          _score,
          ParamType.int,
        ),
      }.withoutNulls;

  static VibeHistoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      VibeHistoryStruct(
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        score: deserializeParam(
          data['score'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'VibeHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VibeHistoryStruct &&
        date == other.date &&
        score == other.score;
  }

  @override
  int get hashCode => const ListEquality().hash([date, score]);
}

VibeHistoryStruct createVibeHistoryStruct({
  String? date,
  int? score,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VibeHistoryStruct(
      date: date,
      score: score,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VibeHistoryStruct? updateVibeHistoryStruct(
  VibeHistoryStruct? vibeHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    vibeHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVibeHistoryStructData(
  Map<String, dynamic> firestoreData,
  VibeHistoryStruct? vibeHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (vibeHistory == null) {
    return;
  }
  if (vibeHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && vibeHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final vibeHistoryData =
      getVibeHistoryFirestoreData(vibeHistory, forFieldValue);
  final nestedData =
      vibeHistoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = vibeHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVibeHistoryFirestoreData(
  VibeHistoryStruct? vibeHistory, [
  bool forFieldValue = false,
]) {
  if (vibeHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(vibeHistory.toMap());

  // Add any Firestore field values
  mapToFirestore(vibeHistory.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVibeHistoryListFirestoreData(
  List<VibeHistoryStruct>? vibeHistorys,
) =>
    vibeHistorys?.map((e) => getVibeHistoryFirestoreData(e, true)).toList() ??
    [];
