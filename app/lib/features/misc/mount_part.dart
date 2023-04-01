import 'package:flutter/material.dart';
import 'package:gearlock/core/single_route.dart';

class MountPartition extends StatefulWidget {
  const MountPartition({
    super.key,
  });

  @override
  State<MountPartition> createState() => _MountPartitionState();
}

class _MountPartitionState extends State<MountPartition> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [];
    return SingleRoute(children: body, onPop: () async => true);
  }
}
