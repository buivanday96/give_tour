import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class LogoNameWidget extends StatelessWidget {
  final TextDirection textDirection;
  final Text? name;
  const LogoNameWidget({super.key, this.textDirection = TextDirection.rtl, this.name});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: Row(
        children: [
          Assets.images.team.image(height: 20, width: 20),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Text(
              '${name ?? 'name'}'.toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                overflow: TextOverflow.ellipsis,
                color: Theme.of(context).primaryColor,
                fontSize: 12.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
