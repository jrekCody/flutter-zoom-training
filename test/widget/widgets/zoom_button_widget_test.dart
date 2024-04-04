import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/utils/color_util.dart';
import 'package:flutter_zoom/widgets/zoom_button_widget.dart';

void main() {
  testWidgets('ZoomButtonWidget with label Click me! and onPressed is empty',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: ZoomButtonWidget(label: 'Click me!', onPressed: () {})));

    final labelFinder = find.text('Click me!');
    expect(labelFinder, findsOneWidget);
  });

  testWidgets('ZoomButtonWidget with label Tap! and onPressed is tapped',
      (tester) async {
    bool wasPressed = false;
    await tester.pumpWidget(MaterialApp(
        home: ZoomButtonWidget(
            label: 'Tap!',
            onPressed: () {
              wasPressed = true;
            })));

    await tester.tap(find.byType(ZoomButtonWidget));

    final labelFinder = find.text('Tap!');

    expect(labelFinder, findsOneWidget);
    expect(wasPressed, true);
  });

  testWidgets('ZoomButtonWidget the text label set fontSize and color',
      (tester) async {
    await tester.pumpWidget(
        MaterialApp(home: ZoomButtonWidget(label: 'Tap!', onPressed: () {})));

    final labelFinder = find.text('Tap!');
    final labelWidget = tester.widget<Text>(labelFinder);
    final style = labelWidget.style;

    expect(labelFinder, findsOneWidget);
    expect(style?.fontSize, 17);
    expect(style?.color, Colors.white);
  });

  testWidgets('ZoomButtonWidget the button set background color',
      (tester) async {
    await tester.pumpWidget(
        MaterialApp(home: ZoomButtonWidget(label: 'Tap!', onPressed: () {})));

    final labelFinder = find.text('Tap!');
    final buttonFinder = find.byType(ElevatedButton);
    final buttonWidget = tester.widget<ElevatedButton>(buttonFinder);
    final style = buttonWidget.style;
    final materialStateProperty = style?.backgroundColor;

    final backgroundColor = (materialStateProperty?.resolve({}));

    expect(backgroundColor, ColorUtil.blueColor);
    expect(labelFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
  });

  testWidgets('ZoomButtonWidget the button set minimum size', (tester) async {
    await tester.pumpWidget(
        MaterialApp(home: ZoomButtonWidget(label: 'Tap!', onPressed: () {})));

    final labelFinder = find.text('Tap!');
    final buttonFinder = find.byType(ElevatedButton);
    final buttonWidget = tester.widget<ElevatedButton>(buttonFinder);
    final style = buttonWidget.style;
    final materialStateProperty = style?.minimumSize;

    final size = (materialStateProperty?.resolve({}));

    expect(size?.width, double.infinity);
    expect(size?.height, 50);
    expect(labelFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
  });

  testWidgets('ZoomButtonWidget the button set shape', (tester) async {
    await tester.pumpWidget(
        MaterialApp(home: ZoomButtonWidget(label: 'Tap!', onPressed: () {})));

    final labelFinder = find.text('Tap!');
    final buttonFinder = find.byType(ElevatedButton);
    final buttonWidget = tester.widget<ElevatedButton>(buttonFinder);
    final style = buttonWidget.style;
    final materialStateProperty = style?.shape;

    final roundedShape =
        (materialStateProperty?.resolve({})) as RoundedRectangleBorder?;

    expect(roundedShape?.borderRadius, BorderRadius.circular(30));
    expect(labelFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);
  });
}
