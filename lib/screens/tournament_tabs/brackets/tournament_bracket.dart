import 'dart:math';

import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:give_tour_app/widgets/footer_widget.dart';
import 'package:give_tour_app/widgets/logo_name_widget.dart';

class TournamentBracket extends StatefulWidget {
  const TournamentBracket({super.key});

  @override
  State<TournamentBracket> createState() => _TournamentBracketState();
}

class _TournamentBracketState extends State<TournamentBracket> {
  int currentRound = 1;
  final int itemCountRound = 13;
  final int itemCountCurrentRound = 13;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              _rounds(),
              _matches(),
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

  _rounds() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: LimitedBox(
        maxHeight: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Text(
                'Round'.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            Expanded(
              child: AdaptiveScrollbar(
                controller: _scrollController,
                width: 5,
                sliderHeight: 60,
                position: ScrollbarPosition.bottom,
                underColor: Colors.transparent,
                sliderActiveColor: Theme.of(context).colorScheme.primary,
                sliderDefaultColor: Theme.of(context).colorScheme.primary,
                underSpacing: const EdgeInsets.only(
                  right: 16,
                  left: 1,
                ),
                sliderSpacing: EdgeInsets.zero,
                child: ListView.builder(
                  itemCount: itemCountRound,
                  controller: _scrollController,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _itemRound(context, index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _matches() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: ListView.builder(
        itemCount: itemCountCurrentRound,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: ((context, index) {
          return _itemMatch(context, index);
        }),
      ),
    );
  }

  _itemRound(BuildContext context, int index) {
    Color bgColor =
        index == currentRound - 1 ? Theme.of(context).colorScheme.primary : Colors.white;
    Color textColor =
        index != currentRound - 1 ? Theme.of(context).colorScheme.primary : Colors.white;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        margin: const EdgeInsets.only(bottom: 4, top: 4),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: TextButton(
            onPressed: () {
              setState(() {
                currentRound = index + 1;
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: bgColor,
              tapTargetSize: MaterialTapTargetSize.padded,
              shape: const CircleBorder(),
            ),
            child: Text(
              '${index + 1}',
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _itemMatch(BuildContext context, int index) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8, top: (index != 0 ? 8 : 0)),
              child: const CircleAvatar(
                backgroundColor: Colors.grey,
                maxRadius: 8,
              ),
            ),
            Text('Round $currentRound'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoNameWidget(),
            _score(Random().nextInt(10), Random().nextInt(10)),
            const LogoNameWidget(
              textDirection: TextDirection.rtl,
            )
          ],
        ),
        index != itemCountCurrentRound - 1
            ? Divider(
                height: 20,
                indent: 0,
                thickness: 1.5,
                endIndent: 1,
                color: Colors.grey[400],
              )
            : const SizedBox(),
      ],
    );
  }

  _score(int? scoreA, int? scoreB) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text('${scoreA ?? ''} - ${scoreB ?? ' '}'),
    );
  }
}
