import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class MiscDashboard extends StatefulWidget {
  const MiscDashboard({
    super.key,
  });

  @override
  State<MiscDashboard> createState() => _MiscDashboardState();
}

class _MiscDashboardState extends State<MiscDashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [];
    return SingleRoute(children: body, onPop: () async => true);
  }
}
