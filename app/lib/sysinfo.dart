import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gearlock/global_widgets.dart';

final Map<String, dynamic> _colc =
    jsonDecode(Process.runSync("/data/local/tmp/gstatus-json", []).stdout);

// /gearlock/gstatus-json
class SysInfoScreen extends StatefulWidget {
  const SysInfoScreen({
    super.key,
  });

  @override
  State<SysInfoScreen> createState() => _SysInfoScreenState();
}

class _SysInfoScreenState extends State<SysInfoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget infoTextBox(List<List<dynamic>> content) {
      List<Widget> txtbx = [];
      for (var i = 0; i < content.length; i++) {
        txtbx.add(ListTile(
          onTap: () => {},
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
            content[i][0],
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            content[i][1].toString(),
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
          color: const Color(0x00000000),
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
          ["GearLock version", _colc['gearlock']?['version']],
          ["GearBoot version", _colc['gearlock']?['gearboot']],
          ["GearProp version", _colc['gearlock']?['gearprop']],
          ["App version", "1.0.0+1"],
        ]),
        separaText("Android"),
        infoTextBox([
          ["Android version", _colc['android']?['release']],
          ["SDK level", _colc['android']?['sdkInt']],
          ["Build number", _colc['android']?['buildNo']],
          ["SU handler", _colc['android']?['suHandler']],
          if (_colc['android']?['suVer'] != null)
            ["SU version", _colc['android']?['suVer']],
          ["GoogleLess", _colc['android']?['googLess']],
          ["Device MAC address", _colc['android']?['mac']],
          if (_colc['android']?['armLayer'] != null)
            ["NativeBridge", _colc['android']?['armLayer']],
          if (_colc['android']?['armType'] != null)
            ["Gaming Protocol", _colc['android']?['armType']],
        ]),
        separaText("Graphics"),
        infoTextBox([
          ["Resolution", _colc['graphics']?['resolution']],
          ["DPI", _colc['graphics']?['dpi']],
          ["GL Vendor", _colc['graphics']?['glVendor']],
          ["GL Renderer", _colc['graphics']?['glRenderer']],
          ["GL Version", _colc['graphics']?['glVersion']],
        ]),
        separaText("Kernel"),
        infoTextBox([
          ["Kernel version", _colc['kernel']?['version']],
          ["Build info", _colc['kernel']?['build']],
          ["Architecture", _colc['kernel']?['arch']],
          ["Uptime", _colc['kernel']?['uptime']],
        ]),
        headingText("Hardware", 0xff303f9f),
        infoTextBox([
          ["CPU", _colc['cpu']?['name']],
          ["CPU architecture", _colc['cpu']?['arch']],
          ["CPU vendor", _colc['cpu']?['vendor']],
          ["CPU cores", _colc['cpu']?['cores']],
          ["CPU freqency range", _colc['cpu']?['freqRange']],
          ["Current CPU governor", _colc['cpu']?['governor']],
          ["Available CPU governors", _colc['cpu']?['gvnrs']],
          ["GPU", _colc['gpu']?['name']],
          ["GPU vendor", _colc['gpu']?['vendor']],
          ["RAM", _colc['ram']],
          ["Internal Storage", _colc['storage']],
          ["Model", _colc['model']],
          ["Boot Structure", _colc['boot']],
        ]),
      ][index],
      physics: const BouncingScrollPhysics(),
    );
  }
}
