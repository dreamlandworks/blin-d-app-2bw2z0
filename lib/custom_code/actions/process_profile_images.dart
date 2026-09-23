// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> processProfileImages(String hiveBoxName) async {
  // 1. GLOBAL SAFETY GATE
  if (kIsWeb) {
    if (kDebugMode) {
      print("Running on Web: Skipping local file download logic.");
    }
    return; // Exit early so the navigation can proceed
  }

  final box = Hive.isBoxOpen(hiveBoxName)
      ? Hive.box(hiveBoxName)
      : await Hive.openBox(hiveBoxName);
  final profile = box.get('profile');

  if (profile == null || profile['photo_file_paths'] == null) return;

  Map<String, dynamic> photoPaths =
      Map<String, dynamic>.from(profile['photo_file_paths']);
  bool needsUpdate = false;

  // --- THE HELPER TOOL (Defined once, used twice) ---
  Future<String?> downloadAndSave(String? remoteUrl, String fileLabel) async {
    if (remoteUrl == null || !remoteUrl.startsWith('http')) return null;

    try {
      // Get extension from URL (e.g., .jpg or .png)
      // If it fails to find one, it defaults to .jpg
      String extension = remoteUrl.split('?').first.split('.').last;
      if (extension.length > 4) extension = 'jpg';

      final directory = await getApplicationDocumentsDirectory();
      final fileName =
          '${fileLabel}_${DateTime.now().millisecondsSinceEpoch}.$extension';
      final filePath = '${directory.path}/$fileName';

      final response = await http.get(Uri.parse(remoteUrl));
      if (response.statusCode == 200) {
        await File(filePath).writeAsBytes(response.bodyBytes);
        return filePath;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Download Error: $e");
      }
    }
    return null;
  }

  // --- EXECUTION (This is where url and prefix are passed) ---

  // Task A: Handle Full Image
  String? localFull = photoPaths['localPath'];
  if (localFull == null || !File(localFull).existsSync()) {
    // Here we pass (url from hive, label for file)
    String? downloadedPath =
        await downloadAndSave(photoPaths['gcsUrl'], 'full_profile');
    if (downloadedPath != null) {
      photoPaths['localPath'] = downloadedPath;
      needsUpdate = true;
    }
  }

  // Task B: Handle Thumbnail
  String? localThumb = photoPaths['thumbnailPath'];
  if (localThumb == null || !File(localThumb).existsSync()) {
    // Here we pass (url from hive, label for file)
    String? downloadedPath =
        await downloadAndSave(photoPaths['gcsThumbUrl'], 'thumb_profile');
    if (downloadedPath != null) {
      photoPaths['thumbnailPath'] = downloadedPath;
      needsUpdate = true;
    }
  }

  // --- SAVE RESULTS ---
  if (needsUpdate) {
    // 1. Get the current profile again to ensure we have the latest
    Map<String, dynamic> updatedProfile =
        Map<String, dynamic>.from(box.get('profile'));

    // 2. Get the existing paths map
    Map<String, dynamic> existingPaths =
        Map<String, dynamic>.from(updatedProfile['photo_file_paths']);

    // 3. ONLY update the local paths, leaving gcsUrl and gcsThumbUrl untouched
    existingPaths['localPath'] = photoPaths['localPath'];
    existingPaths['thumbnailPath'] = photoPaths['thumbnailPath'];

    // 4. Put the combined map back into the profile
    updatedProfile['photo_file_paths'] = existingPaths;

    await box.put('profile', updatedProfile);
    if (kDebugMode) {
      print("Hive updated: Local paths added, GCS URLs preserved.");
    }
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
