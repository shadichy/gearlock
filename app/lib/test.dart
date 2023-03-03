import 'package:flutter/material.dart';
import 'package:gearlock/global_widgets.dart';

class TestTemplate extends StatefulWidget {
  const TestTemplate({
    super.key,
  });

  @override
  State<TestTemplate> createState() => _TestTemplateState();
}

class _TestTemplateState extends State<TestTemplate> {
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
