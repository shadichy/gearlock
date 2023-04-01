import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class FakeRAM extends StatefulWidget {
  const FakeRAM({
    super.key,
  });

  @override
  State<FakeRAM> createState() => _FakeRAMState();
}

class _FakeRAMState extends State<FakeRAM> {
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
