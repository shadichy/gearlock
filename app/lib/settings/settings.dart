import 'package:flutter/material.dart';
import 'package:gearlock/core/global_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs extends GearStatefulWidget {
  const AppPrefs({
    super.key,
    required super.callbackAdd,
    required super.callGoBack,
  });

  @override
  State<AppPrefs> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppPrefs> {
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
