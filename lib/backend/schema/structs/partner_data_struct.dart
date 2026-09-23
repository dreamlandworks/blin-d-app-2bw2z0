// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PartnerDataStruct extends FFFirebaseStruct {
  PartnerDataStruct({
    DocumentReference? pUid,
    String? pName,
    String? pAge,
    String? pGender,
    String? pDesc,
    String? pBio,
    List<String>? pInterests,
    String? pPhoto,
    String? pScore,
    String? pStat,
    List<String>? pIce,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pUid = pUid,
        _pName = pName,
        _pAge = pAge,
        _pGender = pGender,
        _pDesc = pDesc,
        _pBio = pBio,
        _pInterests = pInterests,
        _pPhoto = pPhoto,
        _pScore = pScore,
        _pStat = pStat,
        _pIce = pIce,
        super(firestoreUtilData);

  // "p_uid" field.
  DocumentReference? _pUid;
  DocumentReference? get pUid => _pUid;
  set pUid(DocumentReference? val) => _pUid = val;

  bool hasPUid() => _pUid != null;

  // "p_name" field.
  String? _pName;
  String get pName => _pName ?? '';
  set pName(String? val) => _pName = val;

  bool hasPName() => _pName != null;

  // "p_age" field.
  String? _pAge;
  String get pAge => _pAge ?? '';
  set pAge(String? val) => _pAge = val;

  bool hasPAge() => _pAge != null;

  // "p_gender" field.
  String? _pGender;
  String get pGender => _pGender ?? '';
  set pGender(String? val) => _pGender = val;

  bool hasPGender() => _pGender != null;

  // "p_desc" field.
  String? _pDesc;
  String get pDesc => _pDesc ?? '';
  set pDesc(String? val) => _pDesc = val;

  bool hasPDesc() => _pDesc != null;

  // "p_bio" field.
  String? _pBio;
  String get pBio => _pBio ?? '';
  set pBio(String? val) => _pBio = val;

  bool hasPBio() => _pBio != null;

  // "p_interests" field.
  List<String>? _pInterests;
  List<String> get pInterests => _pInterests ?? const [];
  set pInterests(List<String>? val) => _pInterests = val;

  void updatePInterests(Function(List<String>) updateFn) {
    updateFn(_pInterests ??= []);
  }

  bool hasPInterests() => _pInterests != null;

  // "p_photo" field.
  String? _pPhoto;
  String get pPhoto => _pPhoto ?? '';
  set pPhoto(String? val) => _pPhoto = val;

  bool hasPPhoto() => _pPhoto != null;

  // "p_score" field.
  String? _pScore;
  String get pScore => _pScore ?? '';
  set pScore(String? val) => _pScore = val;

  bool hasPScore() => _pScore != null;

  // "p_stat" field.
  String? _pStat;
  String get pStat => _pStat ?? '';
  set pStat(String? val) => _pStat = val;

  bool hasPStat() => _pStat != null;

  // "p_ice" field.
  List<String>? _pIce;
  List<String> get pIce => _pIce ?? const [];
  set pIce(List<String>? val) => _pIce = val;

  void updatePIce(Function(List<String>) updateFn) {
    updateFn(_pIce ??= []);
  }

  bool hasPIce() => _pIce != null;

  static PartnerDataStruct fromMap(Map<String, dynamic> data) =>
      PartnerDataStruct(
        pUid: data['p_uid'] as DocumentReference?,
        pName: data['p_name'] as String?,
        pAge: data['p_age'] as String?,
        pGender: data['p_gender'] as String?,
        pDesc: data['p_desc'] as String?,
        pBio: data['p_bio'] as String?,
        pInterests: getDataList(data['p_interests']),
        pPhoto: data['p_photo'] as String?,
        pScore: data['p_score'] as String?,
        pStat: data['p_stat'] as String?,
        pIce: getDataList(data['p_ice']),
      );

  static PartnerDataStruct? maybeFromMap(dynamic data) => data is Map
      ? PartnerDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'p_uid': _pUid,
        'p_name': _pName,
        'p_age': _pAge,
        'p_gender': _pGender,
        'p_desc': _pDesc,
        'p_bio': _pBio,
        'p_interests': _pInterests,
        'p_photo': _pPhoto,
        'p_score': _pScore,
        'p_stat': _pStat,
        'p_ice': _pIce,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'p_uid': serializeParam(
          _pUid,
          ParamType.DocumentReference,
        ),
        'p_name': serializeParam(
          _pName,
          ParamType.String,
        ),
        'p_age': serializeParam(
          _pAge,
          ParamType.String,
        ),
        'p_gender': serializeParam(
          _pGender,
          ParamType.String,
        ),
        'p_desc': serializeParam(
          _pDesc,
          ParamType.String,
        ),
        'p_bio': serializeParam(
          _pBio,
          ParamType.String,
        ),
        'p_interests': serializeParam(
          _pInterests,
          ParamType.String,
          isList: true,
        ),
        'p_photo': serializeParam(
          _pPhoto,
          ParamType.String,
        ),
        'p_score': serializeParam(
          _pScore,
          ParamType.String,
        ),
        'p_stat': serializeParam(
          _pStat,
          ParamType.String,
        ),
        'p_ice': serializeParam(
          _pIce,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static PartnerDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      PartnerDataStruct(
        pUid: deserializeParam(
          data['p_uid'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        pName: deserializeParam(
          data['p_name'],
          ParamType.String,
          false,
        ),
        pAge: deserializeParam(
          data['p_age'],
          ParamType.String,
          false,
        ),
        pGender: deserializeParam(
          data['p_gender'],
          ParamType.String,
          false,
        ),
        pDesc: deserializeParam(
          data['p_desc'],
          ParamType.String,
          false,
        ),
        pBio: deserializeParam(
          data['p_bio'],
          ParamType.String,
          false,
        ),
        pInterests: deserializeParam<String>(
          data['p_interests'],
          ParamType.String,
          true,
        ),
        pPhoto: deserializeParam(
          data['p_photo'],
          ParamType.String,
          false,
        ),
        pScore: deserializeParam(
          data['p_score'],
          ParamType.String,
          false,
        ),
        pStat: deserializeParam(
          data['p_stat'],
          ParamType.String,
          false,
        ),
        pIce: deserializeParam<String>(
          data['p_ice'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'PartnerDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PartnerDataStruct &&
        pUid == other.pUid &&
        pName == other.pName &&
        pAge == other.pAge &&
        pGender == other.pGender &&
        pDesc == other.pDesc &&
        pBio == other.pBio &&
        listEquality.equals(pInterests, other.pInterests) &&
        pPhoto == other.pPhoto &&
        pScore == other.pScore &&
        pStat == other.pStat &&
        listEquality.equals(pIce, other.pIce);
  }

  @override
  int get hashCode => const ListEquality().hash([
        pUid,
        pName,
        pAge,
        pGender,
        pDesc,
        pBio,
        pInterests,
        pPhoto,
        pScore,
        pStat,
        pIce
      ]);
}

PartnerDataStruct createPartnerDataStruct({
  DocumentReference? pUid,
  String? pName,
  String? pAge,
  String? pGender,
  String? pDesc,
  String? pBio,
  String? pPhoto,
  String? pScore,
  String? pStat,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PartnerDataStruct(
      pUid: pUid,
      pName: pName,
      pAge: pAge,
      pGender: pGender,
      pDesc: pDesc,
      pBio: pBio,
      pPhoto: pPhoto,
      pScore: pScore,
      pStat: pStat,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PartnerDataStruct? updatePartnerDataStruct(
  PartnerDataStruct? partnerData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    partnerData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPartnerDataStructData(
  Map<String, dynamic> firestoreData,
  PartnerDataStruct? partnerData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (partnerData == null) {
    return;
  }
  if (partnerData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && partnerData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final partnerDataData =
      getPartnerDataFirestoreData(partnerData, forFieldValue);
  final nestedData =
      partnerDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = partnerData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPartnerDataFirestoreData(
  PartnerDataStruct? partnerData, [
  bool forFieldValue = false,
]) {
  if (partnerData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(partnerData.toMap());

  // Add any Firestore field values
  mapToFirestore(partnerData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPartnerDataListFirestoreData(
  List<PartnerDataStruct>? partnerDatas,
) =>
    partnerDatas?.map((e) => getPartnerDataFirestoreData(e, true)).toList() ??
    [];
