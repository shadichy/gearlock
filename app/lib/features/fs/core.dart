import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';
import 'package:gearlock/features/fs/backup.dart';
import 'package:gearlock/features/fs/restore.dart';
import 'package:gearlock/features/fs/resize.dart';
import 'package:gearlock/features/fs/wipe.dart';
import 'package:animations/animations.dart';

enum FsPageMode {
  backup,
  restore,
  resize,
  wipe;
}

class FsCore extends StatefulWidget {
  final FsPageMode mode;
  const FsCore({
    super.key,
    required this.mode,
  });

  @override
  State<FsCore> createState() => _FsCoreState();
}

class _FsCoreState extends State<FsCore> {
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    int getPage() {
      switch (widget.mode) {
        case FsPageMode.backup:
          return 0;
        case FsPageMode.restore:
          return 1;
        case FsPageMode.resize:
          return 2;
        case FsPageMode.wipe:
          return 3;
      }
    }

    currentIndex = getPage();
  }

  final List<Widget> defaultRoutes = const [
    FsBackup(),
    FsRestore(),
    FsResize(),
    FsWipe()
  ];

  @override
  Widget build(BuildContext context) {
    return SingleRoute(
      navBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.data_array),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
      ),
      children: [
        PageTransitionSwitcher(
          transitionBuilder: (child, anim1, anim2) => FadeThroughTransition(
            animation: anim1,
            secondaryAnimation: anim2,
            child: child,
          ),
          child: defaultRoutes[currentIndex],
        ),
      ],
    );
  }
}
