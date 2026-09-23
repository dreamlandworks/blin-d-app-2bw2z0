// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BehaviouralWeightsStruct extends FFFirebaseStruct {
  BehaviouralWeightsStruct({
    double? avgCps,
    double? avgHesitationTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _avgCps = avgCps,
        _avgHesitationTime = avgHesitationTime,
        super(firestoreUtilData);

  // "avg_cps" field.
  double? _avgCps;
  double get avgCps => _avgCps ?? 0.0;
  set avgCps(double? val) => _avgCps = val;

  void incrementAvgCps(double amount) => avgCps = avgCps + amount;

  bool hasAvgCps() => _avgCps != null;

  // "avg_hesitation_time" field.
  double? _avgHesitationTime;
  double get avgHesitationTime => _avgHesitationTime ?? 0.0;
  set avgHesitationTime(double? val) => _avgHesitationTime = val;

  void incrementAvgHesitationTime(double amount) =>
      avgHesitationTime = avgHesitationTime + amount;

  bool hasAvgHesitationTime() => _avgHesitationTime != null;

  static BehaviouralWeightsStruct fromMap(Map<String, dynamic> data) =>
      BehaviouralWeightsStruct(
        avgCps: castToType<double>(data['avg_cps']),
        avgHesitationTime: castToType<double>(data['avg_hesitation_time']),
      );

  static BehaviouralWeightsStruct? maybeFromMap(dynamic data) => data is Map
      ? BehaviouralWeightsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'avg_cps': _avgCps,
        'avg_hesitation_time': _avgHesitationTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'avg_cps': serializeParam(
          _avgCps,
          ParamType.double,
        ),
        'avg_hesitation_time': serializeParam(
          _avgHesitationTime,
          ParamType.double,
        ),
      }.withoutNulls;

  static BehaviouralWeightsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BehaviouralWeightsStruct(
        avgCps: deserializeParam(
          data['avg_cps'],
          ParamType.double,
          false,
        ),
        avgHesitationTime: deserializeParam(
          data['avg_hesitation_time'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BehaviouralWeightsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BehaviouralWeightsStruct &&
        avgCps == other.avgCps &&
        avgHesitationTime == other.avgHesitationTime;
  }

  @override
  int get hashCode => const ListEquality().hash([avgCps, avgHesitationTime]);
}

BehaviouralWeightsStruct createBehaviouralWeightsStruct({
  double? avgCps,
  double? avgHesitationTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BehaviouralWeightsStruct(
      avgCps: avgCps,
      avgHesitationTime: avgHesitationTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BehaviouralWeightsStruct? updateBehaviouralWeightsStruct(
  BehaviouralWeightsStruct? behaviouralWeights, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    behaviouralWeights
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBehaviouralWeightsStructData(
  Map<String, dynamic> firestoreData,
  BehaviouralWeightsStruct? behaviouralWeights,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (behaviouralWeights == null) {
    return;
  }
  if (behaviouralWeights.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && behaviouralWeights.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final behaviouralWeightsData =
      getBehaviouralWeightsFirestoreData(behaviouralWeights, forFieldValue);
  final nestedData =
      behaviouralWeightsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      behaviouralWeights.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBehaviouralWeightsFirestoreData(
  BehaviouralWeightsStruct? behaviouralWeights, [
  bool forFieldValue = false,
]) {
  if (behaviouralWeights == null) {
    return {};
  }
  final firestoreData = mapToFirestore(behaviouralWeights.toMap());

  // Add any Firestore field values
  mapToFirestore(behaviouralWeights.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBehaviouralWeightsListFirestoreData(
  List<BehaviouralWeightsStruct>? behaviouralWeightss,
) =>
    behaviouralWeightss
        ?.map((e) => getBehaviouralWeightsFirestoreData(e, true))
        .toList() ??
    [];
