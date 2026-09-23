// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TermsStruct extends FFFirebaseStruct {
  TermsStruct({
    String? version,
    DateTime? timeStamp,
    bool? isAgreed,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _version = version,
        _timeStamp = timeStamp,
        _isAgreed = isAgreed,
        super(firestoreUtilData);

  // "version" field.
  String? _version;
  String get version => _version ?? '';
  set version(String? val) => _version = val;

  bool hasVersion() => _version != null;

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  set timeStamp(DateTime? val) => _timeStamp = val;

  bool hasTimeStamp() => _timeStamp != null;

  // "is_agreed" field.
  bool? _isAgreed;
  bool get isAgreed => _isAgreed ?? false;
  set isAgreed(bool? val) => _isAgreed = val;

  bool hasIsAgreed() => _isAgreed != null;

  static TermsStruct fromMap(Map<String, dynamic> data) => TermsStruct(
        version: data['version'] as String?,
        timeStamp: data['time_stamp'] as DateTime?,
        isAgreed: data['is_agreed'] as bool?,
      );

  static TermsStruct? maybeFromMap(dynamic data) =>
      data is Map ? TermsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'version': _version,
        'time_stamp': _timeStamp,
        'is_agreed': _isAgreed,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'version': serializeParam(
          _version,
          ParamType.String,
        ),
        'time_stamp': serializeParam(
          _timeStamp,
          ParamType.DateTime,
        ),
        'is_agreed': serializeParam(
          _isAgreed,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TermsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TermsStruct(
        version: deserializeParam(
          data['version'],
          ParamType.String,
          false,
        ),
        timeStamp: deserializeParam(
          data['time_stamp'],
          ParamType.DateTime,
          false,
        ),
        isAgreed: deserializeParam(
          data['is_agreed'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TermsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TermsStruct &&
        version == other.version &&
        timeStamp == other.timeStamp &&
        isAgreed == other.isAgreed;
  }

  @override
  int get hashCode => const ListEquality().hash([version, timeStamp, isAgreed]);
}

TermsStruct createTermsStruct({
  String? version,
  DateTime? timeStamp,
  bool? isAgreed,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TermsStruct(
      version: version,
      timeStamp: timeStamp,
      isAgreed: isAgreed,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TermsStruct? updateTermsStruct(
  TermsStruct? terms, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    terms
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTermsStructData(
  Map<String, dynamic> firestoreData,
  TermsStruct? terms,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (terms == null) {
    return;
  }
  if (terms.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && terms.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final termsData = getTermsFirestoreData(terms, forFieldValue);
  final nestedData = termsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = terms.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTermsFirestoreData(
  TermsStruct? terms, [
  bool forFieldValue = false,
]) {
  if (terms == null) {
    return {};
  }
  final firestoreData = mapToFirestore(terms.toMap());

  // Add any Firestore field values
  mapToFirestore(terms.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTermsListFirestoreData(
  List<TermsStruct>? termss,
) =>
    termss?.map((e) => getTermsFirestoreData(e, true)).toList() ?? [];
