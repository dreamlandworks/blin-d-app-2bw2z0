import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "match_score" field.
  int? _matchScore;
  int get matchScore => _matchScore ?? 0;
  bool hasMatchScore() => _matchScore != null;

  // "vault_ref" field.
  VaultRefStruct? _vaultRef;
  VaultRefStruct get vaultRef => _vaultRef ?? VaultRefStruct();
  bool hasVaultRef() => _vaultRef != null;

  // "expired_at" field.
  DateTime? _expiredAt;
  DateTime? get expiredAt => _expiredAt;
  bool hasExpiredAt() => _expiredAt != null;

  // "extension" field.
  ExtensionStruct? _extension;
  ExtensionStruct get extension => _extension ?? ExtensionStruct();
  bool hasExtension() => _extension != null;

  // "msg_count" field.
  MsgCountStruct? _msgCount;
  MsgCountStruct get msgCount => _msgCount ?? MsgCountStruct();
  bool hasMsgCount() => _msgCount != null;

  // "participants" field.
  ParticipantsStruct? _participants;
  ParticipantsStruct get participants => _participants ?? ParticipantsStruct();
  bool hasParticipants() => _participants != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _matchScore = castToType<int>(snapshotData['match_score']);
    _vaultRef = snapshotData['vault_ref'] is VaultRefStruct
        ? snapshotData['vault_ref']
        : VaultRefStruct.maybeFromMap(snapshotData['vault_ref']);
    _expiredAt = snapshotData['expired_at'] as DateTime?;
    _extension = snapshotData['extension'] is ExtensionStruct
        ? snapshotData['extension']
        : ExtensionStruct.maybeFromMap(snapshotData['extension']);
    _msgCount = snapshotData['msg_count'] is MsgCountStruct
        ? snapshotData['msg_count']
        : MsgCountStruct.maybeFromMap(snapshotData['msg_count']);
    _participants = snapshotData['participants'] is ParticipantsStruct
        ? snapshotData['participants']
        : ParticipantsStruct.maybeFromMap(snapshotData['participants']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? status,
  int? matchScore,
  VaultRefStruct? vaultRef,
  DateTime? expiredAt,
  ExtensionStruct? extension,
  MsgCountStruct? msgCount,
  ParticipantsStruct? participants,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'match_score': matchScore,
      'vault_ref': VaultRefStruct().toMap(),
      'expired_at': expiredAt,
      'extension': ExtensionStruct().toMap(),
      'msg_count': MsgCountStruct().toMap(),
      'participants': ParticipantsStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "vault_ref" field.
  addVaultRefStructData(firestoreData, vaultRef, 'vault_ref');

  // Handle nested data for "extension" field.
  addExtensionStructData(firestoreData, extension, 'extension');

  // Handle nested data for "msg_count" field.
  addMsgCountStructData(firestoreData, msgCount, 'msg_count');

  // Handle nested data for "participants" field.
  addParticipantsStructData(firestoreData, participants, 'participants');

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.matchScore == e2?.matchScore &&
        e1?.vaultRef == e2?.vaultRef &&
        e1?.expiredAt == e2?.expiredAt &&
        e1?.extension == e2?.extension &&
        e1?.msgCount == e2?.msgCount &&
        e1?.participants == e2?.participants;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.status,
        e?.matchScore,
        e?.vaultRef,
        e?.expiredAt,
        e?.extension,
        e?.msgCount,
        e?.participants
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
