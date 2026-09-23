// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProfileStruct extends FFFirebaseStruct {
  UserProfileStruct({
    FilePathsStruct? photoFilePaths,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _photoFilePaths = photoFilePaths,
        super(firestoreUtilData);

  // "photo_file_paths" field.
  FilePathsStruct? _photoFilePaths;
  FilePathsStruct get photoFilePaths => _photoFilePaths ?? FilePathsStruct();
  set photoFilePaths(FilePathsStruct? val) => _photoFilePaths = val;

  void updatePhotoFilePaths(Function(FilePathsStruct) updateFn) {
    updateFn(_photoFilePaths ??= FilePathsStruct());
  }

  bool hasPhotoFilePaths() => _photoFilePaths != null;

  static UserProfileStruct fromMap(Map<String, dynamic> data) =>
      UserProfileStruct(
        photoFilePaths: data['photo_file_paths'] is FilePathsStruct
            ? data['photo_file_paths']
            : FilePathsStruct.maybeFromMap(data['photo_file_paths']),
      );

  static UserProfileStruct? maybeFromMap(dynamic data) => data is Map
      ? UserProfileStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'photo_file_paths': _photoFilePaths?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'photo_file_paths': serializeParam(
          _photoFilePaths,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UserProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserProfileStruct(
        photoFilePaths: deserializeStructParam(
          data['photo_file_paths'],
          ParamType.DataStruct,
          false,
          structBuilder: FilePathsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserProfileStruct && photoFilePaths == other.photoFilePaths;
  }

  @override
  int get hashCode => const ListEquality().hash([photoFilePaths]);
}

UserProfileStruct createUserProfileStruct({
  FilePathsStruct? photoFilePaths,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserProfileStruct(
      photoFilePaths:
          photoFilePaths ?? (clearUnsetFields ? FilePathsStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserProfileStruct? updateUserProfileStruct(
  UserProfileStruct? userProfile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userProfile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserProfileStructData(
  Map<String, dynamic> firestoreData,
  UserProfileStruct? userProfile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userProfile == null) {
    return;
  }
  if (userProfile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userProfile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userProfileData =
      getUserProfileFirestoreData(userProfile, forFieldValue);
  final nestedData =
      userProfileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userProfile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserProfileFirestoreData(
  UserProfileStruct? userProfile, [
  bool forFieldValue = false,
]) {
  if (userProfile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userProfile.toMap());

  // Handle nested data for "photo_file_paths" field.
  addFilePathsStructData(
    firestoreData,
    userProfile.hasPhotoFilePaths() ? userProfile.photoFilePaths : null,
    'photo_file_paths',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(userProfile.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserProfileListFirestoreData(
  List<UserProfileStruct>? userProfiles,
) =>
    userProfiles?.map((e) => getUserProfileFirestoreData(e, true)).toList() ??
    [];
