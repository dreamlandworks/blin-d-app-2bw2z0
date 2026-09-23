// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FilePathsStruct extends FFFirebaseStruct {
  FilePathsStruct({
    String? localPath,
    String? thumbnailPath,
    String? gcsUrl,
    String? gcsThumbUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _localPath = localPath,
        _thumbnailPath = thumbnailPath,
        _gcsUrl = gcsUrl,
        _gcsThumbUrl = gcsThumbUrl,
        super(firestoreUtilData);

  // "localPath" field.
  String? _localPath;
  String get localPath => _localPath ?? '';
  set localPath(String? val) => _localPath = val;

  bool hasLocalPath() => _localPath != null;

  // "thumbnailPath" field.
  String? _thumbnailPath;
  String get thumbnailPath => _thumbnailPath ?? '';
  set thumbnailPath(String? val) => _thumbnailPath = val;

  bool hasThumbnailPath() => _thumbnailPath != null;

  // "gcsUrl" field.
  String? _gcsUrl;
  String get gcsUrl => _gcsUrl ?? '';
  set gcsUrl(String? val) => _gcsUrl = val;

  bool hasGcsUrl() => _gcsUrl != null;

  // "gcsThumbUrl" field.
  String? _gcsThumbUrl;
  String get gcsThumbUrl => _gcsThumbUrl ?? '';
  set gcsThumbUrl(String? val) => _gcsThumbUrl = val;

  bool hasGcsThumbUrl() => _gcsThumbUrl != null;

  static FilePathsStruct fromMap(Map<String, dynamic> data) => FilePathsStruct(
        localPath: data['localPath'] as String?,
        thumbnailPath: data['thumbnailPath'] as String?,
        gcsUrl: data['gcsUrl'] as String?,
        gcsThumbUrl: data['gcsThumbUrl'] as String?,
      );

  static FilePathsStruct? maybeFromMap(dynamic data) => data is Map
      ? FilePathsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'localPath': _localPath,
        'thumbnailPath': _thumbnailPath,
        'gcsUrl': _gcsUrl,
        'gcsThumbUrl': _gcsThumbUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'localPath': serializeParam(
          _localPath,
          ParamType.String,
        ),
        'thumbnailPath': serializeParam(
          _thumbnailPath,
          ParamType.String,
        ),
        'gcsUrl': serializeParam(
          _gcsUrl,
          ParamType.String,
        ),
        'gcsThumbUrl': serializeParam(
          _gcsThumbUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static FilePathsStruct fromSerializableMap(Map<String, dynamic> data) =>
      FilePathsStruct(
        localPath: deserializeParam(
          data['localPath'],
          ParamType.String,
          false,
        ),
        thumbnailPath: deserializeParam(
          data['thumbnailPath'],
          ParamType.String,
          false,
        ),
        gcsUrl: deserializeParam(
          data['gcsUrl'],
          ParamType.String,
          false,
        ),
        gcsThumbUrl: deserializeParam(
          data['gcsThumbUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FilePathsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FilePathsStruct &&
        localPath == other.localPath &&
        thumbnailPath == other.thumbnailPath &&
        gcsUrl == other.gcsUrl &&
        gcsThumbUrl == other.gcsThumbUrl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([localPath, thumbnailPath, gcsUrl, gcsThumbUrl]);
}

FilePathsStruct createFilePathsStruct({
  String? localPath,
  String? thumbnailPath,
  String? gcsUrl,
  String? gcsThumbUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FilePathsStruct(
      localPath: localPath,
      thumbnailPath: thumbnailPath,
      gcsUrl: gcsUrl,
      gcsThumbUrl: gcsThumbUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FilePathsStruct? updateFilePathsStruct(
  FilePathsStruct? filePaths, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    filePaths
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFilePathsStructData(
  Map<String, dynamic> firestoreData,
  FilePathsStruct? filePaths,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (filePaths == null) {
    return;
  }
  if (filePaths.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && filePaths.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final filePathsData = getFilePathsFirestoreData(filePaths, forFieldValue);
  final nestedData = filePathsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = filePaths.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFilePathsFirestoreData(
  FilePathsStruct? filePaths, [
  bool forFieldValue = false,
]) {
  if (filePaths == null) {
    return {};
  }
  final firestoreData = mapToFirestore(filePaths.toMap());

  // Add any Firestore field values
  mapToFirestore(filePaths.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFilePathsListFirestoreData(
  List<FilePathsStruct>? filePathss,
) =>
    filePathss?.map((e) => getFilePathsFirestoreData(e, true)).toList() ?? [];
