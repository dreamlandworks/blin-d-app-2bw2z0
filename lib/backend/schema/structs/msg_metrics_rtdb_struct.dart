// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MsgMetricsRtdbStruct extends FFFirebaseStruct {
  MsgMetricsRtdbStruct({
    String? msgId,
    DateTime? latId,
    DateTime? latM,
    DateTime? hes,
    int? bs,
    int? len,
    int? spd,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _msgId = msgId,
        _latId = latId,
        _latM = latM,
        _hes = hes,
        _bs = bs,
        _len = len,
        _spd = spd,
        super(firestoreUtilData);

  // "msg_id" field.
  String? _msgId;
  String get msgId => _msgId ?? '';
  set msgId(String? val) => _msgId = val;

  bool hasMsgId() => _msgId != null;

  // "lat_id" field.
  DateTime? _latId;
  DateTime? get latId => _latId;
  set latId(DateTime? val) => _latId = val;

  bool hasLatId() => _latId != null;

  // "lat_m" field.
  DateTime? _latM;
  DateTime? get latM => _latM;
  set latM(DateTime? val) => _latM = val;

  bool hasLatM() => _latM != null;

  // "hes" field.
  DateTime? _hes;
  DateTime? get hes => _hes;
  set hes(DateTime? val) => _hes = val;

  bool hasHes() => _hes != null;

  // "bs" field.
  int? _bs;
  int get bs => _bs ?? 0;
  set bs(int? val) => _bs = val;

  void incrementBs(int amount) => bs = bs + amount;

  bool hasBs() => _bs != null;

  // "len" field.
  int? _len;
  int get len => _len ?? 0;
  set len(int? val) => _len = val;

  void incrementLen(int amount) => len = len + amount;

  bool hasLen() => _len != null;

  // "spd" field.
  int? _spd;
  int get spd => _spd ?? 0;
  set spd(int? val) => _spd = val;

  void incrementSpd(int amount) => spd = spd + amount;

  bool hasSpd() => _spd != null;

  static MsgMetricsRtdbStruct fromMap(Map<String, dynamic> data) =>
      MsgMetricsRtdbStruct(
        msgId: data['msg_id'] as String?,
        latId: data['lat_id'] as DateTime?,
        latM: data['lat_m'] as DateTime?,
        hes: data['hes'] as DateTime?,
        bs: castToType<int>(data['bs']),
        len: castToType<int>(data['len']),
        spd: castToType<int>(data['spd']),
      );

  static MsgMetricsRtdbStruct? maybeFromMap(dynamic data) => data is Map
      ? MsgMetricsRtdbStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'msg_id': _msgId,
        'lat_id': _latId,
        'lat_m': _latM,
        'hes': _hes,
        'bs': _bs,
        'len': _len,
        'spd': _spd,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'msg_id': serializeParam(
          _msgId,
          ParamType.String,
        ),
        'lat_id': serializeParam(
          _latId,
          ParamType.DateTime,
        ),
        'lat_m': serializeParam(
          _latM,
          ParamType.DateTime,
        ),
        'hes': serializeParam(
          _hes,
          ParamType.DateTime,
        ),
        'bs': serializeParam(
          _bs,
          ParamType.int,
        ),
        'len': serializeParam(
          _len,
          ParamType.int,
        ),
        'spd': serializeParam(
          _spd,
          ParamType.int,
        ),
      }.withoutNulls;

  static MsgMetricsRtdbStruct fromSerializableMap(Map<String, dynamic> data) =>
      MsgMetricsRtdbStruct(
        msgId: deserializeParam(
          data['msg_id'],
          ParamType.String,
          false,
        ),
        latId: deserializeParam(
          data['lat_id'],
          ParamType.DateTime,
          false,
        ),
        latM: deserializeParam(
          data['lat_m'],
          ParamType.DateTime,
          false,
        ),
        hes: deserializeParam(
          data['hes'],
          ParamType.DateTime,
          false,
        ),
        bs: deserializeParam(
          data['bs'],
          ParamType.int,
          false,
        ),
        len: deserializeParam(
          data['len'],
          ParamType.int,
          false,
        ),
        spd: deserializeParam(
          data['spd'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MsgMetricsRtdbStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MsgMetricsRtdbStruct &&
        msgId == other.msgId &&
        latId == other.latId &&
        latM == other.latM &&
        hes == other.hes &&
        bs == other.bs &&
        len == other.len &&
        spd == other.spd;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([msgId, latId, latM, hes, bs, len, spd]);
}

MsgMetricsRtdbStruct createMsgMetricsRtdbStruct({
  String? msgId,
  DateTime? latId,
  DateTime? latM,
  DateTime? hes,
  int? bs,
  int? len,
  int? spd,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MsgMetricsRtdbStruct(
      msgId: msgId,
      latId: latId,
      latM: latM,
      hes: hes,
      bs: bs,
      len: len,
      spd: spd,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MsgMetricsRtdbStruct? updateMsgMetricsRtdbStruct(
  MsgMetricsRtdbStruct? msgMetricsRtdb, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    msgMetricsRtdb
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMsgMetricsRtdbStructData(
  Map<String, dynamic> firestoreData,
  MsgMetricsRtdbStruct? msgMetricsRtdb,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (msgMetricsRtdb == null) {
    return;
  }
  if (msgMetricsRtdb.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && msgMetricsRtdb.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final msgMetricsRtdbData =
      getMsgMetricsRtdbFirestoreData(msgMetricsRtdb, forFieldValue);
  final nestedData =
      msgMetricsRtdbData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = msgMetricsRtdb.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMsgMetricsRtdbFirestoreData(
  MsgMetricsRtdbStruct? msgMetricsRtdb, [
  bool forFieldValue = false,
]) {
  if (msgMetricsRtdb == null) {
    return {};
  }
  final firestoreData = mapToFirestore(msgMetricsRtdb.toMap());

  // Add any Firestore field values
  mapToFirestore(msgMetricsRtdb.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMsgMetricsRtdbListFirestoreData(
  List<MsgMetricsRtdbStruct>? msgMetricsRtdbs,
) =>
    msgMetricsRtdbs
        ?.map((e) => getMsgMetricsRtdbFirestoreData(e, true))
        .toList() ??
    [];
