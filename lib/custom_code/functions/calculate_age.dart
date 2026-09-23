

int calculateAge(DateTime? dob) {
  if (dob == null) {
    return 0; // Fallback if DOB is missing
  }

  final DateTime now = DateTime.now();
  int age = now.year - dob.year;

  // Subtract 1 year if the birthday hasn't occurred yet this year
  if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
    age--;
  }

  return age;
}
