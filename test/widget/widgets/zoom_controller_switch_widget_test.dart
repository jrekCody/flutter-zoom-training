import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/utils/color_util.dart';
import 'package:flutter_zoom/widgets/zoom_controller_switch_widget.dart';

void main() {
  testWidgets(
      'ZoomControllerSwitchWidget with label Click me! and onPressed is empty',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: ZoomControllerSwitchWidget(
      label: 'Switch me!',
      onChanged: (val) {},
      switchValue: true,
    )));

    final labelFinder = find.text('Switch me!');
    expect(labelFinder, findsOneWidget);
  });

  testWidgets('ZoomControllerSwitchWidget switch changes value when tapped',
      (tester) async {
    bool switched = false;
    await tester.pumpWidget(MaterialApp(
      home: ZoomControllerSwitchWidget(
        label: 'Switch me!',
        onChanged: (val) => switched = val,
        switchValue: switched,
      ),
    ));

    await tester.tap(find.byType(Switch));

    final labelFinder = find.text('Switch me!');
    expect(labelFinder, findsOneWidget);
    expect(switched, isTrue);
  });

  testWidgets('ZoomButtonWidget set label height and background color',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: ZoomControllerSwitchWidget(
      label: 'Switch me!',
      onChanged: (val) {},
      switchValue: true,
    )));

    final labelFinder = find.text('Switch me!');
    final containerFinder = find.byType(Container);
    final containerWidget = tester.widget<Container>(containerFinder);

    expect(labelFinder, findsOneWidget);
    expect(containerWidget.color, ColorUtil.lightGreyColor);
    expect(containerWidget.constraints?.maxHeight, 60);
  });

  testWidgets('ZoomButtonWidget set label padding horizontal', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: ZoomControllerSwitchWidget(
      label: 'Switch me!',
      onChanged: (val) {},
      switchValue: true,
    )));

    final labelFinder = find.text('Switch me!');
    final paddingFinder = find.byType(Padding);
    final paddingWidget = tester.widget<Padding>(paddingFinder);

    /// EdgeInsets.symmetric(horizontal: 10), which applies 10 padding to
    /// both the left and right, resulting in a total horizontal padding of 20.
    expect(paddingWidget.padding.horizontal, 20);
    expect(labelFinder, findsOneWidget);
  });
  testWidgets('ZoomButtonWidget set label and row main axis alignment',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: ZoomControllerSwitchWidget(
      label: 'Switch me!',
      onChanged: (val) {},
      switchValue: true,
    )));

    final labelFinder = find.text('Switch me!');
    final rowFinder = find.byType(Row);
    final rowWidget = tester.widget<Row>(rowFinder);

    expect(labelFinder, findsOneWidget);
    expect(rowWidget.mainAxisAlignment, MainAxisAlignment.spaceBetween);
  });
}
