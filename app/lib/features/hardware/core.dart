import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class HwTweaksDashboard extends StatefulWidget {
  const HwTweaksDashboard({
    super.key,
  });

  @override
  State<HwTweaksDashboard> createState() => _HwTweaksDashboardState();
}

class _HwTweaksDashboardState extends State<HwTweaksDashboard> {
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
