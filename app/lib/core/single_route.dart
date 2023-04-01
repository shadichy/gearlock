import 'package:flutter/material.dart';

class SingleRoute extends StatefulWidget {
  final WillPopCallback? onPop;
  final List<Widget> children;
  final BottomNavigationBar? navBar;
  const SingleRoute({
    super.key,
    required this.children,
    this.onPop,
    this.navBar,
  });

  @override
  State<SingleRoute> createState() => _SingleRouteState();
}

class _SingleRouteState extends State<SingleRoute> {
  late List<Widget>? children;
  late WillPopCallback? onPop;
  late BottomNavigationBar? navBar;
  @override
  void initState() {
    super.initState();
    children = widget.children;
    onPop = widget.onPop;
    navBar = widget.navBar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      bottomNavigationBar: navBar,
      body: WillPopScope(
        onWillPop: onPop,
        child: ListView.builder(
          itemCount: children?.length,
          itemBuilder: (context, index) {
            return children?[index];
          },
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
