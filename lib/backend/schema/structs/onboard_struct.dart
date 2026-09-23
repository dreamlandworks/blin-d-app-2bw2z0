// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnboardStruct extends FFFirebaseStruct {
  OnboardStruct({
    List<String>? interests,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _interests = interests,
        super(firestoreUtilData);

  // "interests" field.
  List<String>? _interests;
  List<String> get interests => _interests ?? const [];
  set interests(List<String>? val) => _interests = val;

  void updateInterests(Function(List<String>) updateFn) {
    updateFn(_interests ??= []);
  }

  bool hasInterests() => _interests != null;

  static OnboardStruct fromMap(Map<String, dynamic> data) => OnboardStruct(
        interests: getDataList(data['interests']),
      );

  static OnboardStruct? maybeFromMap(dynamic data) =>
      data is Map ? OnboardStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'interests': _interests,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'interests': serializeParam(
          _interests,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static OnboardStruct fromSerializableMap(Map<String, dynamic> data) =>
      OnboardStruct(
        interests: deserializeParam<String>(
          data['interests'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'OnboardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OnboardStruct &&
        listEquality.equals(interests, other.interests);
  }

  @override
  int get hashCode => const ListEquality().hash([interests]);
}

OnboardStruct createOnboardStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OnboardStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OnboardStruct? updateOnboardStruct(
  OnboardStruct? onboard, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    onboard
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOnboardStructData(
  Map<String, dynamic> firestoreData,
  OnboardStruct? onboard,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (onboard == null) {
    return;
  }
  if (onboard.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && onboard.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final onboardData = getOnboardFirestoreData(onboard, forFieldValue);
  final nestedData = onboardData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = onboard.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOnboardFirestoreData(
  OnboardStruct? onboard, [
  bool forFieldValue = false,
]) {
  if (onboard == null) {
    return {};
  }
  final firestoreData = mapToFirestore(onboard.toMap());

  // Add any Firestore field values
  mapToFirestore(onboard.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOnboardListFirestoreData(
  List<OnboardStruct>? onboards,
) =>
    onboards?.map((e) => getOnboardFirestoreData(e, true)).toList() ?? [];
