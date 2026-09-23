// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DialCodeStruct extends FFFirebaseStruct {
  DialCodeStruct({
    String? name,
    String? dialCode,
    String? flag,
    String? code,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _dialCode = dialCode,
        _flag = flag,
        _code = code,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "dial_code" field.
  String? _dialCode;
  String get dialCode => _dialCode ?? '';
  set dialCode(String? val) => _dialCode = val;

  bool hasDialCode() => _dialCode != null;

  // "flag" field.
  String? _flag;
  String get flag => _flag ?? '';
  set flag(String? val) => _flag = val;

  bool hasFlag() => _flag != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  static DialCodeStruct fromMap(Map<String, dynamic> data) => DialCodeStruct(
        name: data['name'] as String?,
        dialCode: data['dial_code'] as String?,
        flag: data['flag'] as String?,
        code: data['code'] as String?,
      );

  static DialCodeStruct? maybeFromMap(dynamic data) =>
      data is Map ? DialCodeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'dial_code': _dialCode,
        'flag': _flag,
        'code': _code,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'dial_code': serializeParam(
          _dialCode,
          ParamType.String,
        ),
        'flag': serializeParam(
          _flag,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
      }.withoutNulls;

  static DialCodeStruct fromSerializableMap(Map<String, dynamic> data) =>
      DialCodeStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        dialCode: deserializeParam(
          data['dial_code'],
          ParamType.String,
          false,
        ),
        flag: deserializeParam(
          data['flag'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DialCodeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DialCodeStruct &&
        name == other.name &&
        dialCode == other.dialCode &&
        flag == other.flag &&
        code == other.code;
  }

  @override
  int get hashCode => const ListEquality().hash([name, dialCode, flag, code]);
}

DialCodeStruct createDialCodeStruct({
  String? name,
  String? dialCode,
  String? flag,
  String? code,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DialCodeStruct(
      name: name,
      dialCode: dialCode,
      flag: flag,
      code: code,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DialCodeStruct? updateDialCodeStruct(
  DialCodeStruct? dialCodeStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dialCodeStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDialCodeStructData(
  Map<String, dynamic> firestoreData,
  DialCodeStruct? dialCodeStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dialCodeStruct == null) {
    return;
  }
  if (dialCodeStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dialCodeStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dialCodeStructData =
      getDialCodeFirestoreData(dialCodeStruct, forFieldValue);
  final nestedData =
      dialCodeStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dialCodeStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDialCodeFirestoreData(
  DialCodeStruct? dialCodeStruct, [
  bool forFieldValue = false,
]) {
  if (dialCodeStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dialCodeStruct.toMap());

  // Add any Firestore field values
  mapToFirestore(dialCodeStruct.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDialCodeListFirestoreData(
  List<DialCodeStruct>? dialCodeStructs,
) =>
    dialCodeStructs?.map((e) => getDialCodeFirestoreData(e, true)).toList() ??
    [];
