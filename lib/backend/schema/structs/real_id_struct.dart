// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RealIdStruct extends FFFirebaseStruct {
  RealIdStruct({
    String? fullName,
    DateTime? dob,
    String? gender,
    bool? isMinor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fullName = fullName,
        _dob = dob,
        _gender = gender,
        _isMinor = isMinor,
        super(firestoreUtilData);

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  set dob(DateTime? val) => _dob = val;

  bool hasDob() => _dob != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "is_minor" field.
  bool? _isMinor;
  bool get isMinor => _isMinor ?? false;
  set isMinor(bool? val) => _isMinor = val;

  bool hasIsMinor() => _isMinor != null;

  static RealIdStruct fromMap(Map<String, dynamic> data) => RealIdStruct(
        fullName: data['full_name'] as String?,
        dob: data['dob'] as DateTime?,
        gender: data['gender'] as String?,
        isMinor: data['is_minor'] as bool?,
      );

  static RealIdStruct? maybeFromMap(dynamic data) =>
      data is Map ? RealIdStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'full_name': _fullName,
        'dob': _dob,
        'gender': _gender,
        'is_minor': _isMinor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'full_name': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'dob': serializeParam(
          _dob,
          ParamType.DateTime,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'is_minor': serializeParam(
          _isMinor,
          ParamType.bool,
        ),
      }.withoutNulls;

  static RealIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      RealIdStruct(
        fullName: deserializeParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        dob: deserializeParam(
          data['dob'],
          ParamType.DateTime,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        isMinor: deserializeParam(
          data['is_minor'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'RealIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RealIdStruct &&
        fullName == other.fullName &&
        dob == other.dob &&
        gender == other.gender &&
        isMinor == other.isMinor;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([fullName, dob, gender, isMinor]);
}

RealIdStruct createRealIdStruct({
  String? fullName,
  DateTime? dob,
  String? gender,
  bool? isMinor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RealIdStruct(
      fullName: fullName,
      dob: dob,
      gender: gender,
      isMinor: isMinor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RealIdStruct? updateRealIdStruct(
  RealIdStruct? realId, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    realId
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRealIdStructData(
  Map<String, dynamic> firestoreData,
  RealIdStruct? realId,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (realId == null) {
    return;
  }
  if (realId.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && realId.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final realIdData = getRealIdFirestoreData(realId, forFieldValue);
  final nestedData = realIdData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = realId.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRealIdFirestoreData(
  RealIdStruct? realId, [
  bool forFieldValue = false,
]) {
  if (realId == null) {
    return {};
  }
  final firestoreData = mapToFirestore(realId.toMap());

  // Add any Firestore field values
  mapToFirestore(realId.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRealIdListFirestoreData(
  List<RealIdStruct>? realIds,
) =>
    realIds?.map((e) => getRealIdFirestoreData(e, true)).toList() ?? [];
