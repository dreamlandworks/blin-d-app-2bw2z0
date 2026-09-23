import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestsRecord extends FirestoreRecord {
  RequestsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "chat_id" field.
  String? _chatId;
  String get chatId => _chatId ?? '';
  bool hasChatId() => _chatId != null;

  // "coins_spent" field.
  int? _coinsSpent;
  int get coinsSpent => _coinsSpent ?? 0;
  bool hasCoinsSpent() => _coinsSpent != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "direction" field.
  String? _direction;
  String get direction => _direction ?? '';
  bool hasDirection() => _direction != null;

  // "owner_uid" field.
  String? _ownerUid;
  String get ownerUid => _ownerUid ?? '';
  bool hasOwnerUid() => _ownerUid != null;

  // "partner_uid" field.
  String? _partnerUid;
  String get partnerUid => _partnerUid ?? '';
  bool hasPartnerUid() => _partnerUid != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _chatId = snapshotData['chat_id'] as String?;
    _coinsSpent = castToType<int>(snapshotData['coins_spent']);
    _status = snapshotData['status'] as String?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _direction = snapshotData['direction'] as String?;
    _ownerUid = snapshotData['owner_uid'] as String?;
    _partnerUid = snapshotData['partner_uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('requests');

  static Stream<RequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestsRecord.fromSnapshot(s));

  static Future<RequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestsRecord.fromSnapshot(s));

  static RequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestsRecordData({
  String? type,
  String? chatId,
  int? coinsSpent,
  String? status,
  DateTime? updatedAt,
  String? direction,
  String? ownerUid,
  String? partnerUid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'chat_id': chatId,
      'coins_spent': coinsSpent,
      'status': status,
      'updated_at': updatedAt,
      'direction': direction,
      'owner_uid': ownerUid,
      'partner_uid': partnerUid,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestsRecordDocumentEquality implements Equality<RequestsRecord> {
  const RequestsRecordDocumentEquality();

  @override
  bool equals(RequestsRecord? e1, RequestsRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.chatId == e2?.chatId &&
        e1?.coinsSpent == e2?.coinsSpent &&
        e1?.status == e2?.status &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.direction == e2?.direction &&
        e1?.ownerUid == e2?.ownerUid &&
        e1?.partnerUid == e2?.partnerUid;
  }

  @override
  int hash(RequestsRecord? e) => const ListEquality().hash([
        e?.type,
        e?.chatId,
        e?.coinsSpent,
        e?.status,
        e?.updatedAt,
        e?.direction,
        e?.ownerUid,
        e?.partnerUid
      ]);

  @override
  bool isValidKey(Object? o) => o is RequestsRecord;
}
