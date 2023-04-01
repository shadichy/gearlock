import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class Updater extends StatefulWidget {
  const Updater({
    super.key,
  });

  @override
  State<Updater> createState() => _UpdaterState();
}

class _UpdaterState extends State<Updater> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [];
    return SingleRoute(
      children: body,
      onPop: () async {
        bool confirm = false;
        if (!confirm) {
          //
        }
        return confirm;
      },
    );
  }
}
