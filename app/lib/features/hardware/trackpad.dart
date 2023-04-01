import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class TouchpadTweak extends StatefulWidget {
  const TouchpadTweak({
    super.key,
  });

  @override
  State<TouchpadTweak> createState() => _TouchpadTweakState();
}

class _TouchpadTweakState extends State<TouchpadTweak> {
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
