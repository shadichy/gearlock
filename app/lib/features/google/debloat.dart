import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class DeBloater extends StatefulWidget {
  const DeBloater({
    super.key,
  });

  @override
  State<DeBloater> createState() => _DeBloaterState();
}

class _DeBloaterState extends State<DeBloater> {
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
