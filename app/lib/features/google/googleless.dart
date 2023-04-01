import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class GoogleLess extends StatefulWidget {
  const GoogleLess({
    super.key,
  });

  @override
  State<GoogleLess> createState() => _GoogleLessState();
}

class _GoogleLessState extends State<GoogleLess> {
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
