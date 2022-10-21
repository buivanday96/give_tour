import 'package:flutter/material.dart';

class TextIconWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final double size;
  const TextIconWidget({super.key, required this.text, required this.icon, this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: size,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 4, bottom: 4),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
