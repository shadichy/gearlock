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

Widget expandableTextBox(String title, String content) {
  return ExpansionPanelList.radio(
    elevation: 0,
    expandedHeaderPadding: const EdgeInsets.all(0),
    dividerColor: const Color(0xffffffff),
    children: [
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
    ],
  );
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
  // Container(
  //   margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
  //   padding: const EdgeInsets.all(0),
  //   width: MediaQuery.of(context).size.width,
  //   decoration: const BoxDecoration(
  //     color: Color(0x00000000),
  //     shape: BoxShape.rectangle,
  //     borderRadius: BorderRadius.zero,
  //   ),
  //   child: Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     mainAxisSize: MainAxisSize.max,
  //     children: [
  //       Text(
  //         '$title: ',
  //         textAlign: TextAlign.start,
  //         overflow: TextOverflow.clip,
  //         style: const TextStyle(
  //           fontWeight: FontWeight.w600,
  //           fontStyle: FontStyle.normal,
  //           fontSize: 14,
  //           color: Color(0xff000000),
  //         ),
  //       ),
  //       Flexible(
  //         child: Text(
  //           content,
  //           textAlign: TextAlign.start,
  //           overflow: TextOverflow.clip,
  //           style: const TextStyle(
  //             fontWeight: FontWeight.w400,
  //             fontStyle: FontStyle.normal,
  //             fontSize: 14,
  //             color: Color(0xff000000),
  //           ),
  //         ),
  //       ),
  //     ],
  //   ),
  // );
  List<Widget> txtbx = [];
  for (var ctn in content) {
    txtbx.add(ListTile(
      tileColor: const Color(0x00000000),
      title: Text(
        ctn[0],
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff000000),
        ),
        textAlign: TextAlign.start,
      ),
      subtitle: Text(
        ctn[1],
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff555555),
        ),
        textAlign: TextAlign.start,
      ),
      dense: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
    children.add(
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(0),
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
            childItems[i][1],
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
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
          ],
        ),
      ),
    );
    if (i == childItems.length - 1) break;
    children.add(
      const Divider(
        color: Color(0xff808080),
        height: 16,
        thickness: 0,
        indent: 8,
        endIndent: 8,
      ),
    );
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

Widget packageBox(String appTitle, String appSize, Widget appIcon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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

List<Widget> packageInfo(
  context, {
  appTitle = "",
  appIcon = "",
  description = "",
  author = "",
  fileList = "",
  pkgtype = true,
  version = "",
  insDate = "",
}) =>
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
                  ? SvgPicture.asset("images/gearlock.svg", fit: BoxFit.contain)
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
      expandableTextBox("Description", description),
      simpleTextBox(context, "Author", author),
      simpleTextBox(context, "Type", pkgtype ? "Package" : "Extension"),
      simpleTextBox(context, "Version", version),
      simpleTextBox(context, "Installed Date", insDate),
      expandableTextBox("File list", fileList),
    ];

class GearLock extends StatefulWidget {
  // final String appTitle;
  // final String appIcon;
  // final String description;
  // final String author;
  // final bool pkgtype;
  // final String version;
  // final List<int> insDate;
  const GearLock({
    super.key,
    // this.appTitle = "",
    // this.appIcon = "",
    // this.description = "",
    // this.author = "",
    // this.pkgtype = true,
    // this.version = "",
    // this.insDate = const [0, 0, 0],
  });

  @override
  State<GearLock> createState() => _GearLockState();
}

class _GearLockState extends State<GearLock> {
  // String appTitle = "";
  // String appIcon = "";
  // String description = "";
  // String author = "";
  // String fileList = "";
  // bool pkgtype = true;
  // String version = "";
  // String insDate = "";

  bool isX86 = true;
  bool hasGP = true;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // appTitle = widget.appTitle;
    // appIcon = widget.appIcon;
    // description = widget.description;
    // author = widget.author;
    // pkgtype = widget.pkgtype;
    // version = widget.version;
    // insDate = widget.insDate.toString();
    // readFlist(/gearlock/var/lib/gearlock/$appTitle/files').then((value) {
    //   setState(() {
    //     fileList = value;
    //   });
    // });
    // fileList = pkglist;
  }

  int selectedTab = 0;
  void onItemTapped(int t) {
    setState(() {
      selectedTab = t;
    });
    scrollController.animateTo(0, duration: const Duration(microseconds: 1), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> appName = [
      ["GEAR", 0xff000000],
      ["LOCK", 0xff303f9f]
    ];
    List<Widget> gl = [];
    for (var e in appName) {
      gl.add(
        Text(
          e[0],
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(e[1]),
          ),
        ),
      );
    }
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

    List<List<Widget>> bodyContent = [
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
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(0),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0x00000000),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
                ),
                child: const Icon(
                  Icons.settings,
                  color: Color(0xff212435),
                  size: 28,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: gl,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(0),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0x00000000),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
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
      ],
      [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "SYSTEM INFOMATIONS",
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.normal,
              fontSize: 16,
              color: Color(0xff3f51b5),
            ),
          ),
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
      ],
      [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: const Icon(Icons.sort),
              color: const Color(0xff303f9f),
              iconSize: 24,
              onPressed: () {},
            ),
            const Text(
              "PACKAGES",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color(0xff3f51b5),
              ),
            ),
            Row(children: [
              IconButton(
                icon: const Icon(Icons.search),
                color: const Color(0xff303f9f),
                iconSize: 24,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                color: const Color(0xff303f9f),
                iconSize: 24,
                onPressed: () {},
              ),
            ])
          ],
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
                  "Install package",
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: gl,
          ),
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
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "Descriptions",
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
                Icons.expand_more,
                color: Color(0xff6c6c6c),
                size: 18,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "Credits",
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
                Icons.expand_more,
                color: Color(0xff6c6c6c),
                size: 18,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "License",
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
                Icons.expand_more,
                color: Color(0xff6c6c6c),
                size: 18,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
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
        Divider(
          color: Color(0xffffffff),
          height: 12,
          thickness: 0,
          indent: 0,
          endIndent: 0,
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
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
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
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
                icon: Icon(Icons.launch),
                onPressed: () {},
                color: Color(0xff6c6c6c),
                iconSize: 18,
              ),
            ],
          ),
        ),
      ],
    ];
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: const Color(0xffffffff),
      //   shape: const RoundedRectangleBorder(),
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisSize: MainAxisSize.max,
      //     children: gl,
      //   ),
      //   leading: Container(
      //     alignment: Alignment.center,
      //     margin: const EdgeInsets.all(0),
      //     padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      //     width: 32,
      //     height: 32,
      //     decoration: BoxDecoration(
      //       color: const Color(0x00000000),
      //       shape: BoxShape.circle,
      //       border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
      //     ),
      //     child: const Icon(
      //       Icons.settings,
      //       color: Color(0xff212435),
      //       size: 28,
      //     ),
      //   ),
      //   actions: [
      //     Container(
      //       alignment: Alignment.center,
      //       margin: const EdgeInsets.all(0),
      //       padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
      //       width: 32,
      //       height: 32,
      //       decoration: BoxDecoration(
      //         color: const Color(0x00000000),
      //         shape: BoxShape.circle,
      //         border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
      //       ),
      //       child: const Image(
      //         image: AssetImage("images/color_pal_indigo.png"),
      //         height: 28,
      //         width: 28,
      //         fit: BoxFit.contain,
      //       ),
      //     ),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: (bodyContent[selectedTab].length < 40)
            ? bodyContent[selectedTab].length
            : 40,
        itemBuilder: (context, index) {
          return bodyContent[selectedTab][index];
        },
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
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
        currentIndex: selectedTab,
        selectedFontSize: 12.0,
        unselectedFontSize: 10.0,
        selectedItemColor: const Color(0xff536dfe),
        unselectedItemColor: const Color(0xff929292),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: onItemTapped,
      ),
    );
  }
}
