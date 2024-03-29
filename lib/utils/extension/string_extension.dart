import 'dart:convert';
import 'dart:math';

extension StringExtensions on String {
  static String getRandomString(int len) {
    final random = Random.secure();
    final values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }
}
