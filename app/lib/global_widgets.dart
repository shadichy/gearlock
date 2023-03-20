import 'package:flutter/material.dart';

Widget topText(List<String> txt) {
  List<Widget> out = [];
  List<int> colorCode = [0xff000000, 0xff303f9f];
  for (var i = 0; i < 2; i++) {
    out.add(Text(
      txt[i],
      textAlign: TextAlign.start,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.normal,
        fontSize: 20,
        color: Color(colorCode[i]),
      ),
    ));
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: out,
  );
}

Widget headingText(String text, int color) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
    child: Text(
      text,
      textAlign: TextAlign.start,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 18,
        color: Color(color),
      ),
    ),
  );
}

Widget separaText(String text) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(24, 8, 0, 0),
    child: Text(
      text,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        fontSize: 12,
        color: Color(0xff929292),
      ),
    ),
  );
}

Widget expandaBox(double padding, List<ExpansionPanelRadio> children) {
  return ExpansionPanelList.radio(
    elevation: 0,
    expandedHeaderPadding: EdgeInsets.all(padding),
    dividerColor: const Color(0xffffffff),
    children: children,
  );
}

Row textRow(String title, content) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Text(
        "$title: ",
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff555555),
        ),
      ),
      if (content is Widget) content
    ],
  );
}

Widget baseTextBox(context, Row child) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
    padding: const EdgeInsets.all(0),
    width: MediaQuery.of(context).size.width,
    height: 50,
    decoration: const BoxDecoration(
      color: Color(0x00000000),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.zero,
    ),
    child: child,
  );
}

Widget simpleTextBox(context, String title, String content) {
  return baseTextBox(
    context,
    textRow(
      title,
      Text(
        content,
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff000000),
        ),
      ),
    ),
  );
}

class GearStatefulWidget extends StatefulWidget {
  final void Function(GearStatefulWidget page) callbackAdd;
  final void Function() callGoBack;
  final bool isFininshed;
  const GearStatefulWidget({
    super.key,
    required this.callbackAdd,
    required this.callGoBack,
    this.isFininshed = false,
  });

  @override
  State<GearStatefulWidget> createState() => _GearStatefulWidgetState();
}

class _GearStatefulWidgetState extends State<GearStatefulWidget> {
  late bool isFininshed;
  @override
  void initState() {
    isFininshed = false;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) => throw UnimplementedError();

}
