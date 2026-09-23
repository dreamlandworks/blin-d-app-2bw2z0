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

import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> saveImageLocally(FFUploadedFile uploadedFile) async {
  if (uploadedFile.bytes == null) return "";

  // Get the permanent directory for the app
  final directory = await getApplicationDocumentsDirectory();

  // Create a unique filename (using timestamp)
  final String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
  final File localFile = File('${directory.path}/$fileName');

  // Write the bytes to the permanent location
  await localFile.writeAsBytes(uploadedFile.bytes!);

  return localFile.path; // Save THIS string in Hive
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
