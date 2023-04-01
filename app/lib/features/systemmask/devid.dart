import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class FakeDeviceID extends StatefulWidget {
  const FakeDeviceID({
    super.key,
  });

  @override
  State<FakeDeviceID> createState() => _FakeDeviceIDState();
}

class _FakeDeviceIDState extends State<FakeDeviceID> {
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
