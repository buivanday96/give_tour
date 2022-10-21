import 'package:boxy/boxy.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../../gen/assets.gen.dart';
import '../../widgets/icons/share_icon.dart';
import '../../widgets/icons/text_icon.dart';

class TournamentInfoWidget extends StatefulWidget {
  final BuildContext context;
  final List<Tab> tabs;
  final TabController tabController;
  final Function(double)? setExpandedHeight;

  const TournamentInfoWidget({
    Key? key,
    required this.context,
    required this.tabs,
    required this.tabController,
    this.setExpandedHeight,
  }) : super(key: key);

  @override
  State<TournamentInfoWidget> createState() => _TournamentInfoWidgetState();

  // @override
  // Size get preferredSize => Size.fromHeight(MediaQuery.of(context).size.height * 2 / 5);
}

class _TournamentInfoWidgetState extends State<TournamentInfoWidget> {
  int currentRound = 0;
  int totalRound = 30;

  int totalMember = 6;
  int totalViewer = 67;

  String address =
      'Rounds (Round robin) | Badminton | Thanh Vo | Sân Vy Sport, Phan Văn Trị, Phường 5, Q. Gò Vấp, Tp. HCM';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox.fromSize(
            size: const Size.fromHeight(kToolbarHeight),
          ),
          customBoxy(),
        ],
      ),
    );
  }

  Widget backGround() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Assets.images.banner.path),
        ),
      ),
    );
  }

  Widget overPlay() {
    return Container(
      color: Colors.black.withOpacity(0.75),
    );
  }

  Widget customBoxy() {
    return CustomBoxy(
      delegate: _MyBoxy(setExpandedHeight: widget.setExpandedHeight),
      children: [
        BoxyId(id: #background, child: backGround()),
        BoxyId(id: #overPlay, child: overPlay()),
        BoxyId(id: #mainLayout, child: mainLayout()),
      ],
    );
  }

  Widget mainLayout() {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Icon 3 chấm
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(left: 24, right: 24),
                //child: const MoreVerticalButton(),
              ),
            ),

            // Avatar
            const CircleAvatar(
              radius: 40,
            ),

            // Buton like, share
            Expanded( 
              child: Container(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: const ShareIconWidget(),
              ),
            ),
          ],
        ),

        // Line 2
        const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'SS League 2022',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        // Line 3
        Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              address,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w200),
            ),
          ),
        ),

        // Line 4
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 33 / 100,
          child: Column(
            children: [
              // Proccessing
              Stack(
                children: [
                  // Tiến trình ngang
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: currentRound / totalRound,
                      minHeight: 10,
                    ),
                  ),

                  // Só tiến trình
                  Positioned.fill(
                    child: Text(
                      '$currentRound/$totalRound',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              // Info member and user
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextIconWidget(text: '$totalMember', icon: FontAwesome5.user),
                  TextIconWidget(text: '$totalViewer', icon: FontAwesome5.eye),
                ],
              ),
            ],
          ),
        ),

        //
        Opacity(
          opacity: 0,
          child: SizedBox(
            child: TabBar(
              tabs: widget.tabs,
              isScrollable: true,
              //labelStyle: TextStyle(fontSize: 10),
              controller: widget.tabController,

              onTap: (pos) {
                //ColoredPrint.log('on tap $pos');
              },
            ),
          ),
        )
      ],
    );

    //Line 1
  }

  //end
}

class _MyBoxy extends BoxyDelegate {
  final Function(double)? setExpandedHeight;

  _MyBoxy({this.setExpandedHeight});
  @override
  Size layout() {
    final backround = getChild(#background);
    final overPlay = getChild(#overPlay);
    final mainLayout = getChild(#mainLayout);
    mainLayout.layout(constraints);

    backround.layout(BoxConstraints.tight(mainLayout.size));
    overPlay.layout(BoxConstraints.tight(mainLayout.size));

    setExpandedHeight!(mainLayout.size.height);

    return mainLayout.size;
  }
}
