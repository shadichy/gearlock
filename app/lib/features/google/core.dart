import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class GoogleStats extends StatefulWidget {
  const GoogleStats({
    super.key,
  });

  @override
  State<GoogleStats> createState() => _GoogleStatsState();
}

class _GoogleStatsState extends State<GoogleStats> {
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

class GUpdater extends StatefulWidget {
  const GUpdater({
    super.key,
  });

  @override
  State<GUpdater> createState() => _GUpdaterState();
}

class _GUpdaterState extends State<GUpdater> {
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
