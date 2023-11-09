import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';
import 'package:gearlock/core/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    ColorScheme colors = Theme.of(context).colorScheme;
    List<Widget> body = [];
    return SingleRoute(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Themes"),
        leading: IconButton(
          onPressed: () {
            if (!applied) {
              applied = true;
            } else {
              Navigator.of(context).pop();
            }
          },
          icon: Icon(
            Icons.arrow_back,
            color: colors.primary,
          ),
        ),
      ),
      children: body,
      onPop: () async {
        if (!applied) {
          applied = true;
        } else {}
        return applied;
      },
    );
  }
}
