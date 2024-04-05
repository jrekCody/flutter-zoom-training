import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/utils/color_util.dart';
import 'package:flutter_zoom/widgets/zoom_feature_button_widget.dart';

void main() {
  testWidgets(
      'ZoomControllerSwitchWidget with label Join Meeting and onPressed is empty',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: ZoomFeatureButtonWidget(
      icon: Icons.add_box_rounded,
      label: 'Join Meeting',
      onPressed: () {},
    )));

    final labelFinder = find.text('Join Meeting');
    expect(labelFinder, findsOneWidget);
  });

  testWidgets(
      'ZoomControllerSwitchWidget with label Join Meeting and onPressed is tapped',
      (tester) async {
    bool wasPressed = false;
    await tester.pumpWidget(MaterialApp(
        home: ZoomFeatureButtonWidget(
      icon: Icons.add_box_rounded,
      label: 'Join Meeting',
      onPressed: () => wasPressed = true,
    )));

    await tester.tap(find.byType(GestureDetector));

    final labelFinder = find.text('Join Meeting');

    expect(labelFinder, findsOneWidget);
    expect(wasPressed, true);
  });

  testWidgets('ZoomFeatureButtonWidget set text label color', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: ZoomFeatureButtonWidget(
      icon: Icons.add_box_rounded,
      label: 'Join Meeting',
      onPressed: () {},
    )));

    final labelFinder = find.text('Join Meeting');
    final labelWidget = tester.widget<Text>(labelFinder);
    final style = labelWidget.style;

    expect(labelFinder, findsOneWidget);
    expect(style?.color, Colors.grey);
  });

  testWidgets('ZoomFeatureButtonWidget set icon, color, size', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ZoomFeatureButtonWidget(
        icon: Icons.add_box_rounded,
        label: 'Join Meeting',
        onPressed: () {},
      ),
    ));

    final labelFinder = find.text('Join Meeting');
    final iconFinder = find.byIcon(Icons.add_box_rounded);
    final iconWidget = tester.widget<Icon>(iconFinder);

    expect(labelFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
    expect(iconWidget.color, Colors.white);
    expect(iconWidget.size, 30);
  });

  testWidgets('ZoomFeatureButtonWidget has correct number of children',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ZoomFeatureButtonWidget(
        icon: Icons.add_box_rounded,
        label: 'Join Meeting',
        onPressed: () {},
      ),
    ));

    final columnFinder = find.byType(Column);
    final columnWidget = tester.widget<Column>(columnFinder);

    expect(columnWidget.children.length, 2);
  });

  testWidgets('ZoomFeatureButtonWidget has correct  decoration',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ZoomFeatureButtonWidget(
        icon: Icons.add_box_rounded,
        label: 'Join Meeting',
        onPressed: () {},
      ),
    ));

    final containerFinder = find.byType(Container);
    final containerWidget = tester.widget<Container>(containerFinder);
    final decoration = containerWidget.decoration as BoxDecoration;

    expect(decoration.color, ColorUtil.blueColor);
    expect(decoration.borderRadius, BorderRadius.circular(16));
  });
}
