import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class SuHandler extends StatefulWidget {
  const SuHandler({
    super.key,
  });

  @override
  State<SuHandler> createState() => _SuHandlerState();
}

class _SuHandlerState extends State<SuHandler> {
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

class UpdateMagisk extends StatefulWidget {
  const UpdateMagisk({
    super.key,
  });

  @override
  State<UpdateMagisk> createState() => _UpdateMagiskState();
}

class _UpdateMagiskState extends State<UpdateMagisk> {
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
