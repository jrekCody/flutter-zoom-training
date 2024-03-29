import 'package:flutter/material.dart';

class ZoomFeatureButtonWidget extends StatelessWidget {
  const ZoomFeatureButtonWidget({
    required this.icon,
    required this.label,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _buildFeatureButton(),
          Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      );

  Widget _buildFeatureButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff0E72EC),
              borderRadius: BorderRadius.circular(16),
            ),
            width: 60,
            height: 60,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      );
}
