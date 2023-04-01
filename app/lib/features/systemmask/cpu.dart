import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class FakeCPU extends StatefulWidget {
  const FakeCPU({
    super.key,
  });

  @override
  State<FakeCPU> createState() => _FakeCPUState();
}

class _FakeCPUState extends State<FakeCPU> {
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
