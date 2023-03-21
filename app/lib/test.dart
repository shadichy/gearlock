import 'package:flutter/material.dart';
import 'package:gearlock/global_widgets.dart';

class TestTemplate extends GearStatefulWidget {
  TestTemplate({
    super.key,
    required super.callbackAdd,
    required super.callGoBack,
    required super.preventBack,
  });

  @override
  State<TestTemplate> createState() => _TestTemplateState();
}

class _TestTemplateState extends State<TestTemplate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
