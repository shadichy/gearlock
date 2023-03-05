import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gearlock/about.dart';
import 'package:gearlock/home.dart';
import 'package:gearlock/glnotfound.dart';
import 'package:gearlock/pkglist.dart';
import 'package:gearlock/sysinfo.dart';
import 'package:animations/animations.dart';

void main() {
  String xarg = "/system/bin/sh";
  // String xarg = "/gearlock/init-chroot";
  bool hasGearLock =
      Process.runSync('sh', ['-c', '[ -x "$xarg" ]']).exitCode == 0;
  runApp(
    MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        home: hasGearLock ? const MainClass() : const NoGearLock(),
      ),
    ),
  );
}

class MainClass extends StatefulWidget {
  const MainClass({
    super.key,
  });

  @override
  State<MainClass> createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedTab = 0;
  List<int> lastVisited = [0];

  List<Widget> routes = const [
    HomeScreen(),
    SysInfoScreen(),
    PkgList(),
    AboutPage(),
  ];
  void onItemTapped(int t, {bool goBack = false}) async {
    setState(() {
      _selectedTab = t;
    });
    if (!goBack) {
      if (t == 0) lastVisited.clear();
      lastVisited.add(t);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: WillPopScope(
        onWillPop: () async {
          lastVisited.removeLast();
          if (lastVisited.isEmpty) return true;
          onItemTapped(lastVisited.last, goBack: true);
          return false;
        },
        child: PageTransitionSwitcher(
          transitionBuilder: (child, anim1, anim2) => FadeThroughTransition(
            animation: anim1,
            secondaryAnimation: anim2,
            child: child,
          ),
          child: routes[_selectedTab],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.android),
            label: 'System',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            label: 'Package',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outlined),
            label: 'About',
          ),
        ],
        selectedFontSize: 12.0,
        unselectedFontSize: 10.0,
        selectedItemColor: const Color(0xff536dfe),
        unselectedItemColor: const Color(0xff929292),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 0,
        onTap: onItemTapped,
      ),
    );
  }
}
