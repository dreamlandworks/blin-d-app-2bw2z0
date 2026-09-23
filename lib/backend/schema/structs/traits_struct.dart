// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TraitsStruct extends FFFirebaseStruct {
  TraitsStruct({
    double? empathy,
    double? romance,
    double? curiosity,
    double? loyalty,
    double? emotionalDepth,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _empathy = empathy,
        _romance = romance,
        _curiosity = curiosity,
        _loyalty = loyalty,
        _emotionalDepth = emotionalDepth,
        super(firestoreUtilData);

  // "empathy" field.
  double? _empathy;
  double get empathy => _empathy ?? 0.0;
  set empathy(double? val) => _empathy = val;

  void incrementEmpathy(double amount) => empathy = empathy + amount;

  bool hasEmpathy() => _empathy != null;

  // "romance" field.
  double? _romance;
  double get romance => _romance ?? 0.0;
  set romance(double? val) => _romance = val;

  void incrementRomance(double amount) => romance = romance + amount;

  bool hasRomance() => _romance != null;

  // "curiosity" field.
  double? _curiosity;
  double get curiosity => _curiosity ?? 0.0;
  set curiosity(double? val) => _curiosity = val;

  void incrementCuriosity(double amount) => curiosity = curiosity + amount;

  bool hasCuriosity() => _curiosity != null;

  // "loyalty" field.
  double? _loyalty;
  double get loyalty => _loyalty ?? 0.0;
  set loyalty(double? val) => _loyalty = val;

  void incrementLoyalty(double amount) => loyalty = loyalty + amount;

  bool hasLoyalty() => _loyalty != null;

  // "emotional_depth" field.
  double? _emotionalDepth;
  double get emotionalDepth => _emotionalDepth ?? 0.0;
  set emotionalDepth(double? val) => _emotionalDepth = val;

  void incrementEmotionalDepth(double amount) =>
      emotionalDepth = emotionalDepth + amount;

  bool hasEmotionalDepth() => _emotionalDepth != null;

  static TraitsStruct fromMap(Map<String, dynamic> data) => TraitsStruct(
        empathy: castToType<double>(data['empathy']),
        romance: castToType<double>(data['romance']),
        curiosity: castToType<double>(data['curiosity']),
        loyalty: castToType<double>(data['loyalty']),
        emotionalDepth: castToType<double>(data['emotional_depth']),
      );

  static TraitsStruct? maybeFromMap(dynamic data) =>
      data is Map ? TraitsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'empathy': _empathy,
        'romance': _romance,
        'curiosity': _curiosity,
        'loyalty': _loyalty,
        'emotional_depth': _emotionalDepth,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'empathy': serializeParam(
          _empathy,
          ParamType.double,
        ),
        'romance': serializeParam(
          _romance,
          ParamType.double,
        ),
        'curiosity': serializeParam(
          _curiosity,
          ParamType.double,
        ),
        'loyalty': serializeParam(
          _loyalty,
          ParamType.double,
        ),
        'emotional_depth': serializeParam(
          _emotionalDepth,
          ParamType.double,
        ),
      }.withoutNulls;

  static TraitsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TraitsStruct(
        empathy: deserializeParam(
          data['empathy'],
          ParamType.double,
          false,
        ),
        romance: deserializeParam(
          data['romance'],
          ParamType.double,
          false,
        ),
        curiosity: deserializeParam(
          data['curiosity'],
          ParamType.double,
          false,
        ),
        loyalty: deserializeParam(
          data['loyalty'],
          ParamType.double,
          false,
        ),
        emotionalDepth: deserializeParam(
          data['emotional_depth'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'TraitsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TraitsStruct &&
        empathy == other.empathy &&
        romance == other.romance &&
        curiosity == other.curiosity &&
        loyalty == other.loyalty &&
        emotionalDepth == other.emotionalDepth;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([empathy, romance, curiosity, loyalty, emotionalDepth]);
}

TraitsStruct createTraitsStruct({
  double? empathy,
  double? romance,
  double? curiosity,
  double? loyalty,
  double? emotionalDepth,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TraitsStruct(
      empathy: empathy,
      romance: romance,
      curiosity: curiosity,
      loyalty: loyalty,
      emotionalDepth: emotionalDepth,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TraitsStruct? updateTraitsStruct(
  TraitsStruct? traits, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    traits
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTraitsStructData(
  Map<String, dynamic> firestoreData,
  TraitsStruct? traits,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (traits == null) {
    return;
  }
  if (traits.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && traits.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final traitsData = getTraitsFirestoreData(traits, forFieldValue);
  final nestedData = traitsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = traits.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTraitsFirestoreData(
  TraitsStruct? traits, [
  bool forFieldValue = false,
]) {
  if (traits == null) {
    return {};
  }
  final firestoreData = mapToFirestore(traits.toMap());

  // Add any Firestore field values
  mapToFirestore(traits.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTraitsListFirestoreData(
  List<TraitsStruct>? traitss,
) =>
    traitss?.map((e) => getTraitsFirestoreData(e, true)).toList() ?? [];
