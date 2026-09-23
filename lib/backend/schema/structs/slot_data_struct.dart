// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SlotDataStruct extends FFFirebaseStruct {
  SlotDataStruct({
    String? slotId,
    String? title,
    String? desc,
    String? tag,
    String? timeLabel,
    String? iconName,
    Color? primaryColor,
    Color? tagBgColor,
    int? startMs,
    int? endMs,
    bool? isTomorrow,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _slotId = slotId,
        _title = title,
        _desc = desc,
        _tag = tag,
        _timeLabel = timeLabel,
        _iconName = iconName,
        _primaryColor = primaryColor,
        _tagBgColor = tagBgColor,
        _startMs = startMs,
        _endMs = endMs,
        _isTomorrow = isTomorrow,
        super(firestoreUtilData);

  // "slot_id" field.
  String? _slotId;
  String get slotId => _slotId ?? '';
  set slotId(String? val) => _slotId = val;

  bool hasSlotId() => _slotId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  set desc(String? val) => _desc = val;

  bool hasDesc() => _desc != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  set tag(String? val) => _tag = val;

  bool hasTag() => _tag != null;

  // "time_label" field.
  String? _timeLabel;
  String get timeLabel => _timeLabel ?? '';
  set timeLabel(String? val) => _timeLabel = val;

  bool hasTimeLabel() => _timeLabel != null;

  // "icon_name" field.
  String? _iconName;
  String get iconName => _iconName ?? '';
  set iconName(String? val) => _iconName = val;

  bool hasIconName() => _iconName != null;

  // "primary_color" field.
  Color? _primaryColor;
  Color? get primaryColor => _primaryColor;
  set primaryColor(Color? val) => _primaryColor = val;

  bool hasPrimaryColor() => _primaryColor != null;

  // "tag_bg_color" field.
  Color? _tagBgColor;
  Color? get tagBgColor => _tagBgColor;
  set tagBgColor(Color? val) => _tagBgColor = val;

  bool hasTagBgColor() => _tagBgColor != null;

  // "start_ms" field.
  int? _startMs;
  int get startMs => _startMs ?? 0;
  set startMs(int? val) => _startMs = val;

  void incrementStartMs(int amount) => startMs = startMs + amount;

  bool hasStartMs() => _startMs != null;

  // "end_ms" field.
  int? _endMs;
  int get endMs => _endMs ?? 0;
  set endMs(int? val) => _endMs = val;

  void incrementEndMs(int amount) => endMs = endMs + amount;

  bool hasEndMs() => _endMs != null;

  // "is_tomorrow" field.
  bool? _isTomorrow;
  bool get isTomorrow => _isTomorrow ?? false;
  set isTomorrow(bool? val) => _isTomorrow = val;

  bool hasIsTomorrow() => _isTomorrow != null;

  static SlotDataStruct fromMap(Map<String, dynamic> data) => SlotDataStruct(
        slotId: data['slot_id'] as String?,
        title: data['title'] as String?,
        desc: data['desc'] as String?,
        tag: data['tag'] as String?,
        timeLabel: data['time_label'] as String?,
        iconName: data['icon_name'] as String?,
        primaryColor: getSchemaColor(data['primary_color']),
        tagBgColor: getSchemaColor(data['tag_bg_color']),
        startMs: castToType<int>(data['start_ms']),
        endMs: castToType<int>(data['end_ms']),
        isTomorrow: data['is_tomorrow'] as bool?,
      );

  static SlotDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? SlotDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'slot_id': _slotId,
        'title': _title,
        'desc': _desc,
        'tag': _tag,
        'time_label': _timeLabel,
        'icon_name': _iconName,
        'primary_color': _primaryColor,
        'tag_bg_color': _tagBgColor,
        'start_ms': _startMs,
        'end_ms': _endMs,
        'is_tomorrow': _isTomorrow,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'slot_id': serializeParam(
          _slotId,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'desc': serializeParam(
          _desc,
          ParamType.String,
        ),
        'tag': serializeParam(
          _tag,
          ParamType.String,
        ),
        'time_label': serializeParam(
          _timeLabel,
          ParamType.String,
        ),
        'icon_name': serializeParam(
          _iconName,
          ParamType.String,
        ),
        'primary_color': serializeParam(
          _primaryColor,
          ParamType.Color,
        ),
        'tag_bg_color': serializeParam(
          _tagBgColor,
          ParamType.Color,
        ),
        'start_ms': serializeParam(
          _startMs,
          ParamType.int,
        ),
        'end_ms': serializeParam(
          _endMs,
          ParamType.int,
        ),
        'is_tomorrow': serializeParam(
          _isTomorrow,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SlotDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      SlotDataStruct(
        slotId: deserializeParam(
          data['slot_id'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        desc: deserializeParam(
          data['desc'],
          ParamType.String,
          false,
        ),
        tag: deserializeParam(
          data['tag'],
          ParamType.String,
          false,
        ),
        timeLabel: deserializeParam(
          data['time_label'],
          ParamType.String,
          false,
        ),
        iconName: deserializeParam(
          data['icon_name'],
          ParamType.String,
          false,
        ),
        primaryColor: deserializeParam(
          data['primary_color'],
          ParamType.Color,
          false,
        ),
        tagBgColor: deserializeParam(
          data['tag_bg_color'],
          ParamType.Color,
          false,
        ),
        startMs: deserializeParam(
          data['start_ms'],
          ParamType.int,
          false,
        ),
        endMs: deserializeParam(
          data['end_ms'],
          ParamType.int,
          false,
        ),
        isTomorrow: deserializeParam(
          data['is_tomorrow'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'SlotDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SlotDataStruct &&
        slotId == other.slotId &&
        title == other.title &&
        desc == other.desc &&
        tag == other.tag &&
        timeLabel == other.timeLabel &&
        iconName == other.iconName &&
        primaryColor == other.primaryColor &&
        tagBgColor == other.tagBgColor &&
        startMs == other.startMs &&
        endMs == other.endMs &&
        isTomorrow == other.isTomorrow;
  }

  @override
  int get hashCode => const ListEquality().hash([
        slotId,
        title,
        desc,
        tag,
        timeLabel,
        iconName,
        primaryColor,
        tagBgColor,
        startMs,
        endMs,
        isTomorrow
      ]);
}

SlotDataStruct createSlotDataStruct({
  String? slotId,
  String? title,
  String? desc,
  String? tag,
  String? timeLabel,
  String? iconName,
  Color? primaryColor,
  Color? tagBgColor,
  int? startMs,
  int? endMs,
  bool? isTomorrow,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SlotDataStruct(
      slotId: slotId,
      title: title,
      desc: desc,
      tag: tag,
      timeLabel: timeLabel,
      iconName: iconName,
      primaryColor: primaryColor,
      tagBgColor: tagBgColor,
      startMs: startMs,
      endMs: endMs,
      isTomorrow: isTomorrow,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SlotDataStruct? updateSlotDataStruct(
  SlotDataStruct? slotData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    slotData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSlotDataStructData(
  Map<String, dynamic> firestoreData,
  SlotDataStruct? slotData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (slotData == null) {
    return;
  }
  if (slotData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && slotData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final slotDataData = getSlotDataFirestoreData(slotData, forFieldValue);
  final nestedData = slotDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = slotData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSlotDataFirestoreData(
  SlotDataStruct? slotData, [
  bool forFieldValue = false,
]) {
  if (slotData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(slotData.toMap());

  // Add any Firestore field values
  mapToFirestore(slotData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSlotDataListFirestoreData(
  List<SlotDataStruct>? slotDatas,
) =>
    slotDatas?.map((e) => getSlotDataFirestoreData(e, true)).toList() ?? [];
