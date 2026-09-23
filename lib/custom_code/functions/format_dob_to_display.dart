

String? formatDobToDisplay(String dob) {
  if (dob.isEmpty) return '';
  try {
    DateTime dateTime = DateTime.parse(dob);
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    String day = dateTime.day.toString().padLeft(2, '0');
    String month = months[dateTime.month - 1];
    String year = dateTime.year.toString();
    return '$day $month $year';
  } catch (e) {
    return dob; // Fallback to raw string if parsing fails
  }
}
