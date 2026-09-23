// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PermLastMessageStruct extends FFFirebaseStruct {
  PermLastMessageStruct({
    String? text,
    DateTime? ts,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _ts = ts,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "ts" field.
  DateTime? _ts;
  DateTime? get ts => _ts;
  set ts(DateTime? val) => _ts = val;

  bool hasTs() => _ts != null;

  static PermLastMessageStruct fromMap(Map<String, dynamic> data) =>
      PermLastMessageStruct(
        text: data['text'] as String?,
        ts: data['ts'] as DateTime?,
      );

  static PermLastMessageStruct? maybeFromMap(dynamic data) => data is Map
      ? PermLastMessageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'ts': _ts,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'ts': serializeParam(
          _ts,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static PermLastMessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      PermLastMessageStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        ts: deserializeParam(
          data['ts'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'PermLastMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PermLastMessageStruct &&
        text == other.text &&
        ts == other.ts;
  }

  @override
  int get hashCode => const ListEquality().hash([text, ts]);
}

PermLastMessageStruct createPermLastMessageStruct({
  String? text,
  DateTime? ts,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PermLastMessageStruct(
      text: text,
      ts: ts,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PermLastMessageStruct? updatePermLastMessageStruct(
  PermLastMessageStruct? permLastMessage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    permLastMessage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPermLastMessageStructData(
  Map<String, dynamic> firestoreData,
  PermLastMessageStruct? permLastMessage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (permLastMessage == null) {
    return;
  }
  if (permLastMessage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && permLastMessage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final permLastMessageData =
      getPermLastMessageFirestoreData(permLastMessage, forFieldValue);
  final nestedData =
      permLastMessageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = permLastMessage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPermLastMessageFirestoreData(
  PermLastMessageStruct? permLastMessage, [
  bool forFieldValue = false,
]) {
  if (permLastMessage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(permLastMessage.toMap());

  // Add any Firestore field values
  mapToFirestore(permLastMessage.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPermLastMessageListFirestoreData(
  List<PermLastMessageStruct>? permLastMessages,
) =>
    permLastMessages
        ?.map((e) => getPermLastMessageFirestoreData(e, true))
        .toList() ??
    [];
