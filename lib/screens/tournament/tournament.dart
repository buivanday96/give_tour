import 'package:flutter/material.dart';
import 'package:give_tour_app/screens/tournament/menu_drawer.dart';
import 'package:give_tour_app/screens/tournament/tournament_info.dart';
import 'package:give_tour_app/screens/tournament_tabs/brackets/tournament_bracket.dart';
import 'package:give_tour_app/screens/tournament_tabs/competitors/tournament_competitor.dart';
import 'package:give_tour_app/screens/tournament_tabs/dashboard/tournament_dashboard.dart';
import 'package:give_tour_app/screens/tournament_tabs/standings/tournament_standing.dart';
import 'package:give_tour_app/widgets/app_bar.dart';

class TournamentScreen extends StatefulWidget {
  const TournamentScreen({super.key});

  @override
  State<TournamentScreen> createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> with SingleTickerProviderStateMixin {
  final kTabPages = <Widget>[
    const TournamentDashboard(),
    // const Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    const TournamentBracket(),
    const TournamentStanding(),
    const TournamentCompetitor(),
    const Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
    const Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
    // const Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
    // const Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
  ];

  final kTabs = <Tab>[
    const Tab(
      text: 'DASHBOARD',
      //height: 5,
    ),
    const Tab(
      text: 'BRACKETS',
      //height: 5,
    ),
    const Tab(
      text: 'STANDINGS',
      //height: 5,
    ),
    const Tab(
      text: 'COMPETITORS',
      //height: 5,
    ),
    const Tab(
      text: 'STATISTICS',
      //height: 5,
    ),
    const Tab(
      text: 'ABOUT',
    ),
    // const Tab(text: 'Swift'),
    // const Tab(text: 'Rowshop'),
  ];

  late TabController tabController;
  late ScrollController scrollController;

  double collapsedHeight = 500;

  bool _lastStatus = true;

  bool get _isShrink {
    return scrollController.hasClients &&
        scrollController.offset > (collapsedHeight - kToolbarHeight);
  }

  void _scrollListener() {
    //ColoredPrint.log('$_isShrink');
    if (_isShrink != _lastStatus) {
      setState(() {
        _lastStatus = _isShrink;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: kTabs.length, vsync: this);
    scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const AppbarWidget(),
      endDrawer: const MenuDrawer(),
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            AppbarSliverWidget(
              innerBoxIsScrolled: innerBoxIsScrolled,
              collapsedHeight: collapsedHeight,
              bottom: TabBar(
                tabs: kTabs,
                isScrollable: true,
                //labelStyle: TextStyle(fontSize: 10),
                controller: tabController,

                onTap: (pos) {
                  //ColoredPrint.log('on tap $pos');
                },
              ),
              flexibleSpace: TournamentInfoWidget(
                context: context,
                tabs: kTabs,
                tabController: tabController,
                setExpandedHeight: (height) {
                  WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
                    if (mounted) {
                      setState(() {
                        collapsedHeight = height + kToolbarHeight;
                      });
                    }
                  }));
                },
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: kTabPages,
        ),
      ),
    );
  }
}
