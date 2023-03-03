import 'package:flutter/material.dart';

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

Widget expandaBox(double padding, List<ExpansionPanelRadio> children) {
  return ExpansionPanelList.radio(
    elevation: 0,
    expandedHeaderPadding: EdgeInsets.all(padding),
    dividerColor: const Color(0xffffffff),
    children: children,
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

Map<String, dynamic> navBar = {
  'items': const <BottomNavigationBarItem>[
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
  'selectedFontSize': 12.0,
  'unselectedFontSize': 10.0,
  'selectedItemColor': const Color(0xff536dfe),
  'unselectedItemColor': const Color(0xff929292),
  'showUnselectedLabels': true,
  'showSelectedLabels': true,
  'elevation': 0.0,
  'switchNavigation': (int t) {
    switch (t) {
      case 1:
        return "/sysinfo";
      case 2:
        return "/pkglist";
      case 3:
        return "/about";
      default:
        return "/";
    }
  }
};

// template
/* 
import 'package:flutter/material.dart';
import 'package:gearlock/global_widgets.dart';

class MainClass extends StatefulWidget {
  const MainClass({
    super.key,
  });

  @override
  State<MainClass> createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  @override
  void initState() {
    super.initState();
  }

  int _selectedTab = 0;
  void _onItemTapped(int t) async {
    setState(() {
      _selectedTab = t;
    });
    Navigator.pushNamedAndRemoveUntil(
        context, navBar['switchNavigation'](t), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [];
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
        currentIndex: _selectedTab,
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
 */
