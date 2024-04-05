import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/utils/datetime_util.dart';
import 'package:intl/intl.dart';

void main() {
  group('DateTimeUtil', () {
    test('formattedDateYMMMd returns correct format for specified date', () {
      final date = DateTime(2024, 4, 2);
      expect(DateTimeUtil.formattedDateYMMMd(date),
          DateFormat.yMMMd().format(date));
    });

    test('formattedDateYMMMd returns empty string for null date', () {
      expect(DateTimeUtil.formattedDateYMMMd(null), '');
    });
  });
}
