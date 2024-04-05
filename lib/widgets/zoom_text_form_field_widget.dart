import 'package:flutter/material.dart';
import 'package:flutter_zoom/utils/color_util.dart';

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
    return Material(
      child: TextFormField(
        maxLines: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: ColorUtil.lightGreyColor,
          filled: true,
          border: InputBorder.none,
          hintText: hint,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
