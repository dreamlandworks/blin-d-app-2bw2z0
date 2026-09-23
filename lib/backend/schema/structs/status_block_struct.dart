// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StatusBlockStruct extends FFFirebaseStruct {
  StatusBlockStruct({
    String? title,
    String? desc,
    String? desc2,
    int? timer,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _desc = desc,
        _desc2 = desc2,
        _timer = timer,
        super(firestoreUtilData);

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

  // "desc2" field.
  String? _desc2;
  String get desc2 => _desc2 ?? '';
  set desc2(String? val) => _desc2 = val;

  bool hasDesc2() => _desc2 != null;

  // "timer" field.
  int? _timer;
  int get timer => _timer ?? 0;
  set timer(int? val) => _timer = val;

  void incrementTimer(int amount) => timer = timer + amount;

  bool hasTimer() => _timer != null;

  static StatusBlockStruct fromMap(Map<String, dynamic> data) =>
      StatusBlockStruct(
        title: data['title'] as String?,
        desc: data['desc'] as String?,
        desc2: data['desc2'] as String?,
        timer: castToType<int>(data['timer']),
      );

  static StatusBlockStruct? maybeFromMap(dynamic data) => data is Map
      ? StatusBlockStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'desc': _desc,
        'desc2': _desc2,
        'timer': _timer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'desc': serializeParam(
          _desc,
          ParamType.String,
        ),
        'desc2': serializeParam(
          _desc2,
          ParamType.String,
        ),
        'timer': serializeParam(
          _timer,
          ParamType.int,
        ),
      }.withoutNulls;

  static StatusBlockStruct fromSerializableMap(Map<String, dynamic> data) =>
      StatusBlockStruct(
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
        desc2: deserializeParam(
          data['desc2'],
          ParamType.String,
          false,
        ),
        timer: deserializeParam(
          data['timer'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'StatusBlockStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatusBlockStruct &&
        title == other.title &&
        desc == other.desc &&
        desc2 == other.desc2 &&
        timer == other.timer;
  }

  @override
  int get hashCode => const ListEquality().hash([title, desc, desc2, timer]);
}

StatusBlockStruct createStatusBlockStruct({
  String? title,
  String? desc,
  String? desc2,
  int? timer,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatusBlockStruct(
      title: title,
      desc: desc,
      desc2: desc2,
      timer: timer,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StatusBlockStruct? updateStatusBlockStruct(
  StatusBlockStruct? statusBlock, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    statusBlock
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStatusBlockStructData(
  Map<String, dynamic> firestoreData,
  StatusBlockStruct? statusBlock,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (statusBlock == null) {
    return;
  }
  if (statusBlock.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && statusBlock.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statusBlockData =
      getStatusBlockFirestoreData(statusBlock, forFieldValue);
  final nestedData =
      statusBlockData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = statusBlock.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStatusBlockFirestoreData(
  StatusBlockStruct? statusBlock, [
  bool forFieldValue = false,
]) {
  if (statusBlock == null) {
    return {};
  }
  final firestoreData = mapToFirestore(statusBlock.toMap());

  // Add any Firestore field values
  mapToFirestore(statusBlock.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatusBlockListFirestoreData(
  List<StatusBlockStruct>? statusBlocks,
) =>
    statusBlocks?.map((e) => getStatusBlockFirestoreData(e, true)).toList() ??
    [];
