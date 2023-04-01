import 'package:flutter/material.dart';

class FsRestore extends StatefulWidget {
  const FsRestore({
    super.key,
  });

  @override
  State<FsRestore> createState() => _FsRestoreState();
}

class _FsRestoreState extends State<FsRestore> {
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
