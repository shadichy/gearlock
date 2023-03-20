import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gearlock/global_widgets.dart';

class PackageDetail extends StatefulWidget {
  final String appName;
  // var context;
  const PackageDetail({
    super.key,
    required this.appName,
  });

  @override
  State<PackageDetail> createState() => _PackageDetailState();
}

class _PackageDetailState extends State<PackageDetail> {
  String appTitle = "";
  String appIcon = "";
  String appDescription = "";
  String appAuthor = "";
  String appVersion = "";
  String appInsDate = "";
  String appFileList = "";
  bool appPkgtype = true;
  // late BuildContext ctx;

  @override
  void initState() {
    super.initState();
    appTitle = widget.appName;
    // ctx = widget.context;
  }

  @override
  Widget build(BuildContext context) {
    Widget singleExpandaText(String title, String content) {
      return expandaBox(0, [
        ExpansionPanelRadio(
          backgroundColor: const Color(0xffffffff),
          canTapOnHeader: true,
          value: title,
          headerBuilder: (context, isExpanded) => ListTile(
            title: textRow(title, Null),
          ),
          body: ListTile(
            title: Text(
              content,
              textAlign: TextAlign.start,
              // maxLines: 1,
              overflow: TextOverflow.clip,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
      ]);
    }

    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: Navigator.of(context).pop,
                  color: const Color(0xff303f9f),
                  iconSize: 24,
                  splashRadius: 24,
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                  color: const Color(0xff303f9f),
                  iconSize: 24,
                  splashRadius: 24,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: appIcon.isEmpty
                      ? SvgPicture.asset("images/gearlock.svg",
                          fit: BoxFit.contain)
                      : appIcon.endsWith(".svg")
                          ? SvgPicture.file(File(appIcon), fit: BoxFit.contain)
                          : Image.file(File(appIcon), fit: BoxFit.cover),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
            child: Text(
              appTitle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                color: Color(0xff303f9f),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Icon(
                      Icons.launch,
                      color: Color(0xff536dfe),
                      size: 24,
                    ),
                    Text(
                      "Launch",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        color: Color(0xff536dfe),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Icon(
                      Icons.delete,
                      color: Color(0xff536dfe),
                      size: 24,
                    ),
                    Text(
                      "Uninstall",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        color: Color(0xff536dfe),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          singleExpandaText("Description", appDescription),
          simpleTextBox(context, "Author", appAuthor),
          simpleTextBox(context, "Type", appPkgtype ? "Package" : "Extension"),
          simpleTextBox(context, "Version", appVersion),
          simpleTextBox(context, "Installed Date", appInsDate),
          singleExpandaText("File list", appFileList),
        ][index];
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}
