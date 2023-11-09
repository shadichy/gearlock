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
import 'package:open_settings/open_settings.dart';

final Map<String, dynamic> _colc = jsonDecode(
  Process.runSync("/data/local/tmp/gstatus-json", []).stdout,
);

class Prop extends StatelessWidget {
  final String name;
  final dynamic value;
  final void Function()? onTap;
  const Prop({
    required this.name,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return ListTile(
      onTap: onTap,
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: colors.onPrimaryContainer,
        ),
        textAlign: TextAlign.start,
      ),
      subtitle: Text(
        value.toString(),
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: colors.onSurfaceVariant,
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
    );
  }
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
    ColorScheme colors = Theme.of(context).colorScheme;
    AppLocalizations? transl = AppLocalizations.of(context);
    void Function() goto(StatefulWidget page) => () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
    Widget infoTextBox(String header, List<Prop> content) => Container(
          // margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            // color: colors.surfaceTint.withOpacity(0.05),
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
                      color: colors.onPrimaryContainer,
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: colors.onPrimaryContainer,
                    indent: 8,
                  ))
                ],
              ),
              const Divider(
                color: Colors.transparent,
                height: 8,
              ),
              ...content
            ],
          ),
        );

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
                AppPrefs(callbackAdd: callbackAdd, callGoBack: callGoBack),
              ),
              icon: Icon(
                Icons.settings,
                color: colors.primary,
                size: 28,
              ),
              splashRadius: 24,
            ),
            topText([
              transl!.systemupper,
              " ${transl.infoupper}"
            ], [
              colors.onPrimaryContainer,
              colors.primary
            ]),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: colors.primary,
                size: 28,
              ),
              splashRadius: 24,
            ),
          ],
        ),
      ),
      infoTextBox("GearLock", [
        Prop(
          name: transl.gearlockver,
          value: _colc['gearlock']?['version'],
          onTap: goto(updater),
        ),
        Prop(
          name: transl.gearbootver,
          value: _colc['gearlock']?['gearboot'],
          onTap: goto(updater),
        ),
        Prop(
          name: transl.gearpropver,
          value: _colc['gearlock']?['gearprop'],
          onTap: goto(updater),
        ),
        Prop(
          name: transl.appver,
          value: appVer,
          onTap: goto(updater),
        ),
      ]),
      infoTextBox("Android", [
        Prop(
          name: transl.androidver,
          value: _colc['android']?['release'],
          onTap: () => OpenSettings.openDeviceInfoSetting(),
        ),
        Prop(
          name: transl.sdklevel,
          value: _colc['android']?['sdkInt'],
          onTap: () => OpenSettings.openDeviceInfoSetting(),
        ),
        Prop(
          name: transl.buildno,
          value: _colc['android']?['buildNo'],
          onTap: () => OpenSettings.openDeviceInfoSetting(),
        ),
        Prop(
          name: transl.suhandler,
          value: _colc['android']?['suHandler'],
          onTap: goto(suhandler),
        ),
        if (_colc['android']?['suVer'] != null)
          Prop(
            name: transl.suver,
            value: _colc['android']?['suVer'],
            onTap: goto(suhandler),
          ),
        Prop(
          name: transl.gmsprovider,
          value: _colc['android']?['gmsPrvd'],
          onTap: goto(const GoogleStats()),
        ),
        Prop(
          name: transl.macaddress,
          value: _colc['android']?['mac'],
          onTap: goto(const FakeMAC()),
        ),
        if (_colc['android']?['armLayer'] != null)
          Prop(
            name: transl.nativebridge,
            value: _colc['android']?['armLayer'],
          ),
        if (_colc['android']?['armType'] != null)
          Prop(
            name: transl.gamingprotocol,
            value: _colc['android']?['armType'],
          ),
      ]),
      infoTextBox(transl.graphics, [
        Prop(
          name: transl.resolution,
          value: _colc['graphics']?['resolution'],
          onTap: goto(const ChangeResolution()),
        ),
        Prop(
          name: "DPI",
          value: _colc['graphics']?['dpi'],
          onTap: () => OpenSettings.openDisplaySetting(),
        ),
        Prop(
          name: transl.glvendor,
          value: _colc['graphics']?['glVendor'],
          onTap: goto(fakegl),
        ),
        Prop(
          name: transl.glrenderer,
          value: _colc['graphics']?['glRenderer'],
          onTap: goto(fakegl),
        ),
        Prop(
          name: transl.glver,
          value: _colc['graphics']?['glVersion'],
          onTap: goto(fakegl),
        ),
      ]),
      infoTextBox(transl.kernel, [
        Prop(
          name: transl.kernelver,
          value: _colc['kernel']?['version'],
          onTap: () => OpenSettings.openDeviceInfoSetting(),
        ),
        Prop(
          name: transl.buildinfo,
          value: _colc['kernel']?['build'],
          onTap: () => OpenSettings.openDeviceInfoSetting(),
        ),
        Prop(
          name: transl.arch,
          value: _colc['kernel']?['arch'],
        ),
        Prop(
          name: transl.uptime,
          value: _colc['kernel']?['uptime'],
        ),
      ]),
      infoTextBox(transl.devicespec, [
        Prop(
          name: "CPU",
          value: _colc['cpu']?['name'],
          onTap: goto(fakecpu),
        ),
        Prop(
          name: transl.cpuarch,
          value: _colc['cpu']?['arch'],
        ),
        Prop(
          name: transl.cpuvendor,
          value: _colc['cpu']?['vendor'],
          onTap: goto(fakecpu),
        ),
        Prop(
          name: transl.cpucores,
          value: _colc['cpu']?['cores'],
          onTap: goto(fakecpu),
        ),
        Prop(
          name: transl.cpufreqr,
          value: _colc['cpu']?['freqRange'],
          onTap: goto(changefreqgov),
        ),
        Prop(
          name: transl.currcpugov,
          value: _colc['cpu']?['governor'],
          onTap: goto(changefreqgov),
        ),
        Prop(
          name: transl.availcpugov,
          value: _colc['cpu']?['gvnrs'],
          onTap: goto(changefreqgov),
        ),
        Prop(
          name: "GPU",
          value: _colc['gpu']?['name'],
          onTap: goto(fakegl),
        ),
        Prop(
          name: transl.gpuvendor,
          value: _colc['gpu']?['vendor'],
          onTap: goto(fakegl),
        ),
        Prop(
          name: "RAM",
          value: _colc['ram'],
          onTap: goto(const FakeRAM()),
        ),
        Prop(
          name: transl.intermem,
          value: _colc['storage'],
          onTap: goto(const FsCore(mode: FsPageMode.backup)),
        ),
        Prop(
          name: transl.model,
          value: _colc['model'],
          onTap: () => OpenSettings.openDeviceInfoSetting(),
        ),
        Prop(
          name: transl.biosmode,
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
