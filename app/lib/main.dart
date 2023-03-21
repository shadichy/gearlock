import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gearlock/about.dart';
import 'package:gearlock/global_widgets.dart';
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

class GearPage {
  final int tab;
  final GearStatefulWidget page;
  const GearPage({
    required this.tab,
    required this.page,
  });
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

  void callbackAdd(GearStatefulWidget page) {
    if (checkProg()) {
      setState(() {
        lastVisited.add(GearPage(
          tab: _selectedTab,
          page: page,
        ));
      });
    }
    // print(lastVisited);
  }

  int _selectedTab = 0;
  List<GearStatefulWidget> defaultRoutes = [];
  List<GearPage> lastVisited = [];

  void onItemTapped(int t) {
    if (checkProg()) {
      setState(() {
        _selectedTab = t;
      });
      callbackAdd(defaultRoutes[_selectedTab]);
    }
  }

  // void goBack(int t) {
  //   if (t == 0) lastVisited.clear();
  //   lastVisited.add(t);
  // }
  bool checkProg() {
    return lastVisited.last.page.isFininshed;
  }

  void callGoBack() {
    if (checkProg()) {
      setState(() {
        lastVisited.removeLast();
        if (lastVisited.isNotEmpty) _selectedTab = lastVisited.last.tab;
      });
    } else {
      lastVisited.last.page.handleBack();
    }
  }

  @override
  Widget build(BuildContext context) {
    defaultRoutes = [
      HomeScreen(
        callbackAdd: callbackAdd,
        callGoBack: callGoBack,
        preventBack: () {},
      ),
      SysInfoScreen(
        callbackAdd: callbackAdd,
        callGoBack: callGoBack,
        preventBack: () {},
      ),
      PkgList(
        callbackAdd: callbackAdd,
        callGoBack: callGoBack,
        preventBack: () {},
      ),
      AboutPage(
        callbackAdd: callbackAdd,
        callGoBack: callGoBack,
        preventBack: () {},
      ),
    ];
    GearPage homePage = GearPage(tab: 0, page: defaultRoutes[0]);
    lastVisited.isEmpty ? lastVisited.add(homePage) : lastVisited[0] = homePage;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: WillPopScope(
        onWillPop: () async {
          callGoBack();
          if (lastVisited.isEmpty) return true;
          return false;
        },
        child: PageTransitionSwitcher(
          transitionBuilder: (child, anim1, anim2) => FadeThroughTransition(
            animation: anim1,
            secondaryAnimation: anim2,
            child: child,
          ),
          child: lastVisited[lastVisited.length - 1].page,
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
