// Automatic FlutterFlow imports
// Imports other custom actions
// Imports custom functions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
// Imports custom functions

// Imports other custom actions
// Imports custom functions

// Automatic FlutterFlow imports (Ensure these are at the top)

import 'package:flutter/foundation.dart';

Future<dynamic> getProfileAndTraitData(
  bool? isVerified,
  dynamic socialListRaw,
  bool? hasPersona,
  dynamic traitsJson,
) async {
  // 1. Calculate Score based on individual inputs
  final bool verified = isVerified ?? false;
  final bool persona = hasPersona ?? false;

  // This line kills the 'LinkedMap' error
  final List<String> socialList =
      (socialListRaw is List) ? List<String>.from(socialListRaw) : [];

  double progressScore = 0.50; // Base 50%
  if (kDebugMode) {
    print("getProfileAndTraitData function started");
  }
  if (socialList.isNotEmpty) {
    progressScore += 0.10;
  }

  if (verified) {
    progressScore += 0.20;
  }

  if (persona) {
    progressScore += 0.20;
  }

  // 2. Default Return Object
  Map<String, dynamic> traitData = {
    "trait1_name": "Romance",
    "trait1_pct": 0.0,
    "trait2_name": "Empathy",
    "trait2_pct": 0.0,
    "statement": "Verify your profile to unlock your soul's blueprint.",
    "progress_value": progressScore.clamp(0.0, 1.0),
    "progress_text": "${(progressScore * 100).toInt()}%"
  };

  // 3. Process Traits ONLY if Verified & Data exists
  try {
    if (verified && traitsJson != null) {
      // Cast the dynamic input to a Map
      final traits = traitsJson as Map<String, dynamic>;

      List<MapEntry<String, double>> traitEntries = [
        MapEntry("Empathy", (traits['empathy'] ?? 0).toDouble()),
        MapEntry("Romance", (traits['romance'] ?? 0).toDouble()),
        MapEntry("Curiosity", (traits['curiosity'] ?? 0).toDouble()),
        MapEntry("Loyalty", (traits['loyalty'] ?? 0).toDouble()),
        MapEntry(
            "Emotional Depth", (traits['emotional_depth'] ?? 0).toDouble()),
      ];

      double totalSum =
          traitEntries.fold(0.0, (sum, entry) => sum + entry.value);

      if (totalSum > 0) {
        traitEntries.sort((a, b) => b.value.compareTo(a.value));
        var t1 = traitEntries[0];
        var t2 = traitEntries[1];

        List<String> pair = [
          t1.key.toLowerCase().replaceAll(' ', '_'),
          t2.key.toLowerCase().replaceAll(' ', '_')
        ]..sort();

        String pairKey = pair.join("_");

        Map<String, String> library = {
          "curiosity_romance":
              "You are too romantic yet curious, which makes you irresistible.",
          "empathy_romance":
              "A heart of gold and a soul built for love. You are a natural protector.",
          "empathy_loyalty":
              "The ultimate companion—your loyalty is grounded in deep understanding.",
          "curiosity_empathy":
              "You feel the world deeply and seek to understand every heart you meet.",
          "emotional_depth_romance":
              "A profound lover. Your romantic side is as deep as the ocean.",
          "loyalty_romance":
              "Old-school love at its best. You are fiercely devoted to those you hold dear.",
          "curiosity_loyalty":
              "Intrigued by the world but anchored by your people. A perfect balance.",
          "curiosity_emotional_depth":
              "A brilliant seeker who explores the deepest layers of human thought.",
          "emotional_depth_loyalty":
              "Your bonds are unbreakable, forged in the fires of deep reflection.",
          "empathy_emotional_depth":
              "You are an emotional mirror, reflecting back the world's beauty and pain.",
        };

        traitData["trait1_name"] = t1.key;
        traitData["trait1_pct"] = (t1.value / totalSum);
        traitData["trait2_name"] = t2.key;
        traitData["trait2_pct"] = (t2.value / totalSum);
        traitData["statement"] =
            library[pairKey] ?? "A unique blend of energy.";
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print("Trait Score Math Error: $e");
    }
  }
  if (kDebugMode) {
    print("getProfileAndTraitData function Finished");
  }

  return traitData;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
