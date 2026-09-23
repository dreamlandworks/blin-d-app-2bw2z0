// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonaInterestsStruct extends FFFirebaseStruct {
  PersonaInterestsStruct({
    String? culturalNuance,
    List<String>? shoppingIntent,
    List<TopInterestsStruct>? topInterests,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _culturalNuance = culturalNuance,
        _shoppingIntent = shoppingIntent,
        _topInterests = topInterests,
        super(firestoreUtilData);

  // "cultural_nuance" field.
  String? _culturalNuance;
  String get culturalNuance => _culturalNuance ?? '';
  set culturalNuance(String? val) => _culturalNuance = val;

  bool hasCulturalNuance() => _culturalNuance != null;

  // "shopping_intent" field.
  List<String>? _shoppingIntent;
  List<String> get shoppingIntent => _shoppingIntent ?? const [];
  set shoppingIntent(List<String>? val) => _shoppingIntent = val;

  void updateShoppingIntent(Function(List<String>) updateFn) {
    updateFn(_shoppingIntent ??= []);
  }

  bool hasShoppingIntent() => _shoppingIntent != null;

  // "top_interests" field.
  List<TopInterestsStruct>? _topInterests;
  List<TopInterestsStruct> get topInterests => _topInterests ?? const [];
  set topInterests(List<TopInterestsStruct>? val) => _topInterests = val;

  void updateTopInterests(Function(List<TopInterestsStruct>) updateFn) {
    updateFn(_topInterests ??= []);
  }

  bool hasTopInterests() => _topInterests != null;

  static PersonaInterestsStruct fromMap(Map<String, dynamic> data) =>
      PersonaInterestsStruct(
        culturalNuance: data['cultural_nuance'] as String?,
        shoppingIntent: getDataList(data['shopping_intent']),
        topInterests: getStructList(
          data['top_interests'],
          TopInterestsStruct.fromMap,
        ),
      );

  static PersonaInterestsStruct? maybeFromMap(dynamic data) => data is Map
      ? PersonaInterestsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cultural_nuance': _culturalNuance,
        'shopping_intent': _shoppingIntent,
        'top_interests': _topInterests?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cultural_nuance': serializeParam(
          _culturalNuance,
          ParamType.String,
        ),
        'shopping_intent': serializeParam(
          _shoppingIntent,
          ParamType.String,
          isList: true,
        ),
        'top_interests': serializeParam(
          _topInterests,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PersonaInterestsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PersonaInterestsStruct(
        culturalNuance: deserializeParam(
          data['cultural_nuance'],
          ParamType.String,
          false,
        ),
        shoppingIntent: deserializeParam<String>(
          data['shopping_intent'],
          ParamType.String,
          true,
        ),
        topInterests: deserializeStructParam<TopInterestsStruct>(
          data['top_interests'],
          ParamType.DataStruct,
          true,
          structBuilder: TopInterestsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PersonaInterestsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PersonaInterestsStruct &&
        culturalNuance == other.culturalNuance &&
        listEquality.equals(shoppingIntent, other.shoppingIntent) &&
        listEquality.equals(topInterests, other.topInterests);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([culturalNuance, shoppingIntent, topInterests]);
}

PersonaInterestsStruct createPersonaInterestsStruct({
  String? culturalNuance,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PersonaInterestsStruct(
      culturalNuance: culturalNuance,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PersonaInterestsStruct? updatePersonaInterestsStruct(
  PersonaInterestsStruct? personaInterests, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    personaInterests
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPersonaInterestsStructData(
  Map<String, dynamic> firestoreData,
  PersonaInterestsStruct? personaInterests,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (personaInterests == null) {
    return;
  }
  if (personaInterests.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && personaInterests.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final personaInterestsData =
      getPersonaInterestsFirestoreData(personaInterests, forFieldValue);
  final nestedData =
      personaInterestsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = personaInterests.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPersonaInterestsFirestoreData(
  PersonaInterestsStruct? personaInterests, [
  bool forFieldValue = false,
]) {
  if (personaInterests == null) {
    return {};
  }
  final firestoreData = mapToFirestore(personaInterests.toMap());

  // Add any Firestore field values
  mapToFirestore(personaInterests.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPersonaInterestsListFirestoreData(
  List<PersonaInterestsStruct>? personaInterestss,
) =>
    personaInterestss
        ?.map((e) => getPersonaInterestsFirestoreData(e, true))
        .toList() ??
    [];
