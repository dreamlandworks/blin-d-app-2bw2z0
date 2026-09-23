

List<DateTime> minMaxCalender() {
  final now = DateTime.now();
  final defaultDate = now.subtract(const Duration(days: (18 * 365)));
  final maxDate = now.subtract(const Duration(days: (100 * 365)));

  return [defaultDate, maxDate];
}
