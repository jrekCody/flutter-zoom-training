import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/utils/color_util.dart';

void main() {
  group('ColorUtil', () {
    test('blackColor returns correct color', () {
      expect(ColorUtil.blackColor, const Color(0xff1a1a1a));
    });

    test('greyColor returns correct color', () {
      expect(ColorUtil.greyColor, const Color(0xff242424));
    });

    test('lightGreyColor returns correct color', () {
      expect(ColorUtil.lightGreyColor, const Color(0xff2e2e2e));
    });

    test('blueColor returns correct color', () {
      expect(ColorUtil.blueColor, const Color(0xff0E72EC));
    });

    test('blueColor returns incorrect color', () {
      expect(ColorUtil.blueColor, isNot(const Color(0xff2e2e2e)));
    });
  });
}
