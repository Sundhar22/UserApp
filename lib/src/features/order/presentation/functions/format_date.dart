import 'package:intl/intl.dart';

String formatDate(DateTime now) {
  DateFormat formatter =
      DateFormat('MMMM dd, yyyy'); // Short month name, 2-digit year

  String formattedDate = formatter.format(now);
  return formattedDate;
}
