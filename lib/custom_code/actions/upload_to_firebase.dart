// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:firebase_storage/firebase_storage.dart';

Future<String> uploadToFirebase(
  FFUploadedFile fileBytes,
  String remotePath,
) async {
  // Add your function code here!
  String fileName = fileBytes.name ?? "upload.jpg";
// This gets everything after the last dot
  String extension = fileName.contains('.') ? fileName.split('.').last : "jpg";

// Now combine it for your remotePath
  String finalRemotePath = "$remotePath.$extension";

  try {
    // 1. Get a reference to the storage bucket
    final storageRef = FirebaseStorage.instance.ref().child(finalRemotePath);

    // 2. Upload the bytes
    final uploadTask = await storageRef.putData(fileBytes.bytes!);

    // 3. Get the public download URL
    return await uploadTask.ref.getDownloadURL();
  } catch (e) {
    return "";
  }
}
