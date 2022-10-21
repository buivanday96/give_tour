import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class ViewFullButton extends StatelessWidget {
  final Function() onTap;
  const ViewFullButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w300,
        ),
        maximumSize: const Size(80, 45),
        minimumSize: const Size(60, 30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'View full',
          ),
          Icon(
            FontAwesome5.angle_right,
            size: 12,
          ),
        ],
      ),
    );
  }
}
