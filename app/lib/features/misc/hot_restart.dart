import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class HotRestart extends StatefulWidget {
  const HotRestart({
    super.key,
  });

  @override
  State<HotRestart> createState() => _HotRestartState();
}

class _HotRestartState extends State<HotRestart> {
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
