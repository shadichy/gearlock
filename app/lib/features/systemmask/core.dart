import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class SmaskDashboard extends StatefulWidget {
  const SmaskDashboard({
    super.key,
  });

  @override
  State<SmaskDashboard> createState() => _SmaskDashboardState();
}

class _SmaskDashboardState extends State<SmaskDashboard> {
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
