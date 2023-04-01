import 'package:flutter/material.dart';

class PackageDownload extends StatefulWidget {
  final String appUrl;
  const PackageDownload({
    super.key,
    required this.appUrl,
  });

  @override
  State<PackageDownload> createState() => _PackageDownloadState();
}

class _PackageDownloadState extends State<PackageDownload> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: () => Navigator.of(context).pop(),
              color: const Color(0xff212435),
              iconSize: 24,
              splashRadius: 24,
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
              color: const Color(0xff212435),
              iconSize: 24,
              splashRadius: 24,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0x00000000),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(
                      "GearLock - Custom Recovery Replacement for Android-x86 ",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                    Text(
                      "7.3.3",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                        color: Color(0xff929292),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Icon(
                Icons.person,
                color: Color(0xff212435),
                size: 24,
              ),
              Text(
                "AXON",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
              ),
              Icon(
                Icons.star_border,
                color: Color(0xff212435),
                size: 24,
              ),
              Text(
                "4.5",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Color(0xff212435),
                size: 24,
              ),
              Text(
                "148k",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
              ),
              Icon(
                Icons.save,
                color: Color(0xff212435),
                size: 24,
              ),
              Text(
                "70MB",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
              ),
              Icon(
                Icons.code,
                color: Color(0xff212435),
                size: 24,
              ),
              Text(
                "Min SDK 26",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
              ),
              Icon(
                Icons.calendar_today,
                color: Color(0xff212435),
                size: 24,
              ),
              Text(
                "99/9/2023",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                decoration: BoxDecoration(
                  color: const Color(0x00000000),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(2.0),
                  border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
                ),
                child: const Text(
                  "android-x86-recovery",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Color(0xff929292),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                decoration: BoxDecoration(
                  color: const Color(0x00000000),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(2.0),
                  border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
                ),
                child: const Text(
                  "custom-kernel-installer",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Color(0xff929292),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          "GearLock is a command line program to help you customize & install custom software in your android-x86 OS. It has the capability of running in both GUI and TERMINAL with a early-recovery mode. GearLock has been a part of DarkMatter project until now, but I decided to make it universal for any android-x86 OS :)",
          textAlign: TextAlign.start,
          overflow: TextOverflow.clip,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff000000),
          ),
        ),
      ),
      const Text(
        "More details",
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff000000),
        ),
      ),
      const Text(
        "Changelog",
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff000000),
        ),
      ),
      const Text(
        "Reviews",
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff000000),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(
                      "4.5",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child:

                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          Image(
                        image:
                            NetworkImage("https://picsum.photos/250?image=9"),
                        height: 24,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                  child: Text(
                    "58 ratings",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0x00000000),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
              ),
              child: const Text(
                "Rate",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0x00000000),
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0x4d9e9e9e), width: 1),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "ambarish",
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Text(
                              "3/8/2022",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                color: Color(0xff000000),
                              ),
                            ),
                            Text(
                              " * v7.3.3",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),

                        ///***If you have exported images you must have to copy those images in assets/images directory.
                        const Image(
                          image:
                              NetworkImage("https://picsum.photos/250?image=9"),
                          height: 24,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Icon(
                      Icons.expand_less,
                      color: Color(0xff212435),
                      size: 24,
                    ),
                    Text(
                      "-1",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    ),
                    Icon(
                      Icons.expand_more,
                      color: Color(0xff212435),
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              """hi, team gearlock, after installing GEARLOCK .i got error message "strderr" /gearlock/bin/bash  OS: Androidx86 4.4 (kitkat) please help... Thanks.""",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color(0xff000000),
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        // alignment: Alignment.topLeft,
        children: [
          ListView.builder(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
            itemCount: body.length,
            itemBuilder: (context, index) {
              return body[index];
            },
            physics: const BouncingScrollPhysics(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MaterialButton(
              onPressed: () {},
              color: const Color(0xff3f51b5),
              elevation: 1,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              // padding: EdgeInsets.all(0),
              textColor: const Color(0xffffffff),
              height: 54,
              minWidth: MediaQuery.of(context).size.width,
              child: const Text(
                "INSTALL ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
