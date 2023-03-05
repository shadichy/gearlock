import 'package:flutter/material.dart';
import 'package:gearlock/global_widgets.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({
    super.key,
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
      itemCount: (body.length < 20) ? body.length : 20,
      itemBuilder: (context, index) {
        return body[index];
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}
