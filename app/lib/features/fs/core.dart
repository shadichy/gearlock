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
  int _selectedTab = 0;
  List<int> lastVisited = [];
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

    _selectedTab = getPage();
    lastVisited.add(_selectedTab);
  }

  void _onItemTapped(int t) {
    setState(() {
      _selectedTab = t;
      if (t == 0) {
        lastVisited.clear();
      }
      lastVisited.add(t);
      print(lastVisited);
      print(_selectedTab);
    });
  }

  final List<StatefulWidget> defaultRoutes = const [
    FsBackup(),
    FsRestore(),
    FsResize(),
    FsWipe()
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Container(),
      Container(),
      Container(),
      SizedBox(
        height: 40,
        child: PageTransitionSwitcher(
          transitionBuilder: (child, anim1, anim2) => FadeThroughTransition(
            animation: anim1,
            secondaryAnimation: anim2,
            child: child,
          ),
          child: defaultRoutes[_selectedTab],
        ),
      ),
    ];
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedTab,
        onDestinationSelected: _onItemTapped,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.data_array),
            label: "Backup",
          ),
          NavigationDestination(
            icon: Icon(Icons.data_array),
            label: "Restore",
          ),
          NavigationDestination(
            icon: Icon(Icons.data_array),
            label: "Resize",
          ),
          NavigationDestination(
            icon: Icon(Icons.data_array),
            label: "Wipe",
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          setState(() {
            lastVisited.removeLast();
            if (lastVisited.isNotEmpty) _selectedTab = lastVisited.last;
          });
          if (lastVisited.isEmpty) return true;
          return false;
        },
        child: ListView.builder(
          itemCount: children.length,
          itemBuilder: (context, index) {
            return children[index];
          },
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
