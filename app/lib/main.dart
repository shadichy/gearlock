import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gearlock/home/about.dart';
import 'package:gearlock/core/global_widgets.dart';
import 'package:gearlock/home/home.dart';
import 'package:gearlock/core/glnotfound.dart';
import 'package:gearlock/home/pkglist.dart';
import 'package:gearlock/home/sysinfo.dart';
import 'package:gearlock/core/default_prefs.dart' as defaults;
import 'package:animations/animations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final brandColor = Color(prefs.getInt("appTheme") ?? defaults.color);
  
  bool hasGearLock = true;
  // Process.runSync('sh', ['-c', '[ -x "/gearlock/init-chroot" ]']).exitCode == 0;
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MediaQuery(
      data: const MediaQueryData(),
      child: DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? dark) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && dark != null) {
          lightColorScheme = lightDynamic.harmonized().copyWith();
          lightColorScheme = lightColorScheme.copyWith(secondary: brandColor);
          darkColorScheme = dark.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(seedColor: brandColor);
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: brandColor,
            brightness: Brightness.dark,
          );
        }
        return MaterialApp(
          title: "GearLock",
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // Default
            Locale('ar'),
            Locale('vi'),
            Locale('zh'),
          ],
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme.copyWith(),
            textTheme: GoogleFonts.comfortaaTextTheme(),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            textTheme: GoogleFonts.comfortaaTextTheme(),
          ),
          themeMode: ThemeMode.light,
          home: hasGearLock ? const MainClass() : const NoGearLock(),
        );
      }),
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

  int _selectedTab = 0;
  List<GearStatefulWidget> defaultRoutes = [];
  List<GearPage> lastVisited = [];

  void callbackAdd(GearStatefulWidget page) {
    setState(() {
      lastVisited.add(GearPage(
        tab: _selectedTab,
        page: page,
      ));
    });
    // print(lastVisited);
  }

  void _onItemTapped(int t) {
    setState(() {
      _selectedTab = t;
      if (t == 0) {
        lastVisited.clear();
      }
    });
    callbackAdd(defaultRoutes[_selectedTab]);
  }

  // void goBack(int t) {
  //   if (t == 0) lastVisited.clear();
  //   lastVisited.add(t);
  // }

  void callGoBack() {
    setState(() {
      lastVisited.removeLast();
      if (lastVisited.isNotEmpty) _selectedTab = lastVisited.last.tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    defaultRoutes = [
      HomeScreen(callbackAdd: callbackAdd, callGoBack: callGoBack),
      SysInfoScreen(callbackAdd: callbackAdd, callGoBack: callGoBack),
      PkgList(callbackAdd: callbackAdd, callGoBack: callGoBack),
      AboutPage(callbackAdd: callbackAdd, callGoBack: callGoBack),
    ];
    GearPage homePage = GearPage(tab: 0, page: defaultRoutes[0]);
    lastVisited.isEmpty ? lastVisited.add(homePage) : lastVisited[0] = homePage;
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
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
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedTab,
        onDestinationSelected: _onItemTapped,
        destinations: <NavigationDestination>[
          NavigationDestination(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.android),
            label: AppLocalizations.of(context)!.system,
          ),
          NavigationDestination(
            icon: const Icon(Icons.widgets_outlined),
            label: AppLocalizations.of(context)!.package,
          ),
          NavigationDestination(
            icon: const Icon(Icons.info_outlined),
            label: AppLocalizations.of(context)!.about,
          ),
        ],
      ),
    );
  }
}
