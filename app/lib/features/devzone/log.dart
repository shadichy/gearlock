import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class ShowLog extends StatefulWidget {
  const ShowLog({
    super.key,
  });

  @override
  State<ShowLog> createState() => _ShowLogState();
}

class _ShowLogState extends State<ShowLog> {
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
