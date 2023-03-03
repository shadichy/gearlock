import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gearlock/about.dart';
import 'package:gearlock/home.dart';
import 'package:gearlock/glnotfound.dart';
import 'package:gearlock/pkglist.dart';
import 'package:gearlock/sysinfo.dart';

void main() {
  String xarg = "/system/bin/sh";
  // String xarg = "/gearlock/init-chroot";
  bool hasGearLock =
      Process.runSync('sh', ['-c', '[ -x "$xarg" ]']).exitCode == 0;
  runApp(
    MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) =>
              hasGearLock ? const HomeScreen() : const NoGearLock(),
          "/sysinfo": (context) => const SysInfoScreen(),
          "/pkglist": (context) => const PkgList(),
          "/about": (context) => const AboutPage(),
        },
      ),
    ),
  );
}
