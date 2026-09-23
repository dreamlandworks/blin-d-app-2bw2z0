// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:flutter/foundation.dart';
import 'package:google_mlkit_entity_extraction/google_mlkit_entity_extraction.dart';

Future initializeMLKit() async {
  // 1. Get the manager instance specifically for Entity Extraction
  final modelManager = EntityExtractorModelManager();

  // 2. Define our language model
  final String model = EntityExtractorLanguage.english.name;

  try {
    // 3. Check if the model is already on the device
    final bool isDownloaded = await modelManager.isModelDownloaded(model);

    if (!isDownloaded) {
      if (kDebugMode) {
        print("📦 ML Kit: Downloading English model...");
      }

      // 4. Trigger download - we'll use the default settings
      // to avoid 'isRequiredWifi' version conflicts
      await modelManager.downloadModel(model);

      if (kDebugMode) {
        print("✅ ML Kit: Model downloaded successfully.");
      }
    } else {
      if (kDebugMode) {
        print("🚀 ML Kit: Model already exists on device.");
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print("❌ ML Kit Initialization Error: $e");
    }
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
