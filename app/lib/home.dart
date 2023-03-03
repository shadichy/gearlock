import 'package:flutter/material.dart';
import 'package:gearlock/global_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int t) async {
    Navigator.pushNamedAndRemoveUntil(
        context, navBar['switchNavigation'](t), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    Widget homeActions(List<List> childItems) {
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

    List<Widget> body = [
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
                border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
              ),
              child: const Icon(
                Icons.settings,
                color: Color(0xff303f9f),
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
      homeActions([
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
      homeActions([
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
      homeActions([
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
      homeActions([
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
      homeActions([
        [
          "Developers Zone",
          const Icon(
            Icons.code,
            color: Color(0xff212435),
            size: 24,
          )
        ],
        [
          "Show logs",
          const Icon(
            Icons.bug_report_outlined,
            color: Color(0xff212435),
            size: 24,
          )
        ],
      ]),
    ];

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: ListView.builder(
        itemCount: (body.length < 20) ? body.length : 20,
        itemBuilder: (context, index) {
          return body[index];
        },
        physics: const BouncingScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
