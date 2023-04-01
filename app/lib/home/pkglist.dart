import 'package:flutter/material.dart';
import 'package:gearlock/core/global_widgets.dart';
import 'package:gearlock/core/home_widgets.dart';
import 'package:animations/animations.dart';
import 'package:gearlock/features/pkg/pkgdetail.dart';
import 'package:gearlock/features/pkg/searchpkg.dart';

class PkgPreview extends StatefulWidget {
  final String appID;
  final String appName;
  final String appSize;
  final Widget appIcon;
  const PkgPreview({
    super.key,
    required this.appID,
    required this.appName,
    required this.appSize,
    required this.appIcon,
  });

  @override
  State<PkgPreview> createState() => _PkgPreviewState();
}

class _PkgPreviewState extends State<PkgPreview> {
  late final String appID;
  late final String appName;
  late final String appSize;
  late final Widget appIcon;
  @override
  void initState() {
    super.initState();
    appID = widget.appID;
    appName = widget.appName;
    appSize = widget.appSize;
    appIcon = widget.appIcon;
  }

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (context, closedF) => Container(
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0x00000000),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
              ),
              child: appIcon,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      appName,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                    Text(
                      appSize,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      openBuilder: (context, openF) => PackageDetail(appID: appID),
      closedElevation: 0,
      transitionDuration: const Duration(milliseconds: 500),
      transitionType: ContainerTransitionType.fadeThrough,
    );
  }
}

class PkgList extends GearStatefulWidget {
  const PkgList({
    super.key,
    required super.callbackAdd,
    required super.callGoBack,
  });

  @override
  State<PkgList> createState() => _PkgListState();
}

class _PkgListState extends State<PkgList> {
  late final void Function(GearStatefulWidget page) callbackAdd;
  late final void Function() callGoBack;

  @override
  void initState() {
    super.initState();
    callbackAdd = widget.callbackAdd;
    callGoBack = widget.callGoBack;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Icon(
                Icons.search,
                color: Color(0xff303f9f),
                size: 24,
              ),
            ),
            topText(["INSTALLED ", "PACKAGES"]),
            Container(
              alignment: Alignment.center,
              child: const Icon(
                Icons.more_vert,
                color: Color(0xff303f9f),
                size: 24,
              ),
            ),
          ],
        ),
      ),
      ListTile(
        onTap: () => callbackAdd(
          SearchPkg(callbackAdd: callbackAdd, callGoBack: callGoBack),
        ),
        leading: const Icon(
          Icons.add,
          // onPressed: () {},
          color: Color(0xff3f51b5),
          size: 24,
        ),
        title: const Text(
          "Add package",
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff3f51b5),
          ),
        ),
      ),
      const PkgPreview(
        appID: "kernel510-xanmod",
        appName: "Kernel 5.10.58-GoogleLTS-xanmod1-pledge",
        appSize: "187MB",
        appIcon: Image(
          image: AssetImage("images/gearlock.png"),
          height: 32,
          width: 32,
          fit: BoxFit.contain,
        ),
      ),
      const PkgPreview(
        appID: "ucode",
        appName: "Microcode",
        appSize: "2MB",
        appIcon: Image(
          image: AssetImage("images/gearlock.png"),
          height: 32,
          width: 32,
          fit: BoxFit.contain,
        ),
      ),
      const PkgPreview(
        appID: "toolbox",
        appName: "Toolbox",
        appSize: "18MB",
        appIcon: Image(
          image: AssetImage("images/gearlock.png"),
          height: 32,
          width: 32,
          fit: BoxFit.contain,
        ),
      ),
      const PkgPreview(
        appID: "kernel54-pledge",
        appName: "Kernel 5.4.102-GoogleLTS-sakura-pledge",
        appSize: "156MB",
        appIcon: Image(
          image: AssetImage("images/gearlock.png"),
          height: 32,
          width: 32,
          fit: BoxFit.contain,
        ),
      ),
      const PkgPreview(
        appID: "firmware",
        appName: "Linux Firmware",
        appSize: "200MB",
        appIcon: Image(
          image: AssetImage("images/gearlock.png"),
          height: 32,
          width: 32,
          fit: BoxFit.contain,
        ),
      ),
      const PkgPreview(
        appID: "houdini",
        appName: "Gaming Protocol",
        appSize: "6MB",
        appIcon: Image(
          image: AssetImage("images/gearlock.png"),
          height: 32,
          width: 32,
          fit: BoxFit.contain,
        ),
      ),
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
