// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class VaultRefStruct extends FFFirebaseStruct {
  VaultRefStruct({
    String? legalVault,
    String? scrubVault,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _legalVault = legalVault,
        _scrubVault = scrubVault,
        super(firestoreUtilData);

  // "legal_vault" field.
  String? _legalVault;
  String get legalVault => _legalVault ?? '';
  set legalVault(String? val) => _legalVault = val;

  bool hasLegalVault() => _legalVault != null;

  // "scrub_vault" field.
  String? _scrubVault;
  String get scrubVault => _scrubVault ?? '';
  set scrubVault(String? val) => _scrubVault = val;

  bool hasScrubVault() => _scrubVault != null;

  static VaultRefStruct fromMap(Map<String, dynamic> data) => VaultRefStruct(
        legalVault: data['legal_vault'] as String?,
        scrubVault: data['scrub_vault'] as String?,
      );

  static VaultRefStruct? maybeFromMap(dynamic data) =>
      data is Map ? VaultRefStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'legal_vault': _legalVault,
        'scrub_vault': _scrubVault,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'legal_vault': serializeParam(
          _legalVault,
          ParamType.String,
        ),
        'scrub_vault': serializeParam(
          _scrubVault,
          ParamType.String,
        ),
      }.withoutNulls;

  static VaultRefStruct fromSerializableMap(Map<String, dynamic> data) =>
      VaultRefStruct(
        legalVault: deserializeParam(
          data['legal_vault'],
          ParamType.String,
          false,
        ),
        scrubVault: deserializeParam(
          data['scrub_vault'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VaultRefStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VaultRefStruct &&
        legalVault == other.legalVault &&
        scrubVault == other.scrubVault;
  }

  @override
  int get hashCode => const ListEquality().hash([legalVault, scrubVault]);
}

VaultRefStruct createVaultRefStruct({
  String? legalVault,
  String? scrubVault,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VaultRefStruct(
      legalVault: legalVault,
      scrubVault: scrubVault,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VaultRefStruct? updateVaultRefStruct(
  VaultRefStruct? vaultRef, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    vaultRef
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVaultRefStructData(
  Map<String, dynamic> firestoreData,
  VaultRefStruct? vaultRef,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (vaultRef == null) {
    return;
  }
  if (vaultRef.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && vaultRef.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final vaultRefData = getVaultRefFirestoreData(vaultRef, forFieldValue);
  final nestedData = vaultRefData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = vaultRef.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVaultRefFirestoreData(
  VaultRefStruct? vaultRef, [
  bool forFieldValue = false,
]) {
  if (vaultRef == null) {
    return {};
  }
  final firestoreData = mapToFirestore(vaultRef.toMap());

  // Add any Firestore field values
  mapToFirestore(vaultRef.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVaultRefListFirestoreData(
  List<VaultRefStruct>? vaultRefs,
) =>
    vaultRefs?.map((e) => getVaultRefFirestoreData(e, true)).toList() ?? [];
