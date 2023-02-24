import 'dart:io';
// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'pkglist.dart';

void main() {
  runApp(
    const MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: GearLock(
            // appTitle: "[GoogleLTS_xanmod1]_Kernel_5.4.104_sakura",
            // description: "Made with time & passion",
            // author: "HMTheBoy154",
            // pkgtype: true,
            // version: "5.4.104",
            // insDate: [3, 3, 2023],
            ),
      ),
    ),
  );
}

class Item {
  final String header;
  final String body;
  bool isExpanded;

  Item({
    required this.header,
    required this.body,
    this.isExpanded = false,
  });
}

Widget baseTextBox(context, Row child) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    padding: const EdgeInsets.all(0),
    width: MediaQuery.of(context).size.width,
    height: 50,
    decoration: const BoxDecoration(
      color: Color(0x00000000),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.zero,
    ),
    child: child,
  );
}

Row textRow(String title, content) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Text(
        "$title: ",
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff555555),
        ),
      ),
      if (content is Widget) content
    ],
  );
}

Widget simpleTextBox(context, String title, String content) {
  return baseTextBox(
    context,
    textRow(
      title,
      Text(
        content,
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff000000),
        ),
      ),
    ),
  );
}

Widget expandaBox(double padding, List<ExpansionPanelRadio> children) {
  return ExpansionPanelList.radio(
    elevation: 0,
    expandedHeaderPadding: EdgeInsets.all(padding),
    dividerColor: const Color(0xffffffff),
    children: children,
  );
}

Widget singleExpandaText(String title, String content) {
  return expandaBox(0, [
    ExpansionPanelRadio(
      backgroundColor: const Color(0xffffffff),
      canTapOnHeader: true,
      value: title,
      headerBuilder: (context, isExpanded) => ListTile(
        title: textRow(title, Null),
      ),
      body: ListTile(
        title: Text(
          content,
          textAlign: TextAlign.start,
          // maxLines: 1,
          overflow: TextOverflow.clip,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff000000),
          ),
        ),
      ),
    ),
  ]);
}

Widget multiExpandaText(List<List<String>> content) {
  List<ExpansionPanelRadio> txtbox = [];
  for (var ctn in content) {
    txtbox.add(ExpansionPanelRadio(
      backgroundColor: const Color(0xffffffff),
      canTapOnHeader: true,
      value: ctn[0],
      headerBuilder: (context, isExpanded) => Container(
        // alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width,
        height: 60,
        padding: const EdgeInsets.all(16),
        child: Text(
          ctn[0],
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: ListTile(
        title: Text(
          ctn[1],
          textAlign: TextAlign.start,
          // maxLines: 1,
          overflow: TextOverflow.clip,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff000000),
          ),
        ),
      ),
    ));
  }
  return expandaBox(0, txtbox);
}

Future<String> readFlist(String filepath) async {
  try {
    return await File(filepath).readAsString();
  } catch (e) {
    return "";
  }
}

Widget headingText(String text, int color) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
    child: Text(
      text,
      textAlign: TextAlign.start,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 18,
        color: Color(color),
      ),
    ),
  );
}

Widget infoTextBox(context, List<List<String>> content) {
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
        content[i][1],
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

Widget homeActions(context, List<List> childItems) {
  List<Widget> children = [];
  for (var i = 0; i < childItems.length; i++) {
    children.add(ElevatedButton.icon(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
        padding: const EdgeInsets.all(8),
        minimumSize: Size(MediaQuery.of(context).size.width, 60),
        foregroundColor: const Color(0xff555555),
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
      icon: childItems[i][1],
      label: Padding(
        // padding: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(0),
        child: Text(
          childItems[i][0],
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xff000000),
          ),
        ),
      ),
    ));
    if (i == childItems.length - 1) break;
    children.add(
      const Divider(
        color: Color(0xff929292),
        height: 1,
        thickness: 1,
        indent: 8,
        endIndent: 8,
      ),
    );
  }
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    padding: const EdgeInsets.all(0),
    width: MediaQuery.of(context).size.width,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      color: const Color(0x00000000),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: children,
    ),
  );
}

Widget separaText(String text) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
    child: Text(
      text,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        fontSize: 12,
        color: Color(0xff929292),
      ),
    ),
  );
}

Widget topText(List<String> txt) {
  List<Widget> out = [];
  List<int> colorCode = [0xff000000, 0xff303f9f];
  for (var i = 0; i < 2; i++) {
    out.add(Text(
      txt[i],
      textAlign: TextAlign.start,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.normal,
        fontSize: 20,
        color: Color(colorCode[i]),
      ),
    ));
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: out,
  );
}

Widget packageBox(String appTitle, String appSize, Widget appIcon) {
  return ElevatedButton(
    onPressed: () => {},
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      backgroundColor: const Color(0xffffffff),
      foregroundColor: const Color(0xff555555),
      shadowColor: Colors.transparent,
      alignment: Alignment.centerLeft,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(0),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0x00000000),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
          ),
          child: appIcon,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  appTitle,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                ),
                Text(
                  appSize,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class GearLock extends StatefulWidget {
  const GearLock({
    super.key,
  });

  @override
  State<GearLock> createState() => _GearLockState();
}

class _GearLockState extends State<GearLock> {
  bool isX86 = true;
  bool hasGP = true;

  ScrollController scrollController = ScrollController();
  String appTitle = "";
  String appIcon = "";
  String appDescription = "";
  String appAuthor = "";
  bool appPkgtype = true;
  String appVersion = "";
  String appInsDate = "";
  String appFileList = "";

  @override
  void initState() {
    super.initState();
  }

  int _selectedTab = 0;
  int _subTab = 0;
  bool _visible = true;
  void onItemTapped(int t, int st) async {
    setState(() {
      _visible = false;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    scrollController.animateTo(
      0,
      duration: const Duration(microseconds: 1),
      curve: Curves.easeOut,
    );
    setState(() {
      _selectedTab = t;
      _subTab = st;
      _visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<List> sysInfoRaw = [
      [
        "Android version",
        "12",
        const Icon(
          Icons.android,
          color: Color(0xff212435),
          size: 24,
        )
      ],
      [
        "Root access",
        "Granted",
        const Icon(
          Icons.tag,
          color: Color(0xff212435),
          size: 24,
        )
      ],
      [
        "GearLock version",
        "7.4.3",
        const ImageIcon(
          AssetImage("images/gearlock.png"),
          size: 24,
          color: Color(0xff212435),
        )
      ]
    ];
    List<Widget> sysInfo = [];
    for (var i = 0; i < sysInfoRaw.length; i++) {
      sysInfo.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            sysInfoRaw[i][2],
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Text(
                sysInfoRaw[i][0] + ": ",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff555555),
                ),
              ),
            ),
            Text(
              sysInfoRaw[i][1],
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color(0xff000000),
              ),
            ),
          ],
        ),
      );
      if (i == sysInfoRaw.length - 1) break;
      sysInfo.add(
        const Divider(
          color: Color(0xffffffff),
          height: 4,
          thickness: 0,
          indent: 0,
          endIndent: 0,
        ),
      );
    }

    List<List<List<Widget>>> bodyContent = [
      [
        [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0x00000000),
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0x4d9e9e9e), width: 1),
                  ),
                  child: const Icon(
                    Icons.settings,
                    color: Color(0xff212435),
                    size: 28,
                  ),
                ),
                topText(["GEAR", "LOCK"]),
                Container(
                  alignment: Alignment.center,
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0x00000000),
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0x4d9e9e9e), width: 1),
                  ),
                  child: const Image(
                    image: AssetImage("images/color_pal_indigo.png"),
                    height: 28,
                    width: 28,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          headingText("Sytem Info", 0xff3f51b5),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0x00000000),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: sysInfo,
            ),
          ),
          headingText("Quick Actions", 0xff3f51b5),
          separaText("Packages"),
          homeActions(context, [
            [
              "Install package",
              const Icon(
                Icons.add,
                color: Color(0xff212435),
                size: 24,
              )
            ],
            [
              "All packages (48)",
              const Icon(
                Icons.widgets_outlined,
                color: Color(0xff212435),
                size: 24,
              )
            ]
          ]),
          separaText("Filesystem operations"),
          homeActions(context, [
            [
              "Backup filesystem",
              const Icon(
                Icons.sync,
                color: Color(0xff212435),
                size: 24,
              )
            ],
            [
              "Restore from Backups",
              const Icon(
                Icons.history,
                color: Color(0xff212435),
                size: 24,
              )
            ],
            [
              "Wipe filesystem",
              const Icon(
                Icons.restart_alt,
                color: Color(0xff212435),
                size: 24,
              )
            ]
          ]),
          separaText("Tweaks"),
          homeActions(context, [
            [
              "SU handler",
              const Icon(
                Icons.tag,
                color: Color(0xff212435),
                size: 24,
              )
            ],
            [
              "Google",
              const ImageIcon(
                AssetImage("images/Google__G__Logo.png"),
                size: 24,
                color: Color(0xff212435),
              )
            ],
            [
              "Hardware tweaks",
              const Icon(
                Icons.memory,
                color: Color(0xff212435),
                size: 24,
              )
            ]
          ]),
          separaText("SystemMask"),
          homeActions(context, [
            [
              "SystemMask Dashboard",
              const Icon(
                Icons.dashboard_outlined,
                color: Color(0xff212435),
                size: 24,
              )
            ],
          ]),
          separaText("For developers"),
          homeActions(context, [
            [
              "Developers Zone",
              const Icon(
                Icons.code,
                color: Color(0xff212435),
                size: 24,
              )
            ],
          ]),
        ]
      ],
      [
        [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: topText(["SYSTEM ", "INFOMATIONS"]),
          ),
          headingText("Software", 0xff303f9f),
          separaText("GearLock"),
          infoTextBox(context, [
            ["GearLock version", "7.4.3"],
            ["GearBoot version", "1.4"],
            ["GearProp version", "0.6"],
            ["App version", "0.1"],
          ]),
          separaText("Android"),
          infoTextBox(context, [
            ["Android version", "12"],
            ["SDK level", "30"],
            [
              "Build number",
              "android_x86_64-userdebug 12.1 nmf310 529 test-keys"
            ],
            ["SU handler", "Magisk"],
            ["SU version", "21.0.4"],
            ["GoogleLess", "Off"],
            ["Device MAC address", "00:00:00:00:00:00, 00:00:00:00:00:00"],
            if (isX86) ["Houdini version", "12.0.0a_y.10101"],
            if (hasGP) ["Gaming Protocol", "Omega"],
          ]),
          separaText("Graphics"),
          infoTextBox(context, [
            ["Resolution", "1366x768"],
            ["DPI", "140"],
            ["GL Vendor", "Google Inc."],
            ["GL Renderer", "Google SwiftShader"],
            ["GL Version", "OpenGL ES 2.0 SwiftShader 3.3.0.2"],
          ]),
          separaText("Kernel"),
          infoTextBox(context, [
            ["Kernel version", "5.10.58-GoogleLTS-xanmod1-pledge"],
            ["Build date", "Fri Aug 13 17:13:55 +07 2021"],
            ["Architecture", "x86"],
            ["Uptime", "10 hours"],
          ]),
          headingText("Hardware", 0xff303f9f),
          infoTextBox(context, [
            ["CPU", "11th Gen Intel(R) Core(TM) i3-1115G4 @ 3.00GHz"],
            ["CPU architecture", "x86_64"],
            ["CPU vendor", "GenuineIntel"],
            ["CPU cores", "4"],
            ["CPU freqency range", "400MHz - 4000MHz"],
            ["Current CPU governors", "none"],
            ["Available CPU governors", "none"],
            ["GPU", "Intel Tiger Lake-LP GT2 [UHD Graphics G4]"],
            ["RAM", "1990MB"],
            ["Internal Storage", "12GB"],
            ["Model", "LENOVO LNVNB161216"],
            ["Boot Structure", "uEFI"],
          ]),
        ]
      ],
      [
        [
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
                    Icons.search,
                    color: Color(0xff303f9f),
                    size: 24,
                  ),
                ),
                topText(["INSTALLED ", "PACKAGES"]),
                Container(
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.more_vert,
                    color: Color(0xff303f9f),
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0x00000000),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                  color: const Color(0xff3f51b5),
                  iconSize: 24,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(
                    "Add package",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff3f51b5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          packageBox(
            "Kernel 5.10.58-GoogleLTS-xanmod1-pledge",
            "187MB",
            const Image(
              image: AssetImage("images/gearlock.png"),
              height: 32,
              width: 32,
              fit: BoxFit.contain,
            ),
          ),
          packageBox(
            "Microcode",
            "2MB",
            const Image(
              image: AssetImage("images/gearlock.png"),
              height: 32,
              width: 32,
              fit: BoxFit.contain,
            ),
          ),
          packageBox(
            "Toolbox",
            "18MB",
            const Image(
              image: AssetImage("images/gearlock.png"),
              height: 32,
              width: 32,
              fit: BoxFit.contain,
            ),
          ),
          packageBox(
            "Kernel 5.4.102-GoogleLTS-sakura-pledge",
            "156MB",
            const Image(
              image: AssetImage("images/gearlock.png"),
              height: 32,
              width: 32,
              fit: BoxFit.contain,
            ),
          ),
          packageBox(
            "Linux Firmware",
            "200MB",
            const Image(
              image: AssetImage("images/gearlock.png"),
              height: 32,
              width: 32,
              fit: BoxFit.contain,
            ),
          ),
          packageBox(
            "Gaming Protocol",
            "6MB",
            const Image(
              image: AssetImage("images/gearlock.png"),
              height: 32,
              width: 32,
              fit: BoxFit.contain,
            ),
          ),
        ],
        [
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: appIcon.isEmpty
                      ? SvgPicture.asset("images/gearlock.svg",
                          fit: BoxFit.contain)
                      : appIcon.endsWith(".svg")
                          ? SvgPicture.file(File(appIcon), fit: BoxFit.contain)
                          : Image.file(File(appIcon), fit: BoxFit.cover),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
            child: Text(
              appTitle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                color: Color(0xff303f9f),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Icon(
                      Icons.launch,
                      color: Color(0xff536dfe),
                      size: 24,
                    ),
                    Text(
                      "Launch",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        color: Color(0xff536dfe),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Icon(
                      Icons.delete,
                      color: Color(0xff536dfe),
                      size: 24,
                    ),
                    Text(
                      "Uninstall",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        color: Color(0xff536dfe),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          singleExpandaText("Description", appDescription),
          simpleTextBox(context, "Author", appAuthor),
          simpleTextBox(context, "Type", appPkgtype ? "Package" : "Extension"),
          simpleTextBox(context, "Version", appVersion),
          simpleTextBox(context, "Installed Date", appInsDate),
          singleExpandaText("File list", appFileList),
        ]
      ],
      [
        [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            padding: const EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0x00000000),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
            ),
            child: topText(["GEAR", "LOCK"]),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            padding: const EdgeInsets.all(0),
            width: 86,
            height: 86,
            decoration: BoxDecoration(
              color: const Color(0x00ffffff),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
            ),
            child: SvgPicture.asset(
              "images/gearlock.svg",
              height: 64,
              width: 64,
              fit: BoxFit.contain,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 18),
            child: Text(
              "v7.4.3",
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 12,
                color: Color(0xff7b7b7b),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 2, 16, 8),
            child: Text(
              "GearLock is a GUI & Recovery program developed with with lots of time, patience and love by SupremeGamers.",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                fontSize: 13,
                color: Color(0xff000000),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text(
                  "Website: ",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Color(0xff555555),
                  ),
                ),
                Text(
                  "GearLock - aopc.dev",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Color(0xff536dfe),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 2, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text(
                  "Email: ",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Color(0xff555555),
                  ),
                ),
                Text(
                  "android@gear.lock",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          multiExpandaText([
            ["Descriptions", "nodesc"],
            ["Credits", "C 2022 shadichy"],
            ["License", "GPL-v3"]
          ]),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Source code",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Icon(
                  Icons.launch,
                  color: Color(0xff6c6c6c),
                  size: 18,
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xffffffff),
            height: 12,
            thickness: 0,
            indent: 0,
            endIndent: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text(
                  "Settings",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Color(0xff6c6c6c),
                  size: 18,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(
                      "Check for update",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                    Text(
                      "New update found!",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        color: Color(0xff929292),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.launch),
                  onPressed: () {},
                  color: const Color(0xff6c6c6c),
                  iconSize: 18,
                ),
              ],
            ),
          ),
        ]
      ],
    ];
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: (bodyContent[_selectedTab][_subTab].length < 40)
                ? bodyContent[_selectedTab][_subTab].length
                : 40,
            itemBuilder: (context, index) {
              return bodyContent[_selectedTab][_subTab][index];
            },
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedTab,
        selectedFontSize: 12.0,
        unselectedFontSize: 10.0,
        selectedItemColor: const Color(0xff536dfe),
        unselectedItemColor: const Color(0xff929292),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (i) => onItemTapped(i, 0),
        elevation: 0,
      ),
    );
  }
}
