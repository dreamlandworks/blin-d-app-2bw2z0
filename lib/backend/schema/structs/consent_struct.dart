// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConsentStruct extends FFFirebaseStruct {
  ConsentStruct({
    TermsStruct? terms,
    AiVibeStruct? aiVibe,
    String? ipAddress,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _terms = terms,
        _aiVibe = aiVibe,
        _ipAddress = ipAddress,
        super(firestoreUtilData);

  // "terms" field.
  TermsStruct? _terms;
  TermsStruct get terms => _terms ?? TermsStruct();
  set terms(TermsStruct? val) => _terms = val;

  void updateTerms(Function(TermsStruct) updateFn) {
    updateFn(_terms ??= TermsStruct());
  }

  bool hasTerms() => _terms != null;

  // "ai_vibe" field.
  AiVibeStruct? _aiVibe;
  AiVibeStruct get aiVibe => _aiVibe ?? AiVibeStruct();
  set aiVibe(AiVibeStruct? val) => _aiVibe = val;

  void updateAiVibe(Function(AiVibeStruct) updateFn) {
    updateFn(_aiVibe ??= AiVibeStruct());
  }

  bool hasAiVibe() => _aiVibe != null;

  // "ip_address" field.
  String? _ipAddress;
  String get ipAddress => _ipAddress ?? '';
  set ipAddress(String? val) => _ipAddress = val;

  bool hasIpAddress() => _ipAddress != null;

  static ConsentStruct fromMap(Map<String, dynamic> data) => ConsentStruct(
        terms: data['terms'] is TermsStruct
            ? data['terms']
            : TermsStruct.maybeFromMap(data['terms']),
        aiVibe: data['ai_vibe'] is AiVibeStruct
            ? data['ai_vibe']
            : AiVibeStruct.maybeFromMap(data['ai_vibe']),
        ipAddress: data['ip_address'] as String?,
      );

  static ConsentStruct? maybeFromMap(dynamic data) =>
      data is Map ? ConsentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'terms': _terms?.toMap(),
        'ai_vibe': _aiVibe?.toMap(),
        'ip_address': _ipAddress,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'terms': serializeParam(
          _terms,
          ParamType.DataStruct,
        ),
        'ai_vibe': serializeParam(
          _aiVibe,
          ParamType.DataStruct,
        ),
        'ip_address': serializeParam(
          _ipAddress,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConsentStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConsentStruct(
        terms: deserializeStructParam(
          data['terms'],
          ParamType.DataStruct,
          false,
          structBuilder: TermsStruct.fromSerializableMap,
        ),
        aiVibe: deserializeStructParam(
          data['ai_vibe'],
          ParamType.DataStruct,
          false,
          structBuilder: AiVibeStruct.fromSerializableMap,
        ),
        ipAddress: deserializeParam(
          data['ip_address'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConsentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConsentStruct &&
        terms == other.terms &&
        aiVibe == other.aiVibe &&
        ipAddress == other.ipAddress;
  }

  @override
  int get hashCode => const ListEquality().hash([terms, aiVibe, ipAddress]);
}

ConsentStruct createConsentStruct({
  TermsStruct? terms,
  AiVibeStruct? aiVibe,
  String? ipAddress,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConsentStruct(
      terms: terms ?? (clearUnsetFields ? TermsStruct() : null),
      aiVibe: aiVibe ?? (clearUnsetFields ? AiVibeStruct() : null),
      ipAddress: ipAddress,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConsentStruct? updateConsentStruct(
  ConsentStruct? consent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    consent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConsentStructData(
  Map<String, dynamic> firestoreData,
  ConsentStruct? consent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (consent == null) {
    return;
  }
  if (consent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && consent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final consentData = getConsentFirestoreData(consent, forFieldValue);
  final nestedData = consentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = consent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConsentFirestoreData(
  ConsentStruct? consent, [
  bool forFieldValue = false,
]) {
  if (consent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(consent.toMap());

  // Handle nested data for "terms" field.
  addTermsStructData(
    firestoreData,
    consent.hasTerms() ? consent.terms : null,
    'terms',
    forFieldValue,
  );

  // Handle nested data for "ai_vibe" field.
  addAiVibeStructData(
    firestoreData,
    consent.hasAiVibe() ? consent.aiVibe : null,
    'ai_vibe',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(consent.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConsentListFirestoreData(
  List<ConsentStruct>? consents,
) =>
    consents?.map((e) => getConsentFirestoreData(e, true)).toList() ?? [];
