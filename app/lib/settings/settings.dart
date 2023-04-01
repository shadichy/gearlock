import 'package:flutter/material.dart';
import 'package:gearlock/core/global_widgets.dart';

class AppSettings extends GearStatefulWidget {
  const AppSettings({
    super.key,
    required super.callbackAdd,
    required super.callGoBack,
  });

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
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
