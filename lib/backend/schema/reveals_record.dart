import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RevealsRecord extends FirestoreRecord {
  RevealsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "request_id" field.
  String? _requestId;
  String get requestId => _requestId ?? '';
  bool hasRequestId() => _requestId != null;

  // "owner_uid" field.
  String? _ownerUid;
  String get ownerUid => _ownerUid ?? '';
  bool hasOwnerUid() => _ownerUid != null;

  // "partner_uid" field.
  String? _partnerUid;
  String get partnerUid => _partnerUid ?? '';
  bool hasPartnerUid() => _partnerUid != null;

  // "fields" field.
  List<String>? _fields;
  List<String> get fields => _fields ?? const [];
  bool hasFields() => _fields != null;

  // "accepted_timestamp" field.
  DateTime? _acceptedTimestamp;
  DateTime? get acceptedTimestamp => _acceptedTimestamp;
  bool hasAcceptedTimestamp() => _acceptedTimestamp != null;

  // "chat_id" field.
  String? _chatId;
  String get chatId => _chatId ?? '';
  bool hasChatId() => _chatId != null;

  void _initializeFields() {
    _requestId = snapshotData['request_id'] as String?;
    _ownerUid = snapshotData['owner_uid'] as String?;
    _partnerUid = snapshotData['partner_uid'] as String?;
    _fields = getDataList(snapshotData['fields']);
    _acceptedTimestamp = snapshotData['accepted_timestamp'] as DateTime?;
    _chatId = snapshotData['chat_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reveals');

  static Stream<RevealsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RevealsRecord.fromSnapshot(s));

  static Future<RevealsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RevealsRecord.fromSnapshot(s));

  static RevealsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RevealsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RevealsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RevealsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RevealsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RevealsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRevealsRecordData({
  String? requestId,
  String? ownerUid,
  String? partnerUid,
  DateTime? acceptedTimestamp,
  String? chatId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'request_id': requestId,
      'owner_uid': ownerUid,
      'partner_uid': partnerUid,
      'accepted_timestamp': acceptedTimestamp,
      'chat_id': chatId,
    }.withoutNulls,
  );

  return firestoreData;
}

class RevealsRecordDocumentEquality implements Equality<RevealsRecord> {
  const RevealsRecordDocumentEquality();

  @override
  bool equals(RevealsRecord? e1, RevealsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.requestId == e2?.requestId &&
        e1?.ownerUid == e2?.ownerUid &&
        e1?.partnerUid == e2?.partnerUid &&
        listEquality.equals(e1?.fields, e2?.fields) &&
        e1?.acceptedTimestamp == e2?.acceptedTimestamp &&
        e1?.chatId == e2?.chatId;
  }

  @override
  int hash(RevealsRecord? e) => const ListEquality().hash([
        e?.requestId,
        e?.ownerUid,
        e?.partnerUid,
        e?.fields,
        e?.acceptedTimestamp,
        e?.chatId
      ]);

  @override
  bool isValidKey(Object? o) => o is RevealsRecord;
}
