import 'package:flutter/material.dart';

class ZoomTextFormFieldWidget extends StatelessWidget {
  const ZoomTextFormFieldWidget({
    required this.hint,
    required this.onChanged,
    super.key,
  });

  final String hint;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        fillColor: const Color(0xff2e2e2e),
        filled: true,
        border: InputBorder.none,
        hintText: hint,
      ),
      onChanged: onChanged,
    );
  }
}
