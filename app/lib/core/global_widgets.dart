import 'package:flutter/material.dart';

class GearStatefulWidget extends StatefulWidget {
  final void Function(GearStatefulWidget page) callbackAdd;
  final void Function() callGoBack;
  const GearStatefulWidget({
    super.key,
    required this.callbackAdd,
    required this.callGoBack,
  });

  @override
  State<GearStatefulWidget> createState() => _GearStatefulWidgetState();
}

class _GearStatefulWidgetState extends State<GearStatefulWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => throw UnimplementedError();
}
