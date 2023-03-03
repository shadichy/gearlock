
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gearlock/global_widgets.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({
    super.key,
  });

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: ListView.builder(
        itemCount: 11,
        itemBuilder: (context, index) {
          return [
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
          ][index];
        },
        physics: const BouncingScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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
