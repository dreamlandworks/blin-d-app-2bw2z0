
import 'package:intl/intl.dart';

String? getTimestampFromFirestoreString(String? firestoreStr) {
  if (firestoreStr == null || firestoreStr.isEmpty) {
    return "0";
  }

  String processedVar1 = firestoreStr.replaceAll(' ', ' ');

  try {
    processedVar1 = processedVar1.replaceFirstMapped(
      RegExp(r'UTC\+(\d{1,2}):(\d{2})'),
      (match) {
        String hour = match.group(1)!;
        if (hour.length == 1) {
          hour = '0$hour';
        }
        return '+$hour:${match.group(2)}';
      },
    );

    final dateFormat = DateFormat("MMMM d, yyyy 'at' hh:mm:ss a ZZZZ");
    final DateTime dateTime = dateFormat.parse(processedVar1);
    return dateTime.millisecondsSinceEpoch.toString();
  } on FormatException {
    return "0";
  } catch (_) {
    return "0";
  }
}
