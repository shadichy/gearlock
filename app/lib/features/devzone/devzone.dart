import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class DevZone extends StatefulWidget {
  const DevZone({
    super.key,
  });

  @override
  State<DevZone> createState() => _DevZoneState();
}

class _DevZoneState extends State<DevZone> {
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
