import 'package:flutter/material.dart';

class FsResize extends StatefulWidget {
  const FsResize({
    super.key,
  });

  @override
  State<FsResize> createState() => _FsResizeState();
}

class _FsResizeState extends State<FsResize> {
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
