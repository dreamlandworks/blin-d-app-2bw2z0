// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsFsStruct extends FFFirebaseStruct {
  ChatsFsStruct({
    ParticipantsStruct? participants,
    ChatStatus? status,
    int? matchScore,
    VaultRefStruct? vaultRefs,
    DateTime? startedAt,
    DateTime? endedAt,
    ExtensionStruct? extension,
    MsgCountStruct? msgCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _participants = participants,
        _status = status,
        _matchScore = matchScore,
        _vaultRefs = vaultRefs,
        _startedAt = startedAt,
        _endedAt = endedAt,
        _extension = extension,
        _msgCount = msgCount,
        super(firestoreUtilData);

  // "participants" field.
  ParticipantsStruct? _participants;
  ParticipantsStruct get participants => _participants ?? ParticipantsStruct();
  set participants(ParticipantsStruct? val) => _participants = val;

  void updateParticipants(Function(ParticipantsStruct) updateFn) {
    updateFn(_participants ??= ParticipantsStruct());
  }

  bool hasParticipants() => _participants != null;

  // "status" field.
  ChatStatus? _status;
  ChatStatus? get status => _status;
  set status(ChatStatus? val) => _status = val;

  bool hasStatus() => _status != null;

  // "match_score" field.
  int? _matchScore;
  int get matchScore => _matchScore ?? 0;
  set matchScore(int? val) => _matchScore = val;

  void incrementMatchScore(int amount) => matchScore = matchScore + amount;

  bool hasMatchScore() => _matchScore != null;

  // "vault_refs" field.
  VaultRefStruct? _vaultRefs;
  VaultRefStruct get vaultRefs => _vaultRefs ?? VaultRefStruct();
  set vaultRefs(VaultRefStruct? val) => _vaultRefs = val;

  void updateVaultRefs(Function(VaultRefStruct) updateFn) {
    updateFn(_vaultRefs ??= VaultRefStruct());
  }

  bool hasVaultRefs() => _vaultRefs != null;

  // "started_at" field.
  DateTime? _startedAt;
  DateTime? get startedAt => _startedAt;
  set startedAt(DateTime? val) => _startedAt = val;

  bool hasStartedAt() => _startedAt != null;

  // "ended_at" field.
  DateTime? _endedAt;
  DateTime? get endedAt => _endedAt;
  set endedAt(DateTime? val) => _endedAt = val;

  bool hasEndedAt() => _endedAt != null;

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

  static ChatsFsStruct fromMap(Map<String, dynamic> data) => ChatsFsStruct(
        participants: data['participants'] is ParticipantsStruct
            ? data['participants']
            : ParticipantsStruct.maybeFromMap(data['participants']),
        status: data['status'] is ChatStatus
            ? data['status']
            : deserializeEnum<ChatStatus>(data['status']),
        matchScore: castToType<int>(data['match_score']),
        vaultRefs: data['vault_refs'] is VaultRefStruct
            ? data['vault_refs']
            : VaultRefStruct.maybeFromMap(data['vault_refs']),
        startedAt: data['started_at'] as DateTime?,
        endedAt: data['ended_at'] as DateTime?,
        extension: data['extension'] is ExtensionStruct
            ? data['extension']
            : ExtensionStruct.maybeFromMap(data['extension']),
        msgCount: data['msg_count'] is MsgCountStruct
            ? data['msg_count']
            : MsgCountStruct.maybeFromMap(data['msg_count']),
      );

  static ChatsFsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatsFsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'participants': _participants?.toMap(),
        'status': _status?.serialize(),
        'match_score': _matchScore,
        'vault_refs': _vaultRefs?.toMap(),
        'started_at': _startedAt,
        'ended_at': _endedAt,
        'extension': _extension?.toMap(),
        'msg_count': _msgCount?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'participants': serializeParam(
          _participants,
          ParamType.DataStruct,
        ),
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
        'match_score': serializeParam(
          _matchScore,
          ParamType.int,
        ),
        'vault_refs': serializeParam(
          _vaultRefs,
          ParamType.DataStruct,
        ),
        'started_at': serializeParam(
          _startedAt,
          ParamType.DateTime,
        ),
        'ended_at': serializeParam(
          _endedAt,
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

  static ChatsFsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatsFsStruct(
        participants: deserializeStructParam(
          data['participants'],
          ParamType.DataStruct,
          false,
          structBuilder: ParticipantsStruct.fromSerializableMap,
        ),
        status: deserializeParam<ChatStatus>(
          data['status'],
          ParamType.Enum,
          false,
        ),
        matchScore: deserializeParam(
          data['match_score'],
          ParamType.int,
          false,
        ),
        vaultRefs: deserializeStructParam(
          data['vault_refs'],
          ParamType.DataStruct,
          false,
          structBuilder: VaultRefStruct.fromSerializableMap,
        ),
        startedAt: deserializeParam(
          data['started_at'],
          ParamType.DateTime,
          false,
        ),
        endedAt: deserializeParam(
          data['ended_at'],
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
  String toString() => 'ChatsFsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatsFsStruct &&
        participants == other.participants &&
        status == other.status &&
        matchScore == other.matchScore &&
        vaultRefs == other.vaultRefs &&
        startedAt == other.startedAt &&
        endedAt == other.endedAt &&
        extension == other.extension &&
        msgCount == other.msgCount;
  }

  @override
  int get hashCode => const ListEquality().hash([
        participants,
        status,
        matchScore,
        vaultRefs,
        startedAt,
        endedAt,
        extension,
        msgCount
      ]);
}

ChatsFsStruct createChatsFsStruct({
  ParticipantsStruct? participants,
  ChatStatus? status,
  int? matchScore,
  VaultRefStruct? vaultRefs,
  DateTime? startedAt,
  DateTime? endedAt,
  ExtensionStruct? extension,
  MsgCountStruct? msgCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatsFsStruct(
      participants:
          participants ?? (clearUnsetFields ? ParticipantsStruct() : null),
      status: status,
      matchScore: matchScore,
      vaultRefs: vaultRefs ?? (clearUnsetFields ? VaultRefStruct() : null),
      startedAt: startedAt,
      endedAt: endedAt,
      extension: extension ?? (clearUnsetFields ? ExtensionStruct() : null),
      msgCount: msgCount ?? (clearUnsetFields ? MsgCountStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatsFsStruct? updateChatsFsStruct(
  ChatsFsStruct? chatsFs, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatsFs
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatsFsStructData(
  Map<String, dynamic> firestoreData,
  ChatsFsStruct? chatsFs,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatsFs == null) {
    return;
  }
  if (chatsFs.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatsFs.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatsFsData = getChatsFsFirestoreData(chatsFs, forFieldValue);
  final nestedData = chatsFsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatsFs.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatsFsFirestoreData(
  ChatsFsStruct? chatsFs, [
  bool forFieldValue = false,
]) {
  if (chatsFs == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatsFs.toMap());

  // Handle nested data for "participants" field.
  addParticipantsStructData(
    firestoreData,
    chatsFs.hasParticipants() ? chatsFs.participants : null,
    'participants',
    forFieldValue,
  );

  // Handle nested data for "vault_refs" field.
  addVaultRefStructData(
    firestoreData,
    chatsFs.hasVaultRefs() ? chatsFs.vaultRefs : null,
    'vault_refs',
    forFieldValue,
  );

  // Handle nested data for "extension" field.
  addExtensionStructData(
    firestoreData,
    chatsFs.hasExtension() ? chatsFs.extension : null,
    'extension',
    forFieldValue,
  );

  // Handle nested data for "msg_count" field.
  addMsgCountStructData(
    firestoreData,
    chatsFs.hasMsgCount() ? chatsFs.msgCount : null,
    'msg_count',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(chatsFs.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatsFsListFirestoreData(
  List<ChatsFsStruct>? chatsFss,
) =>
    chatsFss?.map((e) => getChatsFsFirestoreData(e, true)).toList() ?? [];
