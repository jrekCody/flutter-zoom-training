import 'package:flutter/material.dart';
import 'package:flutter_zoom/utils/color_util.dart';

class ZoomButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ZoomButtonWidget({
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorUtil.blueColor,
          minimumSize: const Size(
            double.infinity,
            50,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}
