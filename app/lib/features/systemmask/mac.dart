import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class FakeMAC extends StatefulWidget {
  const FakeMAC({
    super.key,
  });

  @override
  State<FakeMAC> createState() => _FakeMACState();
}

class _FakeMACState extends State<FakeMAC> {
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
