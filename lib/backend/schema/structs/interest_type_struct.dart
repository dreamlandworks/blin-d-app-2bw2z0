// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InterestTypeStruct extends FFFirebaseStruct {
  InterestTypeStruct({
    String? label,
    String? icon,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _label = label,
        _icon = icon,
        super(firestoreUtilData);

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  static InterestTypeStruct fromMap(Map<String, dynamic> data) =>
      InterestTypeStruct(
        label: data['label'] as String?,
        icon: data['icon'] as String?,
      );

  static InterestTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? InterestTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'icon': _icon,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
      }.withoutNulls;

  static InterestTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      InterestTypeStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InterestTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InterestTypeStruct &&
        label == other.label &&
        icon == other.icon;
  }

  @override
  int get hashCode => const ListEquality().hash([label, icon]);
}

InterestTypeStruct createInterestTypeStruct({
  String? label,
  String? icon,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InterestTypeStruct(
      label: label,
      icon: icon,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InterestTypeStruct? updateInterestTypeStruct(
  InterestTypeStruct? interestType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    interestType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInterestTypeStructData(
  Map<String, dynamic> firestoreData,
  InterestTypeStruct? interestType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (interestType == null) {
    return;
  }
  if (interestType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && interestType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final interestTypeData =
      getInterestTypeFirestoreData(interestType, forFieldValue);
  final nestedData =
      interestTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = interestType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInterestTypeFirestoreData(
  InterestTypeStruct? interestType, [
  bool forFieldValue = false,
]) {
  if (interestType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(interestType.toMap());

  // Add any Firestore field values
  mapToFirestore(interestType.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInterestTypeListFirestoreData(
  List<InterestTypeStruct>? interestTypes,
) =>
    interestTypes?.map((e) => getInterestTypeFirestoreData(e, true)).toList() ??
    [];
