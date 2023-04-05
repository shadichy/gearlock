import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gearlock/core/global_widgets.dart';
import 'package:gearlock/core/home_widgets.dart';
import 'package:gearlock/features/fs/core.dart';
import 'package:gearlock/features/google/core.dart';
import 'package:gearlock/features/hardware/cpu_governors.dart';
import 'package:gearlock/features/hardware/resolution.dart';
import 'package:gearlock/features/misc/su_handler.dart';
import 'package:gearlock/features/systemmask/cpu.dart';
import 'package:gearlock/features/systemmask/gl.dart';
import 'package:gearlock/features/systemmask/mac.dart';
import 'package:gearlock/features/systemmask/ram.dart';
import 'package:gearlock/settings/settings.dart';
import 'package:gearlock/settings/update.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final Map<String, dynamic> _colc = jsonDecode(
  Process.runSync("/data/local/tmp/gstatus-json", []).stdout,
);

class Prop {
  final String name;
  final dynamic value;
  final void Function()? onTap;
  const Prop({
    required this.name,
    required this.value,
    this.onTap,
  });
}

// /gearlock/gstatus-json
class SysInfoScreen extends GearStatefulWidget {
  const SysInfoScreen({
    super.key,
    required super.callbackAdd,
    required super.callGoBack,
  });

  @override
  State<SysInfoScreen> createState() => _SysInfoScreenState();
}

class _SysInfoScreenState extends State<SysInfoScreen> {
  late final void Function(GearStatefulWidget page) callbackAdd;
  late final void Function() callGoBack;
  final String appVer = "1.0.0+1";
  final updater = const Updater();
  final suhandler = const SuHandler();
  final fakegl = const FakeGraphics();
  final fakecpu = const FakeCPU();
  final changefreqgov = const ChangeFreqGov();

  @override
  void initState() {
    super.initState();
    callbackAdd = widget.callbackAdd;
    callGoBack = widget.callGoBack;
  }

  @override
  Widget build(BuildContext context) {
    void Function() goto(StatefulWidget page) => () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
    Widget infoTextBox(String header, List<Prop> content) {
      List<Widget> txtbx = [];
      for (var i = 0; i < content.length; i++) {
        txtbx.add(ListTile(
          onTap: content[i].onTap,
          // shape: RoundedRectangleBorder(
          //     borderRadius: i == 0
          //         ? const BorderRadius.only(
          //             topLeft: Radius.circular(8), topRight: Radius.circular(8))
          //         : (i == content.length - 1)
          //             ? const BorderRadius.only(
          //                 bottomLeft: Radius.circular(8),
          //                 bottomRight: Radius.circular(8))
          //             : BorderRadius.zero),
          // tileColor: const Color(0x00000000),
          title: Text(
            content[i].name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            content[i].value.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            overflow: TextOverflow.clip,
            textAlign: TextAlign.start,
          ),
          dense: true,
          // isThreeLine: true,
          visualDensity: const VisualDensity(vertical: 0),
          // contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          selected: false,
          // selectedTileColor: const Color(0x42000000),
        ));
      }
      return Container(
        // margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.surfaceTint.withOpacity(0.05),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          // border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Text(
                  header,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                Expanded(
                    child: Divider(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  indent: 8,
                ))
              ],
            ),
            const Divider(
              color: Colors.transparent,
              height: 8,
            ),
            ...txtbx
          ],
        ),
      );
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
              onPressed: () => callbackAdd(
                AppSettings(callbackAdd: callbackAdd, callGoBack: callGoBack),
              ),
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.primary,
                size: 28,
              ),
              splashRadius: 24,
            ),
            topText([
              AppLocalizations.of(context)!.systemupper,
              " ${AppLocalizations.of(context)!.infoupper}"
            ], [
              Theme.of(context).colorScheme.onPrimaryContainer,
              Theme.of(context).colorScheme.primary
            ]),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).colorScheme.primary,
                size: 28,
              ),
              splashRadius: 24,
            ),
          ],
        ),
      ),
      infoTextBox("GearLock", [
        Prop(
          name: AppLocalizations.of(context)!.gearlockver,
          value: _colc['gearlock']?['version'],
          onTap: goto(updater),
        ),
        Prop(
          name: AppLocalizations.of(context)!.gearbootver,
          value: _colc['gearlock']?['gearboot'],
          onTap: goto(updater),
        ),
        Prop(
          name: AppLocalizations.of(context)!.gearpropver,
          value: _colc['gearlock']?['gearprop'],
          onTap: goto(updater),
        ),
        Prop(
          name: AppLocalizations.of(context)!.appver,
          value: appVer,
          onTap: goto(updater),
        ),
      ]),
      infoTextBox("Android", [
        Prop(
          name: AppLocalizations.of(context)!.androidver,
          value: _colc['android']?['release'],
        ),
        Prop(
          name: AppLocalizations.of(context)!.sdklevel,
          value: _colc['android']?['sdkInt'],
        ),
        Prop(
          name: AppLocalizations.of(context)!.buildno,
          value: _colc['android']?['buildNo'],
        ),
        Prop(
          name: AppLocalizations.of(context)!.suhandler,
          value: _colc['android']?['suHandler'],
          onTap: goto(suhandler),
        ),
        if (_colc['android']?['suVer'] != null)
          Prop(
            name: AppLocalizations.of(context)!.suver,
            value: _colc['android']?['suVer'],
            onTap: goto(suhandler),
          ),
        Prop(
          name: AppLocalizations.of(context)!.gmsprovider,
          value: _colc['android']?['gmsPrvd'],
          onTap: goto(const GoogleStats()),
        ),
        Prop(
          name: AppLocalizations.of(context)!.macaddress,
          value: _colc['android']?['mac'],
          onTap: goto(const FakeMAC()),
        ),
        if (_colc['android']?['armLayer'] != null)
          Prop(
            name: AppLocalizations.of(context)!.nativebridge,
            value: _colc['android']?['armLayer'],
          ),
        if (_colc['android']?['armType'] != null)
          Prop(
            name: AppLocalizations.of(context)!.gamingprotocol,
            value: _colc['android']?['armType'],
          ),
      ]),
      infoTextBox(AppLocalizations.of(context)!.graphics, [
        Prop(
          name: AppLocalizations.of(context)!.resolution,
          value: _colc['graphics']?['resolution'],
          onTap: goto(const ChangeResolution()),
        ),
        Prop(
          name: "DPI",
          value: _colc['graphics']?['dpi'],
        ),
        Prop(
          name: AppLocalizations.of(context)!.glvendor,
          value: _colc['graphics']?['glVendor'],
          onTap: goto(fakegl),
        ),
        Prop(
          name: AppLocalizations.of(context)!.glrenderer,
          value: _colc['graphics']?['glRenderer'],
          onTap: goto(fakegl),
        ),
        Prop(
          name: AppLocalizations.of(context)!.glver,
          value: _colc['graphics']?['glVersion'],
          onTap: goto(fakegl),
        ),
      ]),
      infoTextBox(AppLocalizations.of(context)!.kernel, [
        Prop(
          name: AppLocalizations.of(context)!.kernelver,
          value: _colc['kernel']?['version'],
        ),
        Prop(
          name: AppLocalizations.of(context)!.buildinfo,
          value: _colc['kernel']?['build'],
        ),
        Prop(
          name: AppLocalizations.of(context)!.arch,
          value: _colc['kernel']?['arch'],
        ),
        Prop(
          name: AppLocalizations.of(context)!.uptime,
          value: _colc['kernel']?['uptime'],
        ),
      ]),
      infoTextBox(AppLocalizations.of(context)!.devicespec, [
        Prop(
          name: "CPU",
          value: _colc['cpu']?['name'],
          onTap: goto(fakecpu),
        ),
        Prop(
          name: AppLocalizations.of(context)!.cpuarch,
          value: _colc['cpu']?['arch'],
        ),
        Prop(
          name: AppLocalizations.of(context)!.cpuvendor,
          value: _colc['cpu']?['vendor'],
          onTap: goto(fakecpu),
        ),
        Prop(
          name: AppLocalizations.of(context)!.cpucores,
          value: _colc['cpu']?['cores'],
          onTap: goto(fakecpu),
        ),
        Prop(
          name: AppLocalizations.of(context)!.cpufreqr,
          value: _colc['cpu']?['freqRange'],
          onTap: goto(changefreqgov),
        ),
        Prop(
          name: AppLocalizations.of(context)!.currcpugov,
          value: _colc['cpu']?['governor'],
          onTap: goto(changefreqgov),
        ),
        Prop(
          name: AppLocalizations.of(context)!.availcpugov,
          value: _colc['cpu']?['gvnrs'],
          onTap: goto(changefreqgov),
        ),
        Prop(
          name: "GPU",
          value: _colc['gpu']?['name'],
          onTap: goto(fakegl),
        ),
        Prop(
          name: AppLocalizations.of(context)!.gpuvendor,
          value: _colc['gpu']?['vendor'],
          onTap: goto(fakegl),
        ),
        Prop(
          name: "RAM",
          value: _colc['ram'],
          onTap: goto(const FakeRAM()),
        ),
        Prop(
          name: AppLocalizations.of(context)!.intermem,
          value: _colc['storage'],
          onTap: goto(const FsCore(mode: FsPageMode.backup)),
        ),
        Prop(
          name: AppLocalizations.of(context)!.model,
          value: _colc['model'],
        ),
        Prop(
          name: AppLocalizations.of(context)!.biosmode,
          value: _colc['boot'],
        ),
      ]),
    ];

    return ListView.builder(
      itemCount: body.length,
      itemBuilder: (context, index) => body[index],
      physics: const BouncingScrollPhysics(),
    );
  }
}
