// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AiVibeStruct extends FFFirebaseStruct {
  AiVibeStruct({
    bool? isAgreed,
    String? version,
    DateTime? timeStamp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isAgreed = isAgreed,
        _version = version,
        _timeStamp = timeStamp,
        super(firestoreUtilData);

  // "is_agreed" field.
  bool? _isAgreed;
  bool get isAgreed => _isAgreed ?? false;
  set isAgreed(bool? val) => _isAgreed = val;

  bool hasIsAgreed() => _isAgreed != null;

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

  static AiVibeStruct fromMap(Map<String, dynamic> data) => AiVibeStruct(
        isAgreed: data['is_agreed'] as bool?,
        version: data['version'] as String?,
        timeStamp: data['time_stamp'] as DateTime?,
      );

  static AiVibeStruct? maybeFromMap(dynamic data) =>
      data is Map ? AiVibeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'is_agreed': _isAgreed,
        'version': _version,
        'time_stamp': _timeStamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'is_agreed': serializeParam(
          _isAgreed,
          ParamType.bool,
        ),
        'version': serializeParam(
          _version,
          ParamType.String,
        ),
        'time_stamp': serializeParam(
          _timeStamp,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static AiVibeStruct fromSerializableMap(Map<String, dynamic> data) =>
      AiVibeStruct(
        isAgreed: deserializeParam(
          data['is_agreed'],
          ParamType.bool,
          false,
        ),
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
      );

  @override
  String toString() => 'AiVibeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AiVibeStruct &&
        isAgreed == other.isAgreed &&
        version == other.version &&
        timeStamp == other.timeStamp;
  }

  @override
  int get hashCode => const ListEquality().hash([isAgreed, version, timeStamp]);
}

AiVibeStruct createAiVibeStruct({
  bool? isAgreed,
  String? version,
  DateTime? timeStamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AiVibeStruct(
      isAgreed: isAgreed,
      version: version,
      timeStamp: timeStamp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AiVibeStruct? updateAiVibeStruct(
  AiVibeStruct? aiVibe, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    aiVibe
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAiVibeStructData(
  Map<String, dynamic> firestoreData,
  AiVibeStruct? aiVibe,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (aiVibe == null) {
    return;
  }
  if (aiVibe.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && aiVibe.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final aiVibeData = getAiVibeFirestoreData(aiVibe, forFieldValue);
  final nestedData = aiVibeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = aiVibe.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAiVibeFirestoreData(
  AiVibeStruct? aiVibe, [
  bool forFieldValue = false,
]) {
  if (aiVibe == null) {
    return {};
  }
  final firestoreData = mapToFirestore(aiVibe.toMap());

  // Add any Firestore field values
  mapToFirestore(aiVibe.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAiVibeListFirestoreData(
  List<AiVibeStruct>? aiVibes,
) =>
    aiVibes?.map((e) => getAiVibeFirestoreData(e, true)).toList() ?? [];
