import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(
        // color: Theme.of(context).appBarTheme.iconTheme.color,
        onPressed: () {},
      ),
      title: Center(
        child: Assets.images.givetourInvert.image(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppbarSliverWidget extends StatefulWidget {
  final bool innerBoxIsScrolled;
  final PreferredSizeWidget bottom;
  final Widget? flexibleSpace;
  final double collapsedHeight;
  final bool isShrink;
  const AppbarSliverWidget({
    super.key,
    required this.innerBoxIsScrolled,
    required this.bottom,
    this.flexibleSpace,
    this.collapsedHeight = 200,
    this.isShrink = true,
  });

  @override
  State<AppbarSliverWidget> createState() => _AppbarSliverWidgetState();
}

class _AppbarSliverWidgetState extends State<AppbarSliverWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: BackButton(
        // color: Theme.of(context).appBarTheme.iconTheme.color,
        onPressed: () {},
      ),

      //title: isShrink ? const Text('SS League') : null,
      pinned: true,
      snap: false,
      floating: false,
      stretch: true,
      forceElevated: widget.innerBoxIsScrolled,
      bottom: widget.bottom,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        // title: widget.isShrink ? const Text('SS League') : const Text(''),
        background: widget.flexibleSpace,
      ),
      expandedHeight: widget.collapsedHeight,
    );
  }
}
