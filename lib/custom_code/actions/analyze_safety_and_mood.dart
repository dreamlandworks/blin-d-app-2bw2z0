// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

import 'package:google_mlkit_entity_extraction/google_mlkit_entity_extraction.dart';

Future<dynamic> analyzeSafetyAndMood(String contextBlob) async {
  // Inside analyzeSafetyAndMood Action
  final entityExtractor =
      EntityExtractor(language: EntityExtractorLanguage.english);

  bool piiDetected = false;
  String detectedMood = "Neutral";

  try {
    // 2. Run ML Kit Analysis
    final List<EntityAnnotation> annotations =
        await entityExtractor.annotateText(contextBlob);

    for (var annotation in annotations) {
      for (var entity in annotation.entities) {
        // Flagging contextual PII
        if (entity.type == EntityType.address ||
            entity.type == EntityType.phone ||
            entity.type == EntityType.email ||
            entity.type == EntityType.url) {
          piiDetected = true;
        }
      }
    }

    // 3. Simple Mood Heuristics
    int pos =
        RegExp(r'[❤️😊🔥🚀👍]|awesome|great|love|thanks', caseSensitive: false)
            .allMatches(contextBlob)
            .length;
    int neg =
        RegExp(r'[😠👎😡🚫✖️]|hate|bad|stop|no|rude', caseSensitive: false)
            .allMatches(contextBlob)
            .length;

    if (pos > neg) detectedMood = "Friendly";
    if (neg > pos) detectedMood = "Tense";

    // 4. Return as a Map (FF treats this as JSON)
    return {
      "isToxic": piiDetected,
      "mood": detectedMood,
      "piiFound": piiDetected,
      "sentimentScore": pos - neg,
    };
  } catch (e) {
    return {"isToxic": false, "mood": "Error", "details": e.toString()};
  } finally {
    entityExtractor.close();
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
