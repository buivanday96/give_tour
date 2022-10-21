import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../widgets/buttons/viewfull_button.dart';

class TopStandingsList extends StatelessWidget {
  final int itemCount;
  const TopStandingsList({
    super.key,
    required this.itemCount,
  });

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

  _item({required BuildContext context, required int index}) {
    return Container(
      margin: EdgeInsets.only(
          left: 24, top: index == 0 ? 18 : 10, bottom: index == itemCount - 2 ? 0 : 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              '${index + 1}',
              style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
            ),
          ),
          SizedBox(
            width: 20,
            height: 20,
            child: Assets.images.team.image(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                'name'.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  overflow: TextOverflow.ellipsis,
                  color: Theme.of(context).primaryColor,
                  fontSize: 12.5,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              '${index + 3} pts',
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
