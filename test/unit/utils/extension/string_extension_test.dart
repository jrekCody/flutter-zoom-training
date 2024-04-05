import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/utils/extension/string_extension.dart';

void main() {
  group('StringExtensions', () {
    test('getRandomString returns string of correct length', () {
      final randomString = StringExtensions.getRandomString(10);
      expect(randomString.length, 10);
    });

    test('getRandomString returns different strings for different calls', () {
      final randomString1 = StringExtensions.getRandomString(10);
      final randomString2 = StringExtensions.getRandomString(10);
      expect(randomString1, isNot(equals(randomString2)));
    });

    test('getRandomString returns string of length 0 when length is 0', () {
      final randomString = StringExtensions.getRandomString(0);
      expect(randomString, isEmpty);
    });

    test('getRandomString throws ArgumentError when length is negative', () {
      expect(() => StringExtensions.getRandomString(-10), throwsArgumentError);
    });
  });
}
