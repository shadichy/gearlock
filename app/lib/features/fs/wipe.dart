import 'package:flutter/material.dart';

class FsWipe extends StatefulWidget {
  const FsWipe({
    super.key,
  });

  @override
  State<FsWipe> createState() => _FsWipeState();
}

class _FsWipeState extends State<FsWipe> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [Text("wipe")];
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
