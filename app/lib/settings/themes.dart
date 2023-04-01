import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({
    super.key,
  });

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  bool applied = false;
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
        if (!applied) {
          //
        }
        return applied;
      },
    );
  }
}
