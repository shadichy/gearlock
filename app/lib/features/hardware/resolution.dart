import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class ChangeResolution extends StatefulWidget {
  const ChangeResolution({
    super.key,
  });

  @override
  State<ChangeResolution> createState() => _ChangeResolutionState();
}

class _ChangeResolutionState extends State<ChangeResolution> {
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
