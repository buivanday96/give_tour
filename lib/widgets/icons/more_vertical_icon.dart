import 'package:flutter/material.dart';

class MoreVerticalButton extends StatelessWidget {
  const MoreVerticalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: IconButton(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 0, right: 0),
        onPressed: () {},
        icon: Icon(Icons.adaptive.more),
        // constraints: BoxConstraints.tight(const Size(14, 14)),
      ),
    );
  }
}
