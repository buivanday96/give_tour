import 'package:flutter/material.dart';
import 'package:give_tour_app/screens/tournament_tabs/competitors/widget/item_team_widget.dart';
import 'package:give_tour_app/widgets/label_left_widget.dart';

import '../../../widgets/footer_widget.dart';

class TournamentCompetitor extends StatefulWidget {
  const TournamentCompetitor({super.key});

  @override
  State<TournamentCompetitor> createState() => _TournamentCompetitorState();
}

class _TournamentCompetitorState extends State<TournamentCompetitor> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 32),
                child: LeftLabelWidget(
                  label: 'There are 6 couples',
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 48),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const ItemTeamWidget();
                },
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              FooterWidget(),
            ],
          ),
        )
      ],
    );
  }
}
