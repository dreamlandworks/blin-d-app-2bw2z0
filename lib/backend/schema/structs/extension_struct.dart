// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ExtensionStruct extends FFFirebaseStruct {
  ExtensionStruct({
    bool? isExtended,
    int? minExtended,
    int? coinsSpent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isExtended = isExtended,
        _minExtended = minExtended,
        _coinsSpent = coinsSpent,
        super(firestoreUtilData);

  // "is_extended" field.
  bool? _isExtended;
  bool get isExtended => _isExtended ?? false;
  set isExtended(bool? val) => _isExtended = val;

  bool hasIsExtended() => _isExtended != null;

  // "min_extended" field.
  int? _minExtended;
  int get minExtended => _minExtended ?? 0;
  set minExtended(int? val) => _minExtended = val;

  void incrementMinExtended(int amount) => minExtended = minExtended + amount;

  bool hasMinExtended() => _minExtended != null;

  // "coins_spent" field.
  int? _coinsSpent;
  int get coinsSpent => _coinsSpent ?? 0;
  set coinsSpent(int? val) => _coinsSpent = val;

  void incrementCoinsSpent(int amount) => coinsSpent = coinsSpent + amount;

  bool hasCoinsSpent() => _coinsSpent != null;

  static ExtensionStruct fromMap(Map<String, dynamic> data) => ExtensionStruct(
        isExtended: data['is_extended'] as bool?,
        minExtended: castToType<int>(data['min_extended']),
        coinsSpent: castToType<int>(data['coins_spent']),
      );

  static ExtensionStruct? maybeFromMap(dynamic data) => data is Map
      ? ExtensionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'is_extended': _isExtended,
        'min_extended': _minExtended,
        'coins_spent': _coinsSpent,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'is_extended': serializeParam(
          _isExtended,
          ParamType.bool,
        ),
        'min_extended': serializeParam(
          _minExtended,
          ParamType.int,
        ),
        'coins_spent': serializeParam(
          _coinsSpent,
          ParamType.int,
        ),
      }.withoutNulls;

  static ExtensionStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExtensionStruct(
        isExtended: deserializeParam(
          data['is_extended'],
          ParamType.bool,
          false,
        ),
        minExtended: deserializeParam(
          data['min_extended'],
          ParamType.int,
          false,
        ),
        coinsSpent: deserializeParam(
          data['coins_spent'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ExtensionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExtensionStruct &&
        isExtended == other.isExtended &&
        minExtended == other.minExtended &&
        coinsSpent == other.coinsSpent;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([isExtended, minExtended, coinsSpent]);
}

ExtensionStruct createExtensionStruct({
  bool? isExtended,
  int? minExtended,
  int? coinsSpent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExtensionStruct(
      isExtended: isExtended,
      minExtended: minExtended,
      coinsSpent: coinsSpent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExtensionStruct? updateExtensionStruct(
  ExtensionStruct? extension, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    extension
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExtensionStructData(
  Map<String, dynamic> firestoreData,
  ExtensionStruct? extension,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (extension == null) {
    return;
  }
  if (extension.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && extension.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final extensionData = getExtensionFirestoreData(extension, forFieldValue);
  final nestedData = extensionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = extension.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExtensionFirestoreData(
  ExtensionStruct? extension, [
  bool forFieldValue = false,
]) {
  if (extension == null) {
    return {};
  }
  final firestoreData = mapToFirestore(extension.toMap());

  // Add any Firestore field values
  mapToFirestore(extension.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExtensionListFirestoreData(
  List<ExtensionStruct>? extensions,
) =>
    extensions?.map((e) => getExtensionFirestoreData(e, true)).toList() ?? [];
