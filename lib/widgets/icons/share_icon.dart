import 'package:flutter/material.dart';

import 'package:fluttericon/font_awesome5_icons.dart';

class ShareIconWidget extends StatelessWidget {
  const ShareIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        FollowButton(),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: ShareButton(),
        ),
      ],
    );
  }
}

class FollowButton extends StatelessWidget {
  const FollowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(
        FontAwesome5.thumbs_up,
        size: 8,
      ),
      label: const Text(
        'Follow',
      ),
      style: TextButton.styleFrom(
          padding: const EdgeInsets.only(left: 5, right: 5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          maximumSize: const Size(150, 45),
          minimumSize: const Size(50, 20),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 10)),
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 30,
      child: IconButton(
          iconSize: 14,
          onPressed: () {},
          padding: const EdgeInsets.only(left: 5),
          icon: const Icon(
            FontAwesome5.share_square,
          )),
    );
  }
}
