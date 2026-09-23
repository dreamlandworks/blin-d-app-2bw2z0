// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EnergyBlockStruct extends FFFirebaseStruct {
  EnergyBlockStruct({
    String? trait1Name,
    double? trait1Pct,
    String? trait2Name,
    double? trait2Pct,
    String? statement,
    double? progressValue,
    String? progressText,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _trait1Name = trait1Name,
        _trait1Pct = trait1Pct,
        _trait2Name = trait2Name,
        _trait2Pct = trait2Pct,
        _statement = statement,
        _progressValue = progressValue,
        _progressText = progressText,
        super(firestoreUtilData);

  // "trait1_name" field.
  String? _trait1Name;
  String get trait1Name => _trait1Name ?? '';
  set trait1Name(String? val) => _trait1Name = val;

  bool hasTrait1Name() => _trait1Name != null;

  // "trait1_pct" field.
  double? _trait1Pct;
  double get trait1Pct => _trait1Pct ?? 0.0;
  set trait1Pct(double? val) => _trait1Pct = val;

  void incrementTrait1Pct(double amount) => trait1Pct = trait1Pct + amount;

  bool hasTrait1Pct() => _trait1Pct != null;

  // "trait2_name" field.
  String? _trait2Name;
  String get trait2Name => _trait2Name ?? '';
  set trait2Name(String? val) => _trait2Name = val;

  bool hasTrait2Name() => _trait2Name != null;

  // "trait2_pct" field.
  double? _trait2Pct;
  double get trait2Pct => _trait2Pct ?? 0.0;
  set trait2Pct(double? val) => _trait2Pct = val;

  void incrementTrait2Pct(double amount) => trait2Pct = trait2Pct + amount;

  bool hasTrait2Pct() => _trait2Pct != null;

  // "statement" field.
  String? _statement;
  String get statement => _statement ?? '';
  set statement(String? val) => _statement = val;

  bool hasStatement() => _statement != null;

  // "progress_value" field.
  double? _progressValue;
  double get progressValue => _progressValue ?? 0.0;
  set progressValue(double? val) => _progressValue = val;

  void incrementProgressValue(double amount) =>
      progressValue = progressValue + amount;

  bool hasProgressValue() => _progressValue != null;

  // "progress_text" field.
  String? _progressText;
  String get progressText => _progressText ?? '';
  set progressText(String? val) => _progressText = val;

  bool hasProgressText() => _progressText != null;

  static EnergyBlockStruct fromMap(Map<String, dynamic> data) =>
      EnergyBlockStruct(
        trait1Name: data['trait1_name'] as String?,
        trait1Pct: castToType<double>(data['trait1_pct']),
        trait2Name: data['trait2_name'] as String?,
        trait2Pct: castToType<double>(data['trait2_pct']),
        statement: data['statement'] as String?,
        progressValue: castToType<double>(data['progress_value']),
        progressText: data['progress_text'] as String?,
      );

  static EnergyBlockStruct? maybeFromMap(dynamic data) => data is Map
      ? EnergyBlockStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'trait1_name': _trait1Name,
        'trait1_pct': _trait1Pct,
        'trait2_name': _trait2Name,
        'trait2_pct': _trait2Pct,
        'statement': _statement,
        'progress_value': _progressValue,
        'progress_text': _progressText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'trait1_name': serializeParam(
          _trait1Name,
          ParamType.String,
        ),
        'trait1_pct': serializeParam(
          _trait1Pct,
          ParamType.double,
        ),
        'trait2_name': serializeParam(
          _trait2Name,
          ParamType.String,
        ),
        'trait2_pct': serializeParam(
          _trait2Pct,
          ParamType.double,
        ),
        'statement': serializeParam(
          _statement,
          ParamType.String,
        ),
        'progress_value': serializeParam(
          _progressValue,
          ParamType.double,
        ),
        'progress_text': serializeParam(
          _progressText,
          ParamType.String,
        ),
      }.withoutNulls;

  static EnergyBlockStruct fromSerializableMap(Map<String, dynamic> data) =>
      EnergyBlockStruct(
        trait1Name: deserializeParam(
          data['trait1_name'],
          ParamType.String,
          false,
        ),
        trait1Pct: deserializeParam(
          data['trait1_pct'],
          ParamType.double,
          false,
        ),
        trait2Name: deserializeParam(
          data['trait2_name'],
          ParamType.String,
          false,
        ),
        trait2Pct: deserializeParam(
          data['trait2_pct'],
          ParamType.double,
          false,
        ),
        statement: deserializeParam(
          data['statement'],
          ParamType.String,
          false,
        ),
        progressValue: deserializeParam(
          data['progress_value'],
          ParamType.double,
          false,
        ),
        progressText: deserializeParam(
          data['progress_text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EnergyBlockStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EnergyBlockStruct &&
        trait1Name == other.trait1Name &&
        trait1Pct == other.trait1Pct &&
        trait2Name == other.trait2Name &&
        trait2Pct == other.trait2Pct &&
        statement == other.statement &&
        progressValue == other.progressValue &&
        progressText == other.progressText;
  }

  @override
  int get hashCode => const ListEquality().hash([
        trait1Name,
        trait1Pct,
        trait2Name,
        trait2Pct,
        statement,
        progressValue,
        progressText
      ]);
}

EnergyBlockStruct createEnergyBlockStruct({
  String? trait1Name,
  double? trait1Pct,
  String? trait2Name,
  double? trait2Pct,
  String? statement,
  double? progressValue,
  String? progressText,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EnergyBlockStruct(
      trait1Name: trait1Name,
      trait1Pct: trait1Pct,
      trait2Name: trait2Name,
      trait2Pct: trait2Pct,
      statement: statement,
      progressValue: progressValue,
      progressText: progressText,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EnergyBlockStruct? updateEnergyBlockStruct(
  EnergyBlockStruct? energyBlock, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    energyBlock
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEnergyBlockStructData(
  Map<String, dynamic> firestoreData,
  EnergyBlockStruct? energyBlock,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (energyBlock == null) {
    return;
  }
  if (energyBlock.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && energyBlock.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final energyBlockData =
      getEnergyBlockFirestoreData(energyBlock, forFieldValue);
  final nestedData =
      energyBlockData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = energyBlock.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEnergyBlockFirestoreData(
  EnergyBlockStruct? energyBlock, [
  bool forFieldValue = false,
]) {
  if (energyBlock == null) {
    return {};
  }
  final firestoreData = mapToFirestore(energyBlock.toMap());

  // Add any Firestore field values
  mapToFirestore(energyBlock.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEnergyBlockListFirestoreData(
  List<EnergyBlockStruct>? energyBlocks,
) =>
    energyBlocks?.map((e) => getEnergyBlockFirestoreData(e, true)).toList() ??
    [];
