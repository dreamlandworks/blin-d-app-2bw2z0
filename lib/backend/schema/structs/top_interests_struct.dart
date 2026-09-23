// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TopInterestsStruct extends FFFirebaseStruct {
  TopInterestsStruct({
    String? context,
    double? intensity,
    String? topic,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _context = context,
        _intensity = intensity,
        _topic = topic,
        super(firestoreUtilData);

  // "context" field.
  String? _context;
  String get context => _context ?? '';
  set context(String? val) => _context = val;

  bool hasContext() => _context != null;

  // "intensity" field.
  double? _intensity;
  double get intensity => _intensity ?? 0.0;
  set intensity(double? val) => _intensity = val;

  void incrementIntensity(double amount) => intensity = intensity + amount;

  bool hasIntensity() => _intensity != null;

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  set topic(String? val) => _topic = val;

  bool hasTopic() => _topic != null;

  static TopInterestsStruct fromMap(Map<String, dynamic> data) =>
      TopInterestsStruct(
        context: data['context'] as String?,
        intensity: castToType<double>(data['intensity']),
        topic: data['topic'] as String?,
      );

  static TopInterestsStruct? maybeFromMap(dynamic data) => data is Map
      ? TopInterestsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'context': _context,
        'intensity': _intensity,
        'topic': _topic,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'context': serializeParam(
          _context,
          ParamType.String,
        ),
        'intensity': serializeParam(
          _intensity,
          ParamType.double,
        ),
        'topic': serializeParam(
          _topic,
          ParamType.String,
        ),
      }.withoutNulls;

  static TopInterestsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TopInterestsStruct(
        context: deserializeParam(
          data['context'],
          ParamType.String,
          false,
        ),
        intensity: deserializeParam(
          data['intensity'],
          ParamType.double,
          false,
        ),
        topic: deserializeParam(
          data['topic'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TopInterestsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TopInterestsStruct &&
        context == other.context &&
        intensity == other.intensity &&
        topic == other.topic;
  }

  @override
  int get hashCode => const ListEquality().hash([context, intensity, topic]);
}

TopInterestsStruct createTopInterestsStruct({
  String? context,
  double? intensity,
  String? topic,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TopInterestsStruct(
      context: context,
      intensity: intensity,
      topic: topic,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TopInterestsStruct? updateTopInterestsStruct(
  TopInterestsStruct? topInterests, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    topInterests
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTopInterestsStructData(
  Map<String, dynamic> firestoreData,
  TopInterestsStruct? topInterests,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (topInterests == null) {
    return;
  }
  if (topInterests.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && topInterests.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final topInterestsData =
      getTopInterestsFirestoreData(topInterests, forFieldValue);
  final nestedData =
      topInterestsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = topInterests.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTopInterestsFirestoreData(
  TopInterestsStruct? topInterests, [
  bool forFieldValue = false,
]) {
  if (topInterests == null) {
    return {};
  }
  final firestoreData = mapToFirestore(topInterests.toMap());

  // Add any Firestore field values
  mapToFirestore(topInterests.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTopInterestsListFirestoreData(
  List<TopInterestsStruct>? topInterestss,
) =>
    topInterestss?.map((e) => getTopInterestsFirestoreData(e, true)).toList() ??
    [];
