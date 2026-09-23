// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AiPersonaStruct extends FFFirebaseStruct {
  AiPersonaStruct({
    String? summaryBio,
    String? threeWordDescription,
    DateTime? updatedAt,
    String? lastTraitType,
    TraitsStruct? mainTraits,
    TraitsStruct? lastTraits,
    PersonaInterestsStruct? interests,
    BehaviouralWeightsStruct? behaviouralFingerprint,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _summaryBio = summaryBio,
        _threeWordDescription = threeWordDescription,
        _updatedAt = updatedAt,
        _lastTraitType = lastTraitType,
        _mainTraits = mainTraits,
        _lastTraits = lastTraits,
        _interests = interests,
        _behaviouralFingerprint = behaviouralFingerprint,
        super(firestoreUtilData);

  // "summary_bio" field.
  String? _summaryBio;
  String get summaryBio => _summaryBio ?? '';
  set summaryBio(String? val) => _summaryBio = val;

  bool hasSummaryBio() => _summaryBio != null;

  // "three_word_description" field.
  String? _threeWordDescription;
  String get threeWordDescription => _threeWordDescription ?? '';
  set threeWordDescription(String? val) => _threeWordDescription = val;

  bool hasThreeWordDescription() => _threeWordDescription != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "last_trait_type" field.
  String? _lastTraitType;
  String get lastTraitType => _lastTraitType ?? '';
  set lastTraitType(String? val) => _lastTraitType = val;

  bool hasLastTraitType() => _lastTraitType != null;

  // "main_traits" field.
  TraitsStruct? _mainTraits;
  TraitsStruct get mainTraits => _mainTraits ?? TraitsStruct();
  set mainTraits(TraitsStruct? val) => _mainTraits = val;

  void updateMainTraits(Function(TraitsStruct) updateFn) {
    updateFn(_mainTraits ??= TraitsStruct());
  }

  bool hasMainTraits() => _mainTraits != null;

  // "last_traits" field.
  TraitsStruct? _lastTraits;
  TraitsStruct get lastTraits => _lastTraits ?? TraitsStruct();
  set lastTraits(TraitsStruct? val) => _lastTraits = val;

  void updateLastTraits(Function(TraitsStruct) updateFn) {
    updateFn(_lastTraits ??= TraitsStruct());
  }

  bool hasLastTraits() => _lastTraits != null;

  // "interests" field.
  PersonaInterestsStruct? _interests;
  PersonaInterestsStruct get interests =>
      _interests ?? PersonaInterestsStruct();
  set interests(PersonaInterestsStruct? val) => _interests = val;

  void updateInterests(Function(PersonaInterestsStruct) updateFn) {
    updateFn(_interests ??= PersonaInterestsStruct());
  }

  bool hasInterests() => _interests != null;

  // "behavioural_fingerprint" field.
  BehaviouralWeightsStruct? _behaviouralFingerprint;
  BehaviouralWeightsStruct get behaviouralFingerprint =>
      _behaviouralFingerprint ?? BehaviouralWeightsStruct();
  set behaviouralFingerprint(BehaviouralWeightsStruct? val) =>
      _behaviouralFingerprint = val;

  void updateBehaviouralFingerprint(
      Function(BehaviouralWeightsStruct) updateFn) {
    updateFn(_behaviouralFingerprint ??= BehaviouralWeightsStruct());
  }

  bool hasBehaviouralFingerprint() => _behaviouralFingerprint != null;

  static AiPersonaStruct fromMap(Map<String, dynamic> data) => AiPersonaStruct(
        summaryBio: data['summary_bio'] as String?,
        threeWordDescription: data['three_word_description'] as String?,
        updatedAt: data['updated_at'] as DateTime?,
        lastTraitType: data['last_trait_type'] as String?,
        mainTraits: data['main_traits'] is TraitsStruct
            ? data['main_traits']
            : TraitsStruct.maybeFromMap(data['main_traits']),
        lastTraits: data['last_traits'] is TraitsStruct
            ? data['last_traits']
            : TraitsStruct.maybeFromMap(data['last_traits']),
        interests: data['interests'] is PersonaInterestsStruct
            ? data['interests']
            : PersonaInterestsStruct.maybeFromMap(data['interests']),
        behaviouralFingerprint:
            data['behavioural_fingerprint'] is BehaviouralWeightsStruct
                ? data['behavioural_fingerprint']
                : BehaviouralWeightsStruct.maybeFromMap(
                    data['behavioural_fingerprint']),
      );

  static AiPersonaStruct? maybeFromMap(dynamic data) => data is Map
      ? AiPersonaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'summary_bio': _summaryBio,
        'three_word_description': _threeWordDescription,
        'updated_at': _updatedAt,
        'last_trait_type': _lastTraitType,
        'main_traits': _mainTraits?.toMap(),
        'last_traits': _lastTraits?.toMap(),
        'interests': _interests?.toMap(),
        'behavioural_fingerprint': _behaviouralFingerprint?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'summary_bio': serializeParam(
          _summaryBio,
          ParamType.String,
        ),
        'three_word_description': serializeParam(
          _threeWordDescription,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'last_trait_type': serializeParam(
          _lastTraitType,
          ParamType.String,
        ),
        'main_traits': serializeParam(
          _mainTraits,
          ParamType.DataStruct,
        ),
        'last_traits': serializeParam(
          _lastTraits,
          ParamType.DataStruct,
        ),
        'interests': serializeParam(
          _interests,
          ParamType.DataStruct,
        ),
        'behavioural_fingerprint': serializeParam(
          _behaviouralFingerprint,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AiPersonaStruct fromSerializableMap(Map<String, dynamic> data) =>
      AiPersonaStruct(
        summaryBio: deserializeParam(
          data['summary_bio'],
          ParamType.String,
          false,
        ),
        threeWordDescription: deserializeParam(
          data['three_word_description'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        lastTraitType: deserializeParam(
          data['last_trait_type'],
          ParamType.String,
          false,
        ),
        mainTraits: deserializeStructParam(
          data['main_traits'],
          ParamType.DataStruct,
          false,
          structBuilder: TraitsStruct.fromSerializableMap,
        ),
        lastTraits: deserializeStructParam(
          data['last_traits'],
          ParamType.DataStruct,
          false,
          structBuilder: TraitsStruct.fromSerializableMap,
        ),
        interests: deserializeStructParam(
          data['interests'],
          ParamType.DataStruct,
          false,
          structBuilder: PersonaInterestsStruct.fromSerializableMap,
        ),
        behaviouralFingerprint: deserializeStructParam(
          data['behavioural_fingerprint'],
          ParamType.DataStruct,
          false,
          structBuilder: BehaviouralWeightsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AiPersonaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AiPersonaStruct &&
        summaryBio == other.summaryBio &&
        threeWordDescription == other.threeWordDescription &&
        updatedAt == other.updatedAt &&
        lastTraitType == other.lastTraitType &&
        mainTraits == other.mainTraits &&
        lastTraits == other.lastTraits &&
        interests == other.interests &&
        behaviouralFingerprint == other.behaviouralFingerprint;
  }

  @override
  int get hashCode => const ListEquality().hash([
        summaryBio,
        threeWordDescription,
        updatedAt,
        lastTraitType,
        mainTraits,
        lastTraits,
        interests,
        behaviouralFingerprint
      ]);
}

AiPersonaStruct createAiPersonaStruct({
  String? summaryBio,
  String? threeWordDescription,
  DateTime? updatedAt,
  String? lastTraitType,
  TraitsStruct? mainTraits,
  TraitsStruct? lastTraits,
  PersonaInterestsStruct? interests,
  BehaviouralWeightsStruct? behaviouralFingerprint,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AiPersonaStruct(
      summaryBio: summaryBio,
      threeWordDescription: threeWordDescription,
      updatedAt: updatedAt,
      lastTraitType: lastTraitType,
      mainTraits: mainTraits ?? (clearUnsetFields ? TraitsStruct() : null),
      lastTraits: lastTraits ?? (clearUnsetFields ? TraitsStruct() : null),
      interests:
          interests ?? (clearUnsetFields ? PersonaInterestsStruct() : null),
      behaviouralFingerprint: behaviouralFingerprint ??
          (clearUnsetFields ? BehaviouralWeightsStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AiPersonaStruct? updateAiPersonaStruct(
  AiPersonaStruct? aiPersona, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    aiPersona
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAiPersonaStructData(
  Map<String, dynamic> firestoreData,
  AiPersonaStruct? aiPersona,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (aiPersona == null) {
    return;
  }
  if (aiPersona.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && aiPersona.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final aiPersonaData = getAiPersonaFirestoreData(aiPersona, forFieldValue);
  final nestedData = aiPersonaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = aiPersona.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAiPersonaFirestoreData(
  AiPersonaStruct? aiPersona, [
  bool forFieldValue = false,
]) {
  if (aiPersona == null) {
    return {};
  }
  final firestoreData = mapToFirestore(aiPersona.toMap());

  // Handle nested data for "main_traits" field.
  addTraitsStructData(
    firestoreData,
    aiPersona.hasMainTraits() ? aiPersona.mainTraits : null,
    'main_traits',
    forFieldValue,
  );

  // Handle nested data for "last_traits" field.
  addTraitsStructData(
    firestoreData,
    aiPersona.hasLastTraits() ? aiPersona.lastTraits : null,
    'last_traits',
    forFieldValue,
  );

  // Handle nested data for "interests" field.
  addPersonaInterestsStructData(
    firestoreData,
    aiPersona.hasInterests() ? aiPersona.interests : null,
    'interests',
    forFieldValue,
  );

  // Handle nested data for "behavioural_fingerprint" field.
  addBehaviouralWeightsStructData(
    firestoreData,
    aiPersona.hasBehaviouralFingerprint()
        ? aiPersona.behaviouralFingerprint
        : null,
    'behavioural_fingerprint',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(aiPersona.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAiPersonaListFirestoreData(
  List<AiPersonaStruct>? aiPersonas,
) =>
    aiPersonas?.map((e) => getAiPersonaFirestoreData(e, true)).toList() ?? [];
