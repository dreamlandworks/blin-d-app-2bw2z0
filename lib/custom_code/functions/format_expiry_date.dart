

String? formatExpiryDate(int? expiryAtMs) {
  if (expiryAtMs == null || expiryAtMs == 0) {
    return 'N/A';
  }

  DateTime date = DateTime.fromMillisecondsSinceEpoch(expiryAtMs);

  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  String year = date.year.toString();

  return '$day-$month-$year';
}
