import 'package:flutter/material.dart';
import 'package:gearlock/global_widgets.dart';

class SearchPkg extends StatefulWidget {
  const SearchPkg({
    super.key,
  });

  @override
  State<SearchPkg> createState() => _SearchPkgState();
}

class _SearchPkgState extends State<SearchPkg> {
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
