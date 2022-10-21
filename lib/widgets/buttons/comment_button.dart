import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';


class CommentButton extends StatelessWidget {
  const CommentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(FontAwesome5.comments),
      label: const Text('Comments'),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.only(left: 16, right: 16),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
