import 'package:flutter/material.dart';
import 'package:gearlock/global_widgets.dart';

class TestTemplate extends StatefulWidget {
  final void Function(Widget page) callbackAdd;
  const TestTemplate({
    super.key,
    required this.callbackAdd,
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
    List<Widget> body = [];
    return ListView.builder(
      itemCount: body.length,
      itemBuilder: (context, index) {
        return body[index];
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}
