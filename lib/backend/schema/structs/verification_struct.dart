// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class VerificationStruct extends FFFirebaseStruct {
  VerificationStruct({
    String? status,
    String? method,
    String? platform,
    String? refId,
    bool? isAdult,
    DateTime? verifiedAt,
    String? responsePath,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _method = method,
        _platform = platform,
        _refId = refId,
        _isAdult = isAdult,
        _verifiedAt = verifiedAt,
        _responsePath = responsePath,
        super(firestoreUtilData);

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "method" field.
  String? _method;
  String get method => _method ?? '';
  set method(String? val) => _method = val;

  bool hasMethod() => _method != null;

  // "platform" field.
  String? _platform;
  String get platform => _platform ?? '';
  set platform(String? val) => _platform = val;

  bool hasPlatform() => _platform != null;

  // "ref_id" field.
  String? _refId;
  String get refId => _refId ?? '';
  set refId(String? val) => _refId = val;

  bool hasRefId() => _refId != null;

  // "is_adult" field.
  bool? _isAdult;
  bool get isAdult => _isAdult ?? true;
  set isAdult(bool? val) => _isAdult = val;

  bool hasIsAdult() => _isAdult != null;

  // "verified_at" field.
  DateTime? _verifiedAt;
  DateTime? get verifiedAt => _verifiedAt;
  set verifiedAt(DateTime? val) => _verifiedAt = val;

  bool hasVerifiedAt() => _verifiedAt != null;

  // "response_path" field.
  String? _responsePath;
  String get responsePath => _responsePath ?? '';
  set responsePath(String? val) => _responsePath = val;

  bool hasResponsePath() => _responsePath != null;

  static VerificationStruct fromMap(Map<String, dynamic> data) =>
      VerificationStruct(
        status: data['status'] as String?,
        method: data['method'] as String?,
        platform: data['platform'] as String?,
        refId: data['ref_id'] as String?,
        isAdult: data['is_adult'] as bool?,
        verifiedAt: data['verified_at'] as DateTime?,
        responsePath: data['response_path'] as String?,
      );

  static VerificationStruct? maybeFromMap(dynamic data) => data is Map
      ? VerificationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'method': _method,
        'platform': _platform,
        'ref_id': _refId,
        'is_adult': _isAdult,
        'verified_at': _verifiedAt,
        'response_path': _responsePath,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'method': serializeParam(
          _method,
          ParamType.String,
        ),
        'platform': serializeParam(
          _platform,
          ParamType.String,
        ),
        'ref_id': serializeParam(
          _refId,
          ParamType.String,
        ),
        'is_adult': serializeParam(
          _isAdult,
          ParamType.bool,
        ),
        'verified_at': serializeParam(
          _verifiedAt,
          ParamType.DateTime,
        ),
        'response_path': serializeParam(
          _responsePath,
          ParamType.String,
        ),
      }.withoutNulls;

  static VerificationStruct fromSerializableMap(Map<String, dynamic> data) =>
      VerificationStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        method: deserializeParam(
          data['method'],
          ParamType.String,
          false,
        ),
        platform: deserializeParam(
          data['platform'],
          ParamType.String,
          false,
        ),
        refId: deserializeParam(
          data['ref_id'],
          ParamType.String,
          false,
        ),
        isAdult: deserializeParam(
          data['is_adult'],
          ParamType.bool,
          false,
        ),
        verifiedAt: deserializeParam(
          data['verified_at'],
          ParamType.DateTime,
          false,
        ),
        responsePath: deserializeParam(
          data['response_path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VerificationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VerificationStruct &&
        status == other.status &&
        method == other.method &&
        platform == other.platform &&
        refId == other.refId &&
        isAdult == other.isAdult &&
        verifiedAt == other.verifiedAt &&
        responsePath == other.responsePath;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [status, method, platform, refId, isAdult, verifiedAt, responsePath]);
}

VerificationStruct createVerificationStruct({
  String? status,
  String? method,
  String? platform,
  String? refId,
  bool? isAdult,
  DateTime? verifiedAt,
  String? responsePath,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VerificationStruct(
      status: status,
      method: method,
      platform: platform,
      refId: refId,
      isAdult: isAdult,
      verifiedAt: verifiedAt,
      responsePath: responsePath,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VerificationStruct? updateVerificationStruct(
  VerificationStruct? verification, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    verification
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVerificationStructData(
  Map<String, dynamic> firestoreData,
  VerificationStruct? verification,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (verification == null) {
    return;
  }
  if (verification.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && verification.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final verificationData =
      getVerificationFirestoreData(verification, forFieldValue);
  final nestedData =
      verificationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = verification.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVerificationFirestoreData(
  VerificationStruct? verification, [
  bool forFieldValue = false,
]) {
  if (verification == null) {
    return {};
  }
  final firestoreData = mapToFirestore(verification.toMap());

  // Add any Firestore field values
  mapToFirestore(verification.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVerificationListFirestoreData(
  List<VerificationStruct>? verifications,
) =>
    verifications?.map((e) => getVerificationFirestoreData(e, true)).toList() ??
    [];
