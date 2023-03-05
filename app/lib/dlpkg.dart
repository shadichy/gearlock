import 'package:flutter/material.dart';
import 'package:gearlock/global_widgets.dart';

class DownloadPkg extends StatefulWidget {
  const DownloadPkg({
    super.key,
  });

  @override
  State<DownloadPkg> createState() => _DownloadPkgState();
}

class _DownloadPkgState extends State<DownloadPkg> {
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
