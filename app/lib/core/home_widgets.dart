import 'package:flutter/material.dart';
import 'package:gearlock/core/expansion_panel.dart';

Widget topText(List<String> txt, List<Color> colorCode) {
  List<Widget> out = [];
  for (var i = 0; i < 2; i++) {
    out.add(Text(
      txt[i],
      textAlign: TextAlign.start,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.normal,
        fontSize: 20,
        color: colorCode[i],
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

Widget headingText(String text, Color color) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(30, 8, 0, 8),
    child: Text(
      text,
      textAlign: TextAlign.start,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 20,
        color: color,
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

Widget expandaBox(double padding, List<NoGapExpansionPanelRadio> children) {
  return NoGapExpansionPanelList.radio(
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

Widget simpleTextBox(BuildContext context, String title, String content) {
  return baseTextBox(
    context,
    textRow(
      title,
      Text(
        content,
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    ),
  );
}
