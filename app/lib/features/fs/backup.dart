import 'package:flutter/material.dart';

class FsBackup extends StatefulWidget {
  const FsBackup({
    super.key,
  });

  @override
  State<FsBackup> createState() => _FsBackupState();
}

class _FsBackupState extends State<FsBackup> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [];
    return Container(
      child: ListView.builder(
        itemCount: body.length,
        itemBuilder: (context, index) {
          return body[index];
        },
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
