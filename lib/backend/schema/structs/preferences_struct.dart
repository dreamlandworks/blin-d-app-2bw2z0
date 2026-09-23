// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PreferencesStruct extends FFFirebaseStruct {
  PreferencesStruct({
    String? lookingFor,
    List<String>? interests,
    String? locationCity,
    String? interestedIn,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lookingFor = lookingFor,
        _interests = interests,
        _locationCity = locationCity,
        _interestedIn = interestedIn,
        super(firestoreUtilData);

  // "looking_for" field.
  String? _lookingFor;
  String get lookingFor => _lookingFor ?? '';
  set lookingFor(String? val) => _lookingFor = val;

  bool hasLookingFor() => _lookingFor != null;

  // "interests" field.
  List<String>? _interests;
  List<String> get interests => _interests ?? const [];
  set interests(List<String>? val) => _interests = val;

  void updateInterests(Function(List<String>) updateFn) {
    updateFn(_interests ??= []);
  }

  bool hasInterests() => _interests != null;

  // "location_city" field.
  String? _locationCity;
  String get locationCity => _locationCity ?? '';
  set locationCity(String? val) => _locationCity = val;

  bool hasLocationCity() => _locationCity != null;

  // "interested_in" field.
  String? _interestedIn;
  String get interestedIn => _interestedIn ?? '';
  set interestedIn(String? val) => _interestedIn = val;

  bool hasInterestedIn() => _interestedIn != null;

  static PreferencesStruct fromMap(Map<String, dynamic> data) =>
      PreferencesStruct(
        lookingFor: data['looking_for'] as String?,
        interests: getDataList(data['interests']),
        locationCity: data['location_city'] as String?,
        interestedIn: data['interested_in'] as String?,
      );

  static PreferencesStruct? maybeFromMap(dynamic data) => data is Map
      ? PreferencesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'looking_for': _lookingFor,
        'interests': _interests,
        'location_city': _locationCity,
        'interested_in': _interestedIn,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'looking_for': serializeParam(
          _lookingFor,
          ParamType.String,
        ),
        'interests': serializeParam(
          _interests,
          ParamType.String,
          isList: true,
        ),
        'location_city': serializeParam(
          _locationCity,
          ParamType.String,
        ),
        'interested_in': serializeParam(
          _interestedIn,
          ParamType.String,
        ),
      }.withoutNulls;

  static PreferencesStruct fromSerializableMap(Map<String, dynamic> data) =>
      PreferencesStruct(
        lookingFor: deserializeParam(
          data['looking_for'],
          ParamType.String,
          false,
        ),
        interests: deserializeParam<String>(
          data['interests'],
          ParamType.String,
          true,
        ),
        locationCity: deserializeParam(
          data['location_city'],
          ParamType.String,
          false,
        ),
        interestedIn: deserializeParam(
          data['interested_in'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PreferencesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PreferencesStruct &&
        lookingFor == other.lookingFor &&
        listEquality.equals(interests, other.interests) &&
        locationCity == other.locationCity &&
        interestedIn == other.interestedIn;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([lookingFor, interests, locationCity, interestedIn]);
}

PreferencesStruct createPreferencesStruct({
  String? lookingFor,
  String? locationCity,
  String? interestedIn,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PreferencesStruct(
      lookingFor: lookingFor,
      locationCity: locationCity,
      interestedIn: interestedIn,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PreferencesStruct? updatePreferencesStruct(
  PreferencesStruct? preferences, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    preferences
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPreferencesStructData(
  Map<String, dynamic> firestoreData,
  PreferencesStruct? preferences,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (preferences == null) {
    return;
  }
  if (preferences.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && preferences.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final preferencesData =
      getPreferencesFirestoreData(preferences, forFieldValue);
  final nestedData =
      preferencesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = preferences.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPreferencesFirestoreData(
  PreferencesStruct? preferences, [
  bool forFieldValue = false,
]) {
  if (preferences == null) {
    return {};
  }
  final firestoreData = mapToFirestore(preferences.toMap());

  // Add any Firestore field values
  mapToFirestore(preferences.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPreferencesListFirestoreData(
  List<PreferencesStruct>? preferencess,
) =>
    preferencess?.map((e) => getPreferencesFirestoreData(e, true)).toList() ??
    [];
