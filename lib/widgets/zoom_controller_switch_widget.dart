import 'package:flutter/material.dart';

class ZoomControllerSwitchWidget extends StatelessWidget {
  const ZoomControllerSwitchWidget({
    required this.label,
    required this.onChanged,
    required this.switchValue,
    super.key,
  });

  final String label;
  final Function(bool)? onChanged;
  final bool switchValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: const Color(0xff2e2e2e),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Switch.adaptive(value: switchValue, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
