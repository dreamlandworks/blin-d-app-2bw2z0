// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMetricsRtdbStruct extends FFFirebaseStruct {
  ChatMetricsRtdbStruct({
    MsgMetricsRtdbStruct? messages,
    DateTime? startAt,
    DateTime? endAt,
    ExtensionStruct? extension,
    MsgCountStruct? msgCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _messages = messages,
        _startAt = startAt,
        _endAt = endAt,
        _extension = extension,
        _msgCount = msgCount,
        super(firestoreUtilData);

  // "messages" field.
  MsgMetricsRtdbStruct? _messages;
  MsgMetricsRtdbStruct get messages => _messages ?? MsgMetricsRtdbStruct();
  set messages(MsgMetricsRtdbStruct? val) => _messages = val;

  void updateMessages(Function(MsgMetricsRtdbStruct) updateFn) {
    updateFn(_messages ??= MsgMetricsRtdbStruct());
  }

  bool hasMessages() => _messages != null;

  // "start_at" field.
  DateTime? _startAt;
  DateTime? get startAt => _startAt;
  set startAt(DateTime? val) => _startAt = val;

  bool hasStartAt() => _startAt != null;

  // "end_at" field.
  DateTime? _endAt;
  DateTime? get endAt => _endAt;
  set endAt(DateTime? val) => _endAt = val;

  bool hasEndAt() => _endAt != null;

  // "extension" field.
  ExtensionStruct? _extension;
  ExtensionStruct get extension => _extension ?? ExtensionStruct();
  set extension(ExtensionStruct? val) => _extension = val;

  void updateExtension(Function(ExtensionStruct) updateFn) {
    updateFn(_extension ??= ExtensionStruct());
  }

  bool hasExtension() => _extension != null;

  // "msg_count" field.
  MsgCountStruct? _msgCount;
  MsgCountStruct get msgCount => _msgCount ?? MsgCountStruct();
  set msgCount(MsgCountStruct? val) => _msgCount = val;

  void updateMsgCount(Function(MsgCountStruct) updateFn) {
    updateFn(_msgCount ??= MsgCountStruct());
  }

  bool hasMsgCount() => _msgCount != null;

  static ChatMetricsRtdbStruct fromMap(Map<String, dynamic> data) =>
      ChatMetricsRtdbStruct(
        messages: data['messages'] is MsgMetricsRtdbStruct
            ? data['messages']
            : MsgMetricsRtdbStruct.maybeFromMap(data['messages']),
        startAt: data['start_at'] as DateTime?,
        endAt: data['end_at'] as DateTime?,
        extension: data['extension'] is ExtensionStruct
            ? data['extension']
            : ExtensionStruct.maybeFromMap(data['extension']),
        msgCount: data['msg_count'] is MsgCountStruct
            ? data['msg_count']
            : MsgCountStruct.maybeFromMap(data['msg_count']),
      );

  static ChatMetricsRtdbStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatMetricsRtdbStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'messages': _messages?.toMap(),
        'start_at': _startAt,
        'end_at': _endAt,
        'extension': _extension?.toMap(),
        'msg_count': _msgCount?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'messages': serializeParam(
          _messages,
          ParamType.DataStruct,
        ),
        'start_at': serializeParam(
          _startAt,
          ParamType.DateTime,
        ),
        'end_at': serializeParam(
          _endAt,
          ParamType.DateTime,
        ),
        'extension': serializeParam(
          _extension,
          ParamType.DataStruct,
        ),
        'msg_count': serializeParam(
          _msgCount,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ChatMetricsRtdbStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatMetricsRtdbStruct(
        messages: deserializeStructParam(
          data['messages'],
          ParamType.DataStruct,
          false,
          structBuilder: MsgMetricsRtdbStruct.fromSerializableMap,
        ),
        startAt: deserializeParam(
          data['start_at'],
          ParamType.DateTime,
          false,
        ),
        endAt: deserializeParam(
          data['end_at'],
          ParamType.DateTime,
          false,
        ),
        extension: deserializeStructParam(
          data['extension'],
          ParamType.DataStruct,
          false,
          structBuilder: ExtensionStruct.fromSerializableMap,
        ),
        msgCount: deserializeStructParam(
          data['msg_count'],
          ParamType.DataStruct,
          false,
          structBuilder: MsgCountStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ChatMetricsRtdbStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatMetricsRtdbStruct &&
        messages == other.messages &&
        startAt == other.startAt &&
        endAt == other.endAt &&
        extension == other.extension &&
        msgCount == other.msgCount;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([messages, startAt, endAt, extension, msgCount]);
}

ChatMetricsRtdbStruct createChatMetricsRtdbStruct({
  MsgMetricsRtdbStruct? messages,
  DateTime? startAt,
  DateTime? endAt,
  ExtensionStruct? extension,
  MsgCountStruct? msgCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatMetricsRtdbStruct(
      messages: messages ?? (clearUnsetFields ? MsgMetricsRtdbStruct() : null),
      startAt: startAt,
      endAt: endAt,
      extension: extension ?? (clearUnsetFields ? ExtensionStruct() : null),
      msgCount: msgCount ?? (clearUnsetFields ? MsgCountStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatMetricsRtdbStruct? updateChatMetricsRtdbStruct(
  ChatMetricsRtdbStruct? chatMetricsRtdb, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatMetricsRtdb
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatMetricsRtdbStructData(
  Map<String, dynamic> firestoreData,
  ChatMetricsRtdbStruct? chatMetricsRtdb,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatMetricsRtdb == null) {
    return;
  }
  if (chatMetricsRtdb.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatMetricsRtdb.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatMetricsRtdbData =
      getChatMetricsRtdbFirestoreData(chatMetricsRtdb, forFieldValue);
  final nestedData =
      chatMetricsRtdbData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatMetricsRtdb.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatMetricsRtdbFirestoreData(
  ChatMetricsRtdbStruct? chatMetricsRtdb, [
  bool forFieldValue = false,
]) {
  if (chatMetricsRtdb == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatMetricsRtdb.toMap());

  // Handle nested data for "messages" field.
  addMsgMetricsRtdbStructData(
    firestoreData,
    chatMetricsRtdb.hasMessages() ? chatMetricsRtdb.messages : null,
    'messages',
    forFieldValue,
  );

  // Handle nested data for "extension" field.
  addExtensionStructData(
    firestoreData,
    chatMetricsRtdb.hasExtension() ? chatMetricsRtdb.extension : null,
    'extension',
    forFieldValue,
  );

  // Handle nested data for "msg_count" field.
  addMsgCountStructData(
    firestoreData,
    chatMetricsRtdb.hasMsgCount() ? chatMetricsRtdb.msgCount : null,
    'msg_count',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(chatMetricsRtdb.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatMetricsRtdbListFirestoreData(
  List<ChatMetricsRtdbStruct>? chatMetricsRtdbs,
) =>
    chatMetricsRtdbs
        ?.map((e) => getChatMetricsRtdbFirestoreData(e, true))
        .toList() ??
    [];
