import 'package:flutter/material.dart';

class LeftLabelWidget extends StatelessWidget {
  final String label;
  const LeftLabelWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          label,
          textAlign: TextAlign.start,
          style: const TextStyle(fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}
