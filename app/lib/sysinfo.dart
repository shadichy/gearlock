import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gearlock/global_widgets.dart';
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

  void _onItemTapped(int t) async {
    Navigator.pushNamedAndRemoveUntil(
    context, navBar['switchNavigation'](t), (route) => false);
  }

  int megabytes = 1024 * 1024;
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

    Future<Map<String, dynamic>> _colc(context) async => jsonDecode(
        await (await Process.run("/data/local/tmp/gstatus-json", [])).stdout);
    // /gearlock/gstatus-json

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _colc(context),
        builder: ((context, snapshot) {
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
                ["GearLock version", snapshot.data?['gearlock']?['version']],
                ["GearBoot version", snapshot.data?['gearlock']?['gearboot']],
                ["GearProp version", snapshot.data?['gearlock']?['gearprop']],
                ["App version", "1.0.0+1"],
              ]),
              separaText("Android"),
              infoTextBox([
                ["Android version", snapshot.data?['android']?['release']],
                ["SDK level", snapshot.data?['android']?['sdkInt']],
                ["Build number", snapshot.data?['android']?['buildNo']],
                ["SU handler", snapshot.data?['android']?['suHandler']],
                if (snapshot.data?['android']?['suVer'] != null)
                  ["SU version", snapshot.data?['android']?['suVer']],
                ["GoogleLess", snapshot.data?['android']?['googLess']],
                ["Device MAC address", snapshot.data?['android']?['mac']],
                if (snapshot.data?['android']?['armLayer'] != null)
                  ["NativeBridge", snapshot.data?['android']?['armLayer']],
                if (snapshot.data?['android']?['armType'] != null)
                  ["Gaming Protocol", snapshot.data?['android']?['armType']],
              ]),
              separaText("Graphics"),
              infoTextBox([
                ["Resolution", snapshot.data?['graphics']?['resolution']],
                ["DPI", snapshot.data?['graphics']?['dpi']],
                ["GL Vendor", snapshot.data?['graphics']?['glVendor']],
                ["GL Renderer", snapshot.data?['graphics']?['glRenderer']],
                ["GL Version", snapshot.data?['graphics']?['glVersion']],
              ]),
              separaText("Kernel"),
              infoTextBox([
                ["Kernel version", snapshot.data?['kernel']?['version']],
                ["Build info", snapshot.data?['kernel']?['build']],
                ["Architecture", snapshot.data?['kernel']?['arch']],
                ["Uptime", snapshot.data?['kernel']?['uptime']],
              ]),
              headingText("Hardware", 0xff303f9f),
              infoTextBox([
                ["CPU", snapshot.data?['cpu']?['name']],
                ["CPU architecture", snapshot.data?['cpu']?['arch']],
                ["CPU vendor", snapshot.data?['cpu']?['vendor']],
                ["CPU cores", snapshot.data?['cpu']?['cores']],
                ["CPU freqency range", snapshot.data?['cpu']?['freqRange']],
                ["Current CPU governor", snapshot.data?['cpu']?['governor']],
                ["Available CPU governors", snapshot.data?['cpu']?['gvnrs']],
                ["GPU", snapshot.data?['gpu']?['name']],
                ["GPU vendor", snapshot.data?['gpu']?['vendor']],
                ["RAM", snapshot.data?['ram']],
                ["Internal Storage", snapshot.data?['storage']],
                ["Model", snapshot.data?['model']],
                ["Boot Structure", snapshot.data?['boot']],
              ]),
            ][index],
            physics: const BouncingScrollPhysics(),
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: navBar['items'],
        selectedFontSize: navBar['selectedFontSize'],
        unselectedFontSize: navBar['unselectedFontSize'],
        selectedItemColor: navBar['selectedItemColor'],
        unselectedItemColor: navBar['unselectedItemColor'],
        showUnselectedLabels: navBar['showUnselectedLabels'],
        showSelectedLabels: navBar['showSelectedLabels'],
        elevation: navBar['elevation'],
        onTap: _onItemTapped,
      ),
    );
  }
}
