// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MsgCountStruct extends FFFirebaseStruct {
  MsgCountStruct({
    bool? init,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _init = init,
        super(firestoreUtilData);

  // "init" field.
  bool? _init;
  bool get init => _init ?? false;
  set init(bool? val) => _init = val;

  bool hasInit() => _init != null;

  static MsgCountStruct fromMap(Map<String, dynamic> data) => MsgCountStruct(
        init: data['init'] as bool?,
      );

  static MsgCountStruct? maybeFromMap(dynamic data) =>
      data is Map ? MsgCountStruct.fromMap(data.cast<String, dynamic>()) : null;

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

  static MsgCountStruct fromSerializableMap(Map<String, dynamic> data) =>
      MsgCountStruct(
        init: deserializeParam(
          data['init'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'MsgCountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MsgCountStruct && init == other.init;
  }

  @override
  int get hashCode => const ListEquality().hash([init]);
}

MsgCountStruct createMsgCountStruct({
  bool? init,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MsgCountStruct(
      init: init,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MsgCountStruct? updateMsgCountStruct(
  MsgCountStruct? msgCount, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    msgCount
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMsgCountStructData(
  Map<String, dynamic> firestoreData,
  MsgCountStruct? msgCount,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (msgCount == null) {
    return;
  }
  if (msgCount.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && msgCount.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final msgCountData = getMsgCountFirestoreData(msgCount, forFieldValue);
  final nestedData = msgCountData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = msgCount.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMsgCountFirestoreData(
  MsgCountStruct? msgCount, [
  bool forFieldValue = false,
]) {
  if (msgCount == null) {
    return {};
  }
  final firestoreData = mapToFirestore(msgCount.toMap());

  // Add any Firestore field values
  mapToFirestore(msgCount.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMsgCountListFirestoreData(
  List<MsgCountStruct>? msgCounts,
) =>
    msgCounts?.map((e) => getMsgCountFirestoreData(e, true)).toList() ?? [];
