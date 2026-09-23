int getInitialTimerMs(int cooldownUntil) {
  final remaining = cooldownUntil - DateTime.now().millisecondsSinceEpoch;
  return remaining > 0 ? remaining : 0;
}
