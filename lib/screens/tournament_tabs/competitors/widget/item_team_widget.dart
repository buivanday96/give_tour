import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/material.dart';
import 'package:give_tour_app/gen/assets.gen.dart';
import 'package:give_tour_app/screens/tournament_tabs/competitors/widget/count_wdl_widget.dart';

class ItemTeamWidget extends StatelessWidget {
  const ItemTeamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, top: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: CircleAvatar(
              radius: 32,
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text('NAME, NAME'.toUpperCase()),
          ),
          //
          const Text(
            '0 match played',
            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CountWDLWidget.win(count: 2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: CountWDLWidget.draw(count: 1),
              ),
              CountWDLWidget.lose(count: 3),
            ],
          ),
          //
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Memnbers',
              style: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
            ),
          ),
          //
          AvatarStack(
            height: 60,
            width: 60 * 2,
            avatars: [
              Assets.images.single.provider(),
              Assets.images.single.provider(),
            ],
          ),
        ],
      ),
    );
  }
}
