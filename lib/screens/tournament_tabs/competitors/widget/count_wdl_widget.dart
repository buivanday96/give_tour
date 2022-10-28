import 'package:flutter/material.dart';

class LabelBase extends StatelessWidget {
  final int number;
  final String text;
  final Color color;

  const LabelBase({
    super.key,
    required this.number,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$number $text',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class CountWDLWidget extends StatelessWidget {
  final int count;
  const CountWDLWidget({super.key, required this.count});

  const factory CountWDLWidget.win({required int count}) = _CountWinWidget;
  const factory CountWDLWidget.draw({required int count}) = _CountDrawWidget;
  const factory CountWDLWidget.lose({required int count}) = _CountLoseWidget;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _CountWinWidget extends CountWDLWidget {
  const _CountWinWidget({required super.count});

  @override
  Widget build(BuildContext context) {
    return LabelBase(
      number: count,
      text: 'win',
      color: Colors.green,
    );
  }
}

class _CountDrawWidget extends CountWDLWidget {
  const _CountDrawWidget({required super.count});

  @override
  Widget build(BuildContext context) {
    return LabelBase(
      number: count,
      text: 'draw',
      color: Colors.orange,
    );
  }
}

class _CountLoseWidget extends CountWDLWidget {
  const _CountLoseWidget({required super.count});

  @override
  Widget build(BuildContext context) {
    return LabelBase(
      number: count,
      text: 'lose',
      color: Colors.red,
    );
  }
}
