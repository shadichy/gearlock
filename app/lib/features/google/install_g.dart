import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class InstallGapps extends StatefulWidget {
  const InstallGapps({
    super.key,
  });

  @override
  State<InstallGapps> createState() => _InstallGappsState();
}

class _InstallGappsState extends State<InstallGapps> {
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

class InstallMicroG extends StatefulWidget {
  const InstallMicroG({
    super.key,
  });

  @override
  State<InstallMicroG> createState() => _InstallMicroGState();
}

class _InstallMicroGState extends State<InstallMicroG> {
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
