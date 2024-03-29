import 'package:intl/intl.dart';

class DateTimeUtil {
  DateTimeUtil._();

  static String formattedDateYMMMd(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return DateFormat.yMMMd().format(dateTime);
  }
}
