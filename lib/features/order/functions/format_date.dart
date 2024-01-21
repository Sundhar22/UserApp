import 'package:intl/intl.dart';

String _getOrdinalSuffix(int day) {
  switch (day % 10) {
    case 1:
      return day == 11 ? 'th' : 'st';
    case 2:
      return day == 12 ? 'th' : 'nd';
    case 3:
      return day == 13 ? 'th' : 'rd';
    default:
      return 'th';
  }
}

String formatDate(DateTime now) {
  int date = now.day;

  DateFormat formatter = DateFormat('MMM yy'); // Short month name, 2-digit year

  String formattedDate =
      "$date${_getOrdinalSuffix(now.day)} ${formatter.format(now)}'";
  return formattedDate;
}
