double clampedChatProgress(int endTime, int allottedMs) {
  final now = DateTime.now().millisecondsSinceEpoch;
  int remaining;
  var allotted = 1200000;
  if (endTime > 1000000000000) {
    remaining = endTime - now;
    if (allottedMs > 1000000000000 && endTime > allottedMs) {
      allotted = endTime - allottedMs;
    } else if (allottedMs > 1000 && allottedMs <= 7200000) {
      allotted = allottedMs;
    }
  } else if (endTime > 1000 && endTime <= 7200000) {
    remaining = endTime;
    if (allottedMs > 1000 && allottedMs <= 7200000) {
      allotted = allottedMs;
    }
  } else {
    remaining = allottedMs;
  }
  if (remaining > allotted) {
    allotted = remaining;
  }
  if (allotted <= 0) {
    return 0.0;
  }
  final ratio = remaining / allotted;
  if (!ratio.isFinite) {
    return 0.0;
  }
  if (ratio < 0) {
    return 0.0;
  }
  if (ratio > 1) {
    return 1.0;
  }
  return ratio;
}
