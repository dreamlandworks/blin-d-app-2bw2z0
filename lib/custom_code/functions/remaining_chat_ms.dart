int remainingChatMs(int endTime) {
  final now = DateTime.now().millisecondsSinceEpoch;
  if (endTime > 1000000000000) {
    final left = endTime - now;
    return left > 0 ? left : 0;
  }
  if (endTime > 1000 && endTime <= 3600000) {
    return endTime;
  }
  return 0;
}
