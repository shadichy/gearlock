import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class DualPopingSound extends StatefulWidget {
  const DualPopingSound({
    super.key,
  });

  @override
  State<DualPopingSound> createState() => _DualPopingSoundState();
}

class _DualPopingSoundState extends State<DualPopingSound> {
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

class AlsaPreset extends StatefulWidget {
  const AlsaPreset({
    super.key,
  });

  @override
  State<AlsaPreset> createState() => _AlsaPresetState();
}

class _AlsaPresetState extends State<AlsaPreset> {
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
