import 'package:flutter/material.dart';

class WdlWidget extends StatelessWidget {
  final MatchResult matchResult;
  const WdlWidget({super.key, required this.matchResult});

  const factory WdlWidget.win() = _WinLabelWidget;
  const factory WdlWidget.draw() = _DrawLabelWidget;
  const factory WdlWidget.lose() = _LoseLabelWidget;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _LabelBase extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  const _LabelBase({required this.text, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 24, minWidth: 16),
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class _WinLabelWidget extends WdlWidget {
  const _WinLabelWidget() : super(matchResult: MatchResult.win);

  @override
  Widget build(BuildContext context) {
    return const _LabelBase(text: 'W', backgroundColor: Colors.green);
  }
}

class _DrawLabelWidget extends WdlWidget {
  const _DrawLabelWidget() : super(matchResult: MatchResult.draw);

  @override
  Widget build(BuildContext context) {
    return const _LabelBase(text: 'D', backgroundColor: Colors.lightBlue);
  }
}

class _LoseLabelWidget extends WdlWidget {
  const _LoseLabelWidget() : super(matchResult: MatchResult.lose);
  @override
  Widget build(BuildContext context) {
    return const _LabelBase(text: 'L', backgroundColor: Color.fromARGB(255, 13, 71, 161));
  }
}

enum MatchResult {
  win,
  draw,
  lose,
  none,
}
