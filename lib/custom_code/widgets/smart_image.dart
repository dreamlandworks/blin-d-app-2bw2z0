// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom widgets
// Imports custom actions
// Imports custom functions

// ignore_for_file: library_private_types_in_public_api

// Imports other custom widgets
// Imports custom actions
// Imports custom functions

import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class SmartImage extends StatefulWidget {
  const SmartImage({
    super.key,
    this.width,
    this.height,
    this.filePath,
    this.isCircle = false,
  });

  final double? width;
  final double? height;
  final FilePathsStruct? filePath; // Using your Data Type
  final bool isCircle;

  @override
  SmartImageState createState() => SmartImageState();
}

class SmartImageState extends State<SmartImage> {
  @override
  Widget build(BuildContext context) {
    // 1. Extract paths from the Struct
    final String? localPath = widget.filePath?.localPath;
    String? networkUrl = widget.filePath?.gcsUrl;

    // 2. Decide which source to use
    // We use networkUrl on Web, or if localPath is missing/doesn't exist
    // // 2. HARDCODE FOR WEB TESTING
    if (kIsWeb) {
      // This uses a reliable placeholder that usually has CORS enabled
      networkUrl = "https://picsum.photos/200/300";
    }
    bool useNetwork = kIsWeb || localPath == null || localPath.isEmpty;

    // Check if file actually exists on mobile disk
    if (!useNetwork) {
      if (!File(localPath.replaceFirst('file://', '')).existsSync()) {
        useNetwork = true;
      }
    }

    final String finalPath = useNetwork ? (networkUrl ?? '') : localPath!;

    // 3. Build the Image Widget
    Widget imageWidget;

    if (finalPath.isEmpty) {
      imageWidget = Container(
        width: widget.width,
        height: widget.height,
        color: Colors.grey[300],
        child: const Icon(Icons.image_not_supported),
      );
    } else if (useNetwork) {
      imageWidget = Image.network(
        finalPath,
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image),
      );
    } else {
      imageWidget = Image.file(
        File(finalPath.replaceFirst('file://', '')),
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.folder_off),
      );
    }

    // 4. Apply Shape (Circle or Rectangle)
    if (widget.isCircle) {
      return Container(
        width: widget.width,
        height: widget.width, // Force square for circle
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: ClipOval(child: imageWidget),
      );
    } else {
      return ClipRRect(
        borderRadius:
            BorderRadius.circular(0), // Change this if you want rounded corners
        child: imageWidget,
      );
    }
  }
}
