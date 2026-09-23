// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ParticipantsStruct extends FFFirebaseStruct {
  ParticipantsStruct({
    bool? init,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _init = init,
        super(firestoreUtilData);

  // "init" field.
  bool? _init;
  bool get init => _init ?? false;
  set init(bool? val) => _init = val;

  bool hasInit() => _init != null;

  static ParticipantsStruct fromMap(Map<String, dynamic> data) =>
      ParticipantsStruct(
        init: data['init'] as bool?,
      );

  static ParticipantsStruct? maybeFromMap(dynamic data) => data is Map
      ? ParticipantsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'init': _init,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'init': serializeParam(
          _init,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ParticipantsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ParticipantsStruct(
        init: deserializeParam(
          data['init'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ParticipantsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ParticipantsStruct && init == other.init;
  }

  @override
  int get hashCode => const ListEquality().hash([init]);
}

ParticipantsStruct createParticipantsStruct({
  bool? init,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ParticipantsStruct(
      init: init,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ParticipantsStruct? updateParticipantsStruct(
  ParticipantsStruct? participants, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    participants
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addParticipantsStructData(
  Map<String, dynamic> firestoreData,
  ParticipantsStruct? participants,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (participants == null) {
    return;
  }
  if (participants.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && participants.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final participantsData =
      getParticipantsFirestoreData(participants, forFieldValue);
  final nestedData =
      participantsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = participants.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getParticipantsFirestoreData(
  ParticipantsStruct? participants, [
  bool forFieldValue = false,
]) {
  if (participants == null) {
    return {};
  }
  final firestoreData = mapToFirestore(participants.toMap());

  // Add any Firestore field values
  mapToFirestore(participants.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getParticipantsListFirestoreData(
  List<ParticipantsStruct>? participantss,
) =>
    participantss?.map((e) => getParticipantsFirestoreData(e, true)).toList() ??
    [];
