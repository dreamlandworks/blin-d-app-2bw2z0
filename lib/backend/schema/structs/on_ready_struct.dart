// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnReadyStruct extends FFFirebaseStruct {
  OnReadyStruct({
    String? readyStatus,
    int? readyTime,
    int? cooldownUntil,
    bool? isPremium,
    List<String>? slotId,
    List<String>? slotTitle,
    List<String>? slotDesc,
    List<int>? slotStartTimer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _readyStatus = readyStatus,
        _readyTime = readyTime,
        _cooldownUntil = cooldownUntil,
        _isPremium = isPremium,
        _slotId = slotId,
        _slotTitle = slotTitle,
        _slotDesc = slotDesc,
        _slotStartTimer = slotStartTimer,
        super(firestoreUtilData);

  // "ready_status" field.
  String? _readyStatus;
  String get readyStatus => _readyStatus ?? '';
  set readyStatus(String? val) => _readyStatus = val;

  bool hasReadyStatus() => _readyStatus != null;

  // "ready_time" field.
  int? _readyTime;
  int get readyTime => _readyTime ?? 0;
  set readyTime(int? val) => _readyTime = val;

  void incrementReadyTime(int amount) => readyTime = readyTime + amount;

  bool hasReadyTime() => _readyTime != null;

  // "cooldown_until" field.
  int? _cooldownUntil;
  int get cooldownUntil => _cooldownUntil ?? 0;
  set cooldownUntil(int? val) => _cooldownUntil = val;

  void incrementCooldownUntil(int amount) =>
      cooldownUntil = cooldownUntil + amount;

  bool hasCooldownUntil() => _cooldownUntil != null;

  // "is_premium" field.
  bool? _isPremium;
  bool get isPremium => _isPremium ?? false;
  set isPremium(bool? val) => _isPremium = val;

  bool hasIsPremium() => _isPremium != null;

  // "slot_id" field.
  List<String>? _slotId;
  List<String> get slotId => _slotId ?? const [];
  set slotId(List<String>? val) => _slotId = val;

  void updateSlotId(Function(List<String>) updateFn) {
    updateFn(_slotId ??= []);
  }

  bool hasSlotId() => _slotId != null;

  // "slot_title" field.
  List<String>? _slotTitle;
  List<String> get slotTitle => _slotTitle ?? const [];
  set slotTitle(List<String>? val) => _slotTitle = val;

  void updateSlotTitle(Function(List<String>) updateFn) {
    updateFn(_slotTitle ??= []);
  }

  bool hasSlotTitle() => _slotTitle != null;

  // "slot_desc" field.
  List<String>? _slotDesc;
  List<String> get slotDesc => _slotDesc ?? const [];
  set slotDesc(List<String>? val) => _slotDesc = val;

  void updateSlotDesc(Function(List<String>) updateFn) {
    updateFn(_slotDesc ??= []);
  }

  bool hasSlotDesc() => _slotDesc != null;

  // "slot_start_timer" field.
  List<int>? _slotStartTimer;
  List<int> get slotStartTimer => _slotStartTimer ?? const [];
  set slotStartTimer(List<int>? val) => _slotStartTimer = val;

  void updateSlotStartTimer(Function(List<int>) updateFn) {
    updateFn(_slotStartTimer ??= []);
  }

  bool hasSlotStartTimer() => _slotStartTimer != null;

  static OnReadyStruct fromMap(Map<String, dynamic> data) => OnReadyStruct(
        readyStatus: data['ready_status'] as String?,
        readyTime: castToType<int>(data['ready_time']),
        cooldownUntil: castToType<int>(data['cooldown_until']),
        isPremium: data['is_premium'] as bool?,
        slotId: getDataList(data['slot_id']),
        slotTitle: getDataList(data['slot_title']),
        slotDesc: getDataList(data['slot_desc']),
        slotStartTimer: getDataList(data['slot_start_timer']),
      );

  static OnReadyStruct? maybeFromMap(dynamic data) =>
      data is Map ? OnReadyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ready_status': _readyStatus,
        'ready_time': _readyTime,
        'cooldown_until': _cooldownUntil,
        'is_premium': _isPremium,
        'slot_id': _slotId,
        'slot_title': _slotTitle,
        'slot_desc': _slotDesc,
        'slot_start_timer': _slotStartTimer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ready_status': serializeParam(
          _readyStatus,
          ParamType.String,
        ),
        'ready_time': serializeParam(
          _readyTime,
          ParamType.int,
        ),
        'cooldown_until': serializeParam(
          _cooldownUntil,
          ParamType.int,
        ),
        'is_premium': serializeParam(
          _isPremium,
          ParamType.bool,
        ),
        'slot_id': serializeParam(
          _slotId,
          ParamType.String,
          isList: true,
        ),
        'slot_title': serializeParam(
          _slotTitle,
          ParamType.String,
          isList: true,
        ),
        'slot_desc': serializeParam(
          _slotDesc,
          ParamType.String,
          isList: true,
        ),
        'slot_start_timer': serializeParam(
          _slotStartTimer,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static OnReadyStruct fromSerializableMap(Map<String, dynamic> data) =>
      OnReadyStruct(
        readyStatus: deserializeParam(
          data['ready_status'],
          ParamType.String,
          false,
        ),
        readyTime: deserializeParam(
          data['ready_time'],
          ParamType.int,
          false,
        ),
        cooldownUntil: deserializeParam(
          data['cooldown_until'],
          ParamType.int,
          false,
        ),
        isPremium: deserializeParam(
          data['is_premium'],
          ParamType.bool,
          false,
        ),
        slotId: deserializeParam<String>(
          data['slot_id'],
          ParamType.String,
          true,
        ),
        slotTitle: deserializeParam<String>(
          data['slot_title'],
          ParamType.String,
          true,
        ),
        slotDesc: deserializeParam<String>(
          data['slot_desc'],
          ParamType.String,
          true,
        ),
        slotStartTimer: deserializeParam<int>(
          data['slot_start_timer'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'OnReadyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OnReadyStruct &&
        readyStatus == other.readyStatus &&
        readyTime == other.readyTime &&
        cooldownUntil == other.cooldownUntil &&
        isPremium == other.isPremium &&
        listEquality.equals(slotId, other.slotId) &&
        listEquality.equals(slotTitle, other.slotTitle) &&
        listEquality.equals(slotDesc, other.slotDesc) &&
        listEquality.equals(slotStartTimer, other.slotStartTimer);
  }

  @override
  int get hashCode => const ListEquality().hash([
        readyStatus,
        readyTime,
        cooldownUntil,
        isPremium,
        slotId,
        slotTitle,
        slotDesc,
        slotStartTimer
      ]);
}

OnReadyStruct createOnReadyStruct({
  String? readyStatus,
  int? readyTime,
  int? cooldownUntil,
  bool? isPremium,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OnReadyStruct(
      readyStatus: readyStatus,
      readyTime: readyTime,
      cooldownUntil: cooldownUntil,
      isPremium: isPremium,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OnReadyStruct? updateOnReadyStruct(
  OnReadyStruct? onReady, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    onReady
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOnReadyStructData(
  Map<String, dynamic> firestoreData,
  OnReadyStruct? onReady,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (onReady == null) {
    return;
  }
  if (onReady.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && onReady.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final onReadyData = getOnReadyFirestoreData(onReady, forFieldValue);
  final nestedData = onReadyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = onReady.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOnReadyFirestoreData(
  OnReadyStruct? onReady, [
  bool forFieldValue = false,
]) {
  if (onReady == null) {
    return {};
  }
  final firestoreData = mapToFirestore(onReady.toMap());

  // Add any Firestore field values
  mapToFirestore(onReady.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOnReadyListFirestoreData(
  List<OnReadyStruct>? onReadys,
) =>
    onReadys?.map((e) => getOnReadyFirestoreData(e, true)).toList() ?? [];
