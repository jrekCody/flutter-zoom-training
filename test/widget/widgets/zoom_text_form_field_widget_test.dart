import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/utils/color_util.dart';
import 'package:flutter_zoom/widgets/zoom_text_form_field_widget.dart';

void main() {
  testWidgets('ZoomTextFormFieldWidget set hint Enter your name',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ZoomTextFormFieldWidget(
        hint: 'Enter your name',
        onChanged: (val) {},
      ),
    ));

    final hintFinder = find.text('Enter your name');
    expect(hintFinder, findsOneWidget);
  });

  testWidgets(
      'ZoomTextFormFieldWidget set hint Enter your name and onChanged is changed',
      (tester) async {
    bool wasChanged = false;
    await tester.pumpWidget(MaterialApp(
      home: ZoomTextFormFieldWidget(
        hint: 'Enter your name',
        onChanged: (val) => wasChanged = true,
      ),
    ));

    await tester.enterText(find.byType(TextField), 'John');

    final hintFinder = find.text('Enter your name');
    final textFieldFinder = find.byType(TextField);
    final textFieldWidget = tester.widget<TextField>(textFieldFinder);

    expect(hintFinder, findsOneWidget);
    expect(textFieldWidget.controller?.text, 'John');
    expect(wasChanged, true);
  });

  testWidgets('ZoomTextFormFieldWidget set max lines, text align',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ZoomTextFormFieldWidget(
        hint: 'Enter your name',
        onChanged: (val) {},
      ),
    ));

    final hintFinder = find.text('Enter your name');
    final textFieldFinder = find.byType(TextField);
    final textFieldWidget = tester.widget<TextField>(textFieldFinder);

    expect(hintFinder, findsOneWidget);
    expect(textFieldWidget.maxLines, 1);
    expect(textFieldWidget.textAlign, TextAlign.center);
  });

  testWidgets('ZoomTextFormFieldWidget set decoration', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ZoomTextFormFieldWidget(
        hint: 'Enter your name',
        onChanged: (val) {},
      ),
    ));

    final hintFinder = find.text('Enter your name');
    final textFieldFinder = find.byType(TextField);
    final textFieldWidget = tester.widget<TextField>(textFieldFinder);
    final decoration = textFieldWidget.decoration;

    expect(hintFinder, findsOneWidget);
    expect(decoration?.fillColor, ColorUtil.lightGreyColor);
    expect(decoration?.filled, true);
    expect(decoration?.border, InputBorder.none);
  });
}
