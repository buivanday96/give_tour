import 'package:flutter/material.dart';
import 'package:give_tour_app/screens/tournament_tabs/dashboard/widget/round_recently_list.dart';
import 'package:give_tour_app/screens/tournament_tabs/dashboard/widget/top_standings_list.dart';
import 'package:give_tour_app/widgets/buttons/comment_button.dart';
import 'package:give_tour_app/widgets/buttons/schedule_button.dart';
import 'package:give_tour_app/widgets/footer_widget.dart';

class TournamentDashboard extends StatefulWidget {
  const TournamentDashboard({super.key});

  @override
  State<TournamentDashboard> createState() => _TournamentDashboardState();
}

class _TournamentDashboardState extends State<TournamentDashboard> {
  final int itemCount = 4;
  final int currentRound = 1;
  final int itemCountRound = 5;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              _commentSchedule(),

              // Label Top standings.
              _label(label: 'TOP STANDINGS'),
              // List top standings.

              TopStandingsList(
                itemCount: itemCount,
              ),

              _label(label: 'ROUND $currentRound'),

              const RoundRecentlyList(
                itemCount: 5,
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

  Widget _commentSchedule() {
    return Padding(
      padding: const EdgeInsets.only(top: 56, bottom: 32),
      child: Row(
        children: const [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 8),
              child: CommentButton(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8, right: 16),
              child: ScheduleButton(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _label({String label = ''}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          label,
          textAlign: TextAlign.start,
          style: const TextStyle(fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}
