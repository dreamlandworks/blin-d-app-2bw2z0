import 'dart:math' as math;


String? generateRandomVibe() {
// 1. Create your clean pool of custom vibe strings
  final List<String> vibes = ['chill', 'cool', 'playful', 'hot', 'romantic'];

  // 2. Instantiate the math random generator
  final math.Random random = math.Random();

  // 3. Pick a random index matching the size of the array
  final int randomIndex = random.nextInt(vibes.length);

  // 4. Return the selected string safely
  return vibes[randomIndex];
}
