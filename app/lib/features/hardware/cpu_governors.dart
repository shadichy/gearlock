import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class ChangeFreqGov extends StatefulWidget {
  const ChangeFreqGov({
    super.key,
  });

  @override
  State<ChangeFreqGov> createState() => _ChangeFreqGovState();
}

class _ChangeFreqGovState extends State<ChangeFreqGov> {
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
