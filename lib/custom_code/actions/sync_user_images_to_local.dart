// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode;

Future syncUserImagesToLocal(
  dynamic photoData, // Pass AuthenticatedUser.photo_file_paths here
  String hiveBoxName,
) async {
  // 1. SAFETY GATES
  if (kIsWeb) return;
  // Handle case where photoData might be null or empty
  if (photoData == null) return;

  try {
    // 2. EXTRACT URLS
    final String? gcsUrl = photoData['gcsUrl'];
    final String? gcsThumbUrl = photoData['gcsThumbUrl'];

    if (gcsUrl == null && gcsThumbUrl == null) return;

    // 3. INITIALIZE HIVE
    final box = await Hive.openBox(hiveBoxName);
    Map<String, dynamic> localCache =
        Map<String, dynamic>.from(box.get('paths', defaultValue: {}));
    bool needsUpdate = false;

    // --- DOWNLOAD HELPER ---
    Future<String?> downloadAndSave(String? remoteUrl, String fileLabel) async {
      if (remoteUrl == null || !remoteUrl.startsWith('http')) return null;
      try {
        String extension = remoteUrl.split('?').first.split('.').last;
        if (extension.length > 4) extension = 'jpg';

        final directory = await getApplicationDocumentsDirectory();
        final fileName = '${fileLabel}_profile.$extension';
        final filePath = '${directory.path}/$fileName';

        final response = await http.get(Uri.parse(remoteUrl));
        if (response.statusCode == 200) {
          final file = File(filePath);
          await file.writeAsBytes(response.bodyBytes);
          return filePath;
        }
      } catch (e) {
        if (kDebugMode) {
          print("Download Error ($fileLabel): $e");
        }
      }
      return null;
    }

    // --- CHECK & DOWNLOAD FULL IMAGE ---
    String? currentLocalPath = localCache['localPath'];
    if (currentLocalPath == null || !File(currentLocalPath).existsSync()) {
      if (kDebugMode) {
        print("Downloading Full Image...");
      }
      String? newPath = await downloadAndSave(gcsUrl, 'full');
      if (newPath != null) {
        localCache['localPath'] = newPath;
        currentLocalPath = newPath; // Update local variable for state
        needsUpdate = true;
      }
    }

    // --- CHECK & DOWNLOAD THUMBNAIL ---
    String? currentThumbPath = localCache['thumbnailPath'];
    if (currentThumbPath == null || !File(currentThumbPath).existsSync()) {
      if (kDebugMode) {
        print("Downloading Thumbnail...");
      }
      String? newPath = await downloadAndSave(gcsThumbUrl, 'thumb');
      if (newPath != null) {
        localCache['thumbnailPath'] = newPath;
        currentThumbPath = newPath; // Update local variable for state
        needsUpdate = true;
      }
    }

    // 4. UPDATE HIVE & APP STATE
    if (needsUpdate) {
      await box.put('paths', localCache);

      FFAppState().update(() {
        FFAppState().photoFilePaths = FilePathsStruct(
          localPath: currentLocalPath ?? '',
          thumbnailPath: currentThumbPath ?? '',
          gcsUrl: gcsUrl ?? '',
          gcsThumbUrl: gcsThumbUrl ?? '',
        );
      });
      if (kDebugMode) {
        print("Local Image Cache Updated successfully.");
      }
    } // Closing if(needsUpdate)
  } catch (e) {
    if (kDebugMode) {
      print("Sync Action Error: $e");
    }
  }
}
