import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class FakeGraphics extends StatefulWidget {
  const FakeGraphics({
    super.key,
  });

  @override
  State<FakeGraphics> createState() => _FakeGraphicsState();
}

class _FakeGraphicsState extends State<FakeGraphics> {
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
