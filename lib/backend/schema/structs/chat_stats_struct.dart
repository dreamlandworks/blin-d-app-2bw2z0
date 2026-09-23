// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChatStatsStruct extends FFFirebaseStruct {
  ChatStatsStruct({
    int? matchScore,
    int? msgCountMe,
    int? msgCountPartner,
    int? msgCountAll,
    bool? isRevealed,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _matchScore = matchScore,
        _msgCountMe = msgCountMe,
        _msgCountPartner = msgCountPartner,
        _msgCountAll = msgCountAll,
        _isRevealed = isRevealed,
        super(firestoreUtilData);

  // "match_score" field.
  int? _matchScore;
  int get matchScore => _matchScore ?? 0;
  set matchScore(int? val) => _matchScore = val;

  void incrementMatchScore(int amount) => matchScore = matchScore + amount;

  bool hasMatchScore() => _matchScore != null;

  // "msg_count_me" field.
  int? _msgCountMe;
  int get msgCountMe => _msgCountMe ?? 0;
  set msgCountMe(int? val) => _msgCountMe = val;

  void incrementMsgCountMe(int amount) => msgCountMe = msgCountMe + amount;

  bool hasMsgCountMe() => _msgCountMe != null;

  // "msg_count_partner" field.
  int? _msgCountPartner;
  int get msgCountPartner => _msgCountPartner ?? 0;
  set msgCountPartner(int? val) => _msgCountPartner = val;

  void incrementMsgCountPartner(int amount) =>
      msgCountPartner = msgCountPartner + amount;

  bool hasMsgCountPartner() => _msgCountPartner != null;

  // "msg_count_all" field.
  int? _msgCountAll;
  int get msgCountAll => _msgCountAll ?? 0;
  set msgCountAll(int? val) => _msgCountAll = val;

  void incrementMsgCountAll(int amount) => msgCountAll = msgCountAll + amount;

  bool hasMsgCountAll() => _msgCountAll != null;

  // "is_revealed" field.
  bool? _isRevealed;
  bool get isRevealed => _isRevealed ?? false;
  set isRevealed(bool? val) => _isRevealed = val;

  bool hasIsRevealed() => _isRevealed != null;

  static ChatStatsStruct fromMap(Map<String, dynamic> data) => ChatStatsStruct(
        matchScore: castToType<int>(data['match_score']),
        msgCountMe: castToType<int>(data['msg_count_me']),
        msgCountPartner: castToType<int>(data['msg_count_partner']),
        msgCountAll: castToType<int>(data['msg_count_all']),
        isRevealed: data['is_revealed'] as bool?,
      );

  static ChatStatsStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatStatsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'match_score': _matchScore,
        'msg_count_me': _msgCountMe,
        'msg_count_partner': _msgCountPartner,
        'msg_count_all': _msgCountAll,
        'is_revealed': _isRevealed,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'match_score': serializeParam(
          _matchScore,
          ParamType.int,
        ),
        'msg_count_me': serializeParam(
          _msgCountMe,
          ParamType.int,
        ),
        'msg_count_partner': serializeParam(
          _msgCountPartner,
          ParamType.int,
        ),
        'msg_count_all': serializeParam(
          _msgCountAll,
          ParamType.int,
        ),
        'is_revealed': serializeParam(
          _isRevealed,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ChatStatsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatStatsStruct(
        matchScore: deserializeParam(
          data['match_score'],
          ParamType.int,
          false,
        ),
        msgCountMe: deserializeParam(
          data['msg_count_me'],
          ParamType.int,
          false,
        ),
        msgCountPartner: deserializeParam(
          data['msg_count_partner'],
          ParamType.int,
          false,
        ),
        msgCountAll: deserializeParam(
          data['msg_count_all'],
          ParamType.int,
          false,
        ),
        isRevealed: deserializeParam(
          data['is_revealed'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ChatStatsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatStatsStruct &&
        matchScore == other.matchScore &&
        msgCountMe == other.msgCountMe &&
        msgCountPartner == other.msgCountPartner &&
        msgCountAll == other.msgCountAll &&
        isRevealed == other.isRevealed;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([matchScore, msgCountMe, msgCountPartner, msgCountAll, isRevealed]);
}

ChatStatsStruct createChatStatsStruct({
  int? matchScore,
  int? msgCountMe,
  int? msgCountPartner,
  int? msgCountAll,
  bool? isRevealed,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatStatsStruct(
      matchScore: matchScore,
      msgCountMe: msgCountMe,
      msgCountPartner: msgCountPartner,
      msgCountAll: msgCountAll,
      isRevealed: isRevealed,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatStatsStruct? updateChatStatsStruct(
  ChatStatsStruct? chatStats, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatStats
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatStatsStructData(
  Map<String, dynamic> firestoreData,
  ChatStatsStruct? chatStats,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatStats == null) {
    return;
  }
  if (chatStats.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatStats.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatStatsData = getChatStatsFirestoreData(chatStats, forFieldValue);
  final nestedData = chatStatsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatStats.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatStatsFirestoreData(
  ChatStatsStruct? chatStats, [
  bool forFieldValue = false,
]) {
  if (chatStats == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatStats.toMap());

  // Add any Firestore field values
  mapToFirestore(chatStats.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatStatsListFirestoreData(
  List<ChatStatsStruct>? chatStatss,
) =>
    chatStatss?.map((e) => getChatStatsFirestoreData(e, true)).toList() ?? [];
