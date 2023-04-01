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
import 'package:gearlock/settings/update.dart';

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
  final String appVer = "1.0.0+1";
  final updater = const Updater();
  final suhandler = const SuHandler();
  final fakegl = const FakeGraphics();
  final fakecpu = const FakeCPU();
  final changefreqgov = const ChangeFreqGov();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void Function() goto(StatefulWidget page) => () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
    Widget infoTextBox(List<Prop> content) {
      List<Widget> txtbx = [];
      for (var i = 0; i < content.length; i++) {
        txtbx.add(ListTile(
          onTap: content[i].onTap,
          shape: RoundedRectangleBorder(
              borderRadius: i == 0
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(8), topRight: Radius.circular(8))
                  : (i == content.length - 1)
                      ? const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))
                      : BorderRadius.zero),
          tileColor: const Color(0x00000000),
          title: Text(
            content[i].name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            content[i].value.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff555555),
            ),
            overflow: TextOverflow.clip,
            textAlign: TextAlign.start,
          ),
          dense: true,
          // isThreeLine: true,
          visualDensity: const VisualDensity(vertical: 0),
          // contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          contentPadding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
          selected: false,
          selectedTileColor: const Color(0x42000000),
        ));
      }
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
        ),
        child: Column(children: txtbx),
      );
    }

    return ListView.builder(
      itemCount: 12,
      itemBuilder: (context, index) => [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Icon(
                  Icons.settings,
                  color: Color(0xff303f9f),
                  size: 28,
                ),
              ),
              topText(["SYSTEM", " INFO"]),
              Container(
                alignment: Alignment.center,
                child: const Icon(
                  Icons.edit_outlined,
                  color: Color(0xff303f9f),
                  size: 28,
                ),
              ),
            ],
          ),
        ),
        headingText("Software", 0xff303f9f),
        separaText("GearLock"),
        infoTextBox([
          Prop(
            name: "GearLock version",
            value: _colc['gearlock']?['version'],
            onTap: goto(updater),
          ),
          Prop(
            name: "GearBoot version",
            value: _colc['gearlock']?['gearboot'],
            onTap: goto(updater),
          ),
          Prop(
            name: "GearProp version",
            value: _colc['gearlock']?['gearprop'],
            onTap: goto(updater),
          ),
          Prop(
            name: "App version",
            value: appVer,
            onTap: goto(updater),
          ),
        ]),
        separaText("Android"),
        infoTextBox([
          Prop(name: "Android version", value: _colc['android']?['release']),
          Prop(name: "SDK level", value: _colc['android']?['sdkInt']),
          Prop(name: "Build number", value: _colc['android']?['buildNo']),
          Prop(
            name: "SU handler",
            value: _colc['android']?['suHandler'],
            onTap: goto(suhandler),
          ),
          if (_colc['android']?['suVer'] != null)
            Prop(
              name: "SU version",
              value: _colc['android']?['suVer'],
              onTap: goto(suhandler),
            ),
          Prop(
            name: "GMS provider",
            value: _colc['android']?['gmsPrvd'],
            onTap: goto(const GoogleStats()),
          ),
          Prop(
            name: "Device MAC address",
            value: _colc['android']?['mac'],
            onTap: goto(const FakeMAC()),
          ),
          if (_colc['android']?['armLayer'] != null)
            Prop(name: "NativeBridge", value: _colc['android']?['armLayer']),
          if (_colc['android']?['armType'] != null)
            Prop(name: "Gaming Protocol", value: _colc['android']?['armType']),
        ]),
        separaText("Graphics"),
        infoTextBox([
          Prop(
            name: "Resolution",
            value: _colc['graphics']?['resolution'],
            onTap: goto(const ChangeResolution()),
          ),
          Prop(name: "DPI", value: _colc['graphics']?['dpi']),
          Prop(
            name: "GL Vendor",
            value: _colc['graphics']?['glVendor'],
            onTap: goto(fakegl),
          ),
          Prop(
            name: "GL Renderer",
            value: _colc['graphics']?['glRenderer'],
            onTap: goto(fakegl),
          ),
          Prop(
            name: "GL Version",
            value: _colc['graphics']?['glVersion'],
            onTap: goto(fakegl),
          ),
        ]),
        separaText("Kernel"),
        infoTextBox([
          Prop(name: "Kernel version", value: _colc['kernel']?['version']),
          Prop(name: "Build info", value: _colc['kernel']?['build']),
          Prop(name: "Architecture", value: _colc['kernel']?['arch']),
          Prop(name: "Uptime", value: _colc['kernel']?['uptime']),
        ]),
        headingText("Hardware", 0xff303f9f),
        infoTextBox([
          Prop(
            name: "CPU",
            value: _colc['cpu']?['name'],
            onTap: goto(fakecpu),
          ),
          Prop(name: "CPU architecture", value: _colc['cpu']?['arch']),
          Prop(
            name: "CPU vendor",
            value: _colc['cpu']?['vendor'],
            onTap: goto(fakecpu),
          ),
          Prop(
            name: "CPU cores",
            value: _colc['cpu']?['cores'],
            onTap: goto(fakecpu),
          ),
          Prop(
            name: "CPU freqency range",
            value: _colc['cpu']?['freqRange'],
            onTap: goto(changefreqgov),
          ),
          Prop(
            name: "Current CPU governor",
            value: _colc['cpu']?['governor'],
            onTap: goto(changefreqgov),
          ),
          Prop(
            name: "Available CPU governors",
            value: _colc['cpu']?['gvnrs'],
            onTap: goto(changefreqgov),
          ),
          Prop(
            name: "GPU",
            value: _colc['gpu']?['name'],
            onTap: goto(fakegl),
          ),
          Prop(
            name: "GPU vendor",
            value: _colc['gpu']?['vendor'],
            onTap: goto(fakegl),
          ),
          Prop(
            name: "RAM",
            value: _colc['ram'],
            onTap: goto(const FakeRAM()),
          ),
          Prop(
            name: "Internal Storage",
            value: _colc['storage'],
            onTap: goto(const FsCore(mode: FsPageMode.backup)),
          ),
          Prop(name: "Model", value: _colc['model']),
          Prop(name: "Boot Structure", value: _colc['boot']),
        ]),
      ][index],
      physics: const BouncingScrollPhysics(),
    );
  }
}
