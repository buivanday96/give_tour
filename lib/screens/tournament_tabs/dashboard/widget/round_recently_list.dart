import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../widgets/buttons/viewfull_button.dart';

class RoundRecentlyList extends StatelessWidget {
  final int itemCount;
  const RoundRecentlyList({
    Key? key,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      //padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: ListView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == itemCount - 1) {
            return Container(
              padding: const EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              child: ViewFullButton(
                onTap: () {},
              ),
            );
          }

          return _item(context: context, index: index);
        },
      ),
    );
  }

  _item({required BuildContext context, required int index, String? result}) {
    return Container(
      margin: EdgeInsets.only(
          left: 24, top: index == 0 ? 18 : 10, bottom: index == itemCount - 2 ? 0 : 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _nameLogoTeam(context: context),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Opacity(
              opacity: result != null ? 1 : 0,
              child: Text(
                result ?? '0-0',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          _nameLogoTeam(context: context, textDirection: TextDirection.ltr),
        ],
      ),
    );
  }

  _nameLogoTeam({required BuildContext context, TextDirection textDirection = TextDirection.rtl}) {
    return Directionality(
      textDirection: textDirection,
      child: Row(
        children: [
          Assets.images.team.image(height: 20, width: 20),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Text(
              'name'.toUpperCase(),
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
