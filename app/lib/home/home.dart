import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gearlock/core/global_widgets.dart';
import 'package:gearlock/core/home_widgets.dart';
import 'package:gearlock/core/theme.dart';
import 'package:gearlock/features/devzone/devzone.dart';
import 'package:gearlock/features/devzone/log.dart';
import 'package:gearlock/features/google/core.dart';
import 'package:gearlock/features/hardware/core.dart';
import 'package:gearlock/features/misc/core.dart';
import 'package:gearlock/features/misc/su_handler.dart';
import 'package:gearlock/features/pkg/searchpkg.dart';
import 'package:gearlock/features/fs/core.dart';
import 'package:gearlock/features/systemmask/core.dart';
import 'package:gearlock/home/pkglist.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gearlock/settings/settings.dart';
import 'package:gearlock/settings/themes.dart';

class GearAction {
  final String title;
  final Widget icon;
  final void Function() pressed;
  const GearAction({
    required this.title,
    required this.icon,
    required this.pressed,
  });
}

class BriefSysInfo extends StatefulWidget {
  final String name;
  final String value;
  final Widget icon;
  const BriefSysInfo({
    super.key,
    required this.name,
    required this.value,
    required this.icon,
  });

  @override
  State<BriefSysInfo> createState() => _BriefSysInfoState();
}

class _BriefSysInfoState extends State<BriefSysInfo> {
  late final String name;
  late final String value;
  late final Widget icon;
  @override
  void initState() {
    super.initState();
    name = widget.name;
    value = widget.value;
    icon = widget.icon;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              value,
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          // Text(
          //   '$value',
          //   textAlign: TextAlign.start,
          //   overflow: TextOverflow.clip,
          //   style: const TextStyle(
          //     fontWeight: FontWeight.w500,
          //     fontStyle: FontStyle.normal,
          //     fontSize: 14,
          //     // color: colors.onTertiaryContainer,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class HomeScreen extends GearStatefulWidget {
  const HomeScreen({
    super.key,
    required super.callbackAdd,
    required super.callGoBack,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final void Function(GearStatefulWidget page) callbackAdd;
  late final void Function() callGoBack;

  @override
  void initState() {
    super.initState();
    callbackAdd = widget.callbackAdd;
    callGoBack = widget.callGoBack;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    void Function() goto(StatefulWidget page) => () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
    Widget homeActions(String header, List<GearAction> childItems) {
      List<Widget> children = [];
      for (var i = 0; i < childItems.length; i++) {
        children.add(ElevatedButton.icon(
          onPressed: childItems[i].pressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            // backgroundColor: colors.surface,
            // backgroundColor: colors.secondaryContainer,
            elevation: 0,
            padding: const EdgeInsets.all(8),
            minimumSize: Size(MediaQuery.of(context).size.width, 60),
            foregroundColor: colors.onPrimaryContainer,
            shadowColor: Colors.transparent,
            alignment: Alignment.centerLeft,
            shape: RoundedRectangleBorder(
              borderRadius: i == 0
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(8), topRight: Radius.circular(8))
                  : (i == childItems.length - 1)
                      ? const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))
                      : BorderRadius.zero,
            ),
          ),
          icon: childItems[i].icon,
          label: Padding(
            // padding: const EdgeInsets.all(8),
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              childItems[i].title,
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                // color: colors.onSurface,
              ),
            ),
          ),
        ));
        // if (i == childItems.length - 1) break;
        // children.add(
        //   Divider(
        //     color: colors.outlineVariant,
        //     height: 1,
        //     thickness: 1,
        //     indent: 8,
        //     endIndent: 8,
        //   ),
        // );
      }

      return Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        // alignment: Alignment.centerLeft,
        clipBehavior: Clip.hardEdge,
        // color: colors.onSurface,
        decoration: BoxDecoration(
          // color: const Color(0x00000000),
          color: colors.surfaceTint.withOpacity(0.05),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          // border: Border.all(
          // color: colors.outlineVariant,
          // width: 1,
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              header,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 18,
                color: colors.onPrimaryContainer,
              ),
            ),
            const Divider(
              color: Colors.transparent,
              height: 8,
            ),
            ...children
          ],
        ),
      );
    }

    List<BriefSysInfo> sysInfoRaw = [
      BriefSysInfo(
        name: AppLocalizations.of(context)!.androidver,
        value: 'Android ${Process.runSync("getprop", [
              "ro.build.version.release"
            ]).stdout.toString().trim()}',
        icon: Icon(
          Icons.android,
          size: 32,
          color: colors.onPrimaryContainer,
        ),
      ),
      BriefSysInfo(
        name: AppLocalizations.of(context)!.suaccess,
        value: Process.runSync("sh", ["-c", "command -v su"]).exitCode == 0
            ? Process.runSync("sh", ["-c", "su -c echo"]).exitCode == 0
                ? AppLocalizations.of(context)!.sugranted
                : AppLocalizations.of(context)!.sunotgranted
            : AppLocalizations.of(context)!.sunotfound,
        icon: Icon(
          Icons.tag,
          size: 32,
          color: colors.onPrimaryContainer,
        ),
      ),
      BriefSysInfo(
        name: AppLocalizations.of(context)!.gearlockver,
        value: "GearLock 7.4.3",
        icon: ImageIcon(
          const AssetImage("images/gearlock.png"),
          size: 32,
          color: colors.onPrimaryContainer,
        ),
      ),
    ];

    List<Widget> sysInfo = [];
    for (var i = 0; i < sysInfoRaw.length; i++) {
      sysInfo.add(sysInfoRaw[i]);
      if (i == sysInfoRaw.length - 1) break;
      sysInfo.add(const Divider(
        color: Colors.transparent,
        height: 4,
        thickness: 0,
        indent: 0,
        endIndent: 0,
      ));
    }

    List<Widget> body = [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () => callbackAdd(AppPrefs(
                callbackAdd: callbackAdd,
                callGoBack: callGoBack,
              )),
              icon: Icon(
                Icons.settings,
                color: colors.primary,
                size: 28,
              ),
              splashRadius: 24,
            ),
            topText(
                ["GEAR", "LOCK"], [colors.onPrimaryContainer, colors.primary]),
            IconButton(
              onPressed: goto(const ThemeSelector()),
              icon: SvgGen(
                primary: colors.primary,
                container: colors.primaryContainer,
                tertiary: colors.tertiaryContainer,
                size: 28,
              ),
              splashRadius: 24,
            ),
          ],
        ),
      ),
      // headingText(AppLocalizations.of(context)!.sysinfo, 0xff3f51b5),
      // Padding(
      //   padding: const EdgeInsets.only(left: 16),
      //   child: Text(
      //     "GearLock",
      //     style: TextStyle(
      //       fontSize: 45,
      //       // fontFamily: "comfortaa",
      //       // fontVariations:
      //       fontWeight: FontWeight.w500,
      //     ),
      //   ),
      // ),
      Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: colors.primaryContainer,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          // border: Border.all(
          //   color: colors.outlineVariant,
          //   width: 1,
          // ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: sysInfo,
        ),
      ),
      headingText(
        AppLocalizations.of(context)!.quickactions,
        colors.primary,
      ),
      // separaText(AppLocalizations.of(context)!.packages),
      homeActions(AppLocalizations.of(context)!.packages, [
        GearAction(
            title: AppLocalizations.of(context)!.inspkg,
            icon: const Icon(
              Icons.add,
              // color: Color(0xff212435),
              size: 24,
            ),
            pressed: () {
              callbackAdd(SearchPkg(
                callbackAdd: callbackAdd,
                callGoBack: callGoBack,
              ));
            }),
        GearAction(
          title: "${AppLocalizations.of(context)!.allpkg} (48)",
          icon: const Icon(
            Icons.widgets_outlined,
            // color: Color(0xff212435),
            size: 24,
          ),
          pressed: () {
            callbackAdd(PkgList(
              callbackAdd: callbackAdd,
              callGoBack: callGoBack,
            ));
          },
        )
      ]),
      // separaText(AppLocalizations.of(context)!.fsoperations),
      homeActions(AppLocalizations.of(context)!.fsoperations, [
        GearAction(
          title: AppLocalizations.of(context)!.fsbackup,
          icon: const Icon(
            Icons.sync,
            // // color: Color(0xff212435),
            size: 24,
          ),
          pressed: goto(const FsCore(mode: FsPageMode.backup)),
        ),
        GearAction(
          title: AppLocalizations.of(context)!.fsrestore,
          icon: const Icon(
            Icons.history,
            // color: Color(0xff212435),
            size: 24,
          ),
          pressed: goto(const FsCore(mode: FsPageMode.restore)),
        ),
        GearAction(
          title: AppLocalizations.of(context)!.fswipe,
          icon: const Icon(
            Icons.restart_alt,
            // color: Color(0xff212435),
            size: 24,
          ),
          pressed: goto(const FsCore(mode: FsPageMode.wipe)),
        ),
      ]),
      // separaText(AppLocalizations.of(context)!.tweaks),
      homeActions(AppLocalizations.of(context)!.tweaks, [
        GearAction(
          title: AppLocalizations.of(context)!.suhandler,
          icon: const Icon(
            Icons.tag,
            // color: Color(0xff212435),
            size: 24,
          ),
          pressed: goto(const SuHandler()),
        ),
        GearAction(
          title: AppLocalizations.of(context)!.google,
          icon: const ImageIcon(
            AssetImage("images/Google__G__Logo.png"),
            size: 24,
            // color: Color(0xff212435),
          ),
          pressed: goto(const GoogleStats()),
        ),
        GearAction(
          title: AppLocalizations.of(context)!.hwtweaks,
          icon: const Icon(
            Icons.memory,
            // color: Color(0xff212435),
            size: 24,
          ),
          pressed: goto(const HwTweaksDashboard()),
        ),
        GearAction(
          title: AppLocalizations.of(context)!.systemmask,
          icon: const Icon(
            Icons.dashboard_outlined,
            // color: Color(0xff212435),
            size: 24,
          ),
          pressed: goto(const SmaskDashboard()),
        ),
        GearAction(
          title: AppLocalizations.of(context)!.misc,
          icon: const Icon(
            Icons.miscellaneous_services,
            // color: Color(0xff212435),
            size: 24,
          ),
          pressed: goto(const MiscDashboard()),
        ),
      ]),
      // separaText(AppLocalizations.of(context)!.fdevs),
      homeActions(AppLocalizations.of(context)!.fdevs, [
        GearAction(
          title: AppLocalizations.of(context)!.devzone,
          icon: const Icon(
            Icons.code,
            // color: Color(0xff212435),
            size: 24,
          ),
          pressed: goto(const DevZone()),
        ),
        GearAction(
          title: AppLocalizations.of(context)!.log,
          icon: const Icon(
            Icons.bug_report_outlined,
            // color: Color(0xff212435),
            size: 24,
          ),
          pressed: goto(const ShowLog()),
        ),
      ]),
    ];

    return ListView.builder(
      itemCount: body.length,
      itemBuilder: (context, index) {
        return body[index];
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}
