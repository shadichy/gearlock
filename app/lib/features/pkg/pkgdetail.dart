import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gearlock/core/expansion_panel.dart';
import 'package:gearlock/core/home_widgets.dart';

class PackageDetail extends StatefulWidget {
  final String appID;
  // var context;
  const PackageDetail({
    super.key,
    required this.appID,
  });

  @override
  State<PackageDetail> createState() => _PackageDetailState();
}

class _PackageDetailState extends State<PackageDetail> {
  late String appID;
  String appTitle = "";
  String appIcon = "";
  String appDescription = "";
  String appAuthor = "Gearlock";
  String appVersion = "0.0.0";
  String appArch = "x86_64";
  String appInsDate = "00/00/0000";
  String appFileList = "";
  bool isPackage = true;
  // late BuildContext ctx;

  @override
  void initState() {
    super.initState();
    appID = widget.appID;
    appTitle = appID;
    // ctx = widget.context;
  }

  @override
  Widget build(BuildContext context) {
    Widget singleExpandaText(String title, String content) {
      return expandaBox(0, [
        NoGapExpansionPanelRadio(
          // backgroundColor: const Color(0xffffffff),
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
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ]);
    }

    List<Widget> body = [
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
              color: Theme.of(context).colorScheme.primary,
              iconSize: 28,
              splashRadius: 24,
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
              color: Theme.of(context).colorScheme.primary,
              iconSize: 28,
              splashRadius: 24,
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          // border: Border.all(
          //   color: Theme.of(context).colorScheme.outlineVariant,
          //   width: 1,
          // ),
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    width: 1),
              ),
              child: appIcon.isEmpty
                  ? SvgPicture.asset("images/gearlock.svg",
                      fit: BoxFit.contain)
                  : appIcon.endsWith(".svg")
                      ? SvgPicture.file(File(appIcon),
                          fit: BoxFit.contain)
                      : Image.file(File(appIcon), fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
              child: Text(
                appTitle,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
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
                    children: [
                      Icon(
                        Icons.launch,
                        color: Theme.of(context).colorScheme.primary,
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
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.primary,
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
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      singleExpandaText("Description", appDescription),
      simpleTextBox(context, "Author", appAuthor),
      simpleTextBox(context, "Type", isPackage ? "Package" : "Extension"),
      simpleTextBox(context, "Version", appVersion),
      simpleTextBox(context, "Installed Date", appInsDate),
      singleExpandaText("File list", appFileList),
    ];

    return ListView.builder(
      itemCount: body.length,
      itemBuilder: (context, index) {
        return body[index];
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}
