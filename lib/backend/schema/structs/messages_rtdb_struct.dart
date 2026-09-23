// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MessagesRtdbStruct extends FFFirebaseStruct {
  MessagesRtdbStruct({
    String? messageId,
    DocumentReference? senderId,
    String? text,
    DateTime? timeStamp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _messageId = messageId,
        _senderId = senderId,
        _text = text,
        _timeStamp = timeStamp,
        super(firestoreUtilData);

  // "message_id" field.
  String? _messageId;
  String get messageId => _messageId ?? '';
  set messageId(String? val) => _messageId = val;

  bool hasMessageId() => _messageId != null;

  // "sender_id" field.
  DocumentReference? _senderId;
  DocumentReference? get senderId => _senderId;
  set senderId(DocumentReference? val) => _senderId = val;

  bool hasSenderId() => _senderId != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  set timeStamp(DateTime? val) => _timeStamp = val;

  bool hasTimeStamp() => _timeStamp != null;

  static MessagesRtdbStruct fromMap(Map<String, dynamic> data) =>
      MessagesRtdbStruct(
        messageId: data['message_id'] as String?,
        senderId: data['sender_id'] as DocumentReference?,
        text: data['text'] as String?,
        timeStamp: data['timeStamp'] as DateTime?,
      );

  static MessagesRtdbStruct? maybeFromMap(dynamic data) => data is Map
      ? MessagesRtdbStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'message_id': _messageId,
        'sender_id': _senderId,
        'text': _text,
        'timeStamp': _timeStamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message_id': serializeParam(
          _messageId,
          ParamType.String,
        ),
        'sender_id': serializeParam(
          _senderId,
          ParamType.DocumentReference,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'timeStamp': serializeParam(
          _timeStamp,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static MessagesRtdbStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessagesRtdbStruct(
        messageId: deserializeParam(
          data['message_id'],
          ParamType.String,
          false,
        ),
        senderId: deserializeParam(
          data['sender_id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        timeStamp: deserializeParam(
          data['timeStamp'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'MessagesRtdbStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MessagesRtdbStruct &&
        messageId == other.messageId &&
        senderId == other.senderId &&
        text == other.text &&
        timeStamp == other.timeStamp;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([messageId, senderId, text, timeStamp]);
}

MessagesRtdbStruct createMessagesRtdbStruct({
  String? messageId,
  DocumentReference? senderId,
  String? text,
  DateTime? timeStamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MessagesRtdbStruct(
      messageId: messageId,
      senderId: senderId,
      text: text,
      timeStamp: timeStamp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MessagesRtdbStruct? updateMessagesRtdbStruct(
  MessagesRtdbStruct? messagesRtdb, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    messagesRtdb
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMessagesRtdbStructData(
  Map<String, dynamic> firestoreData,
  MessagesRtdbStruct? messagesRtdb,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (messagesRtdb == null) {
    return;
  }
  if (messagesRtdb.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && messagesRtdb.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final messagesRtdbData =
      getMessagesRtdbFirestoreData(messagesRtdb, forFieldValue);
  final nestedData =
      messagesRtdbData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = messagesRtdb.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMessagesRtdbFirestoreData(
  MessagesRtdbStruct? messagesRtdb, [
  bool forFieldValue = false,
]) {
  if (messagesRtdb == null) {
    return {};
  }
  final firestoreData = mapToFirestore(messagesRtdb.toMap());

  // Add any Firestore field values
  mapToFirestore(messagesRtdb.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMessagesRtdbListFirestoreData(
  List<MessagesRtdbStruct>? messagesRtdbs,
) =>
    messagesRtdbs?.map((e) => getMessagesRtdbFirestoreData(e, true)).toList() ??
    [];
