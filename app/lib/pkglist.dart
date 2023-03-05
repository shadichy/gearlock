import 'package:flutter/material.dart';
import 'package:gearlock/global_widgets.dart';

class PkgList extends StatefulWidget {
  const PkgList({
    super.key,
  });

  @override
  State<PkgList> createState() => _PkgListState();
}

class _PkgListState extends State<PkgList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget packageBox(String appTitle, String appSize, Widget appIcon) {
      return ElevatedButton(
        onPressed: () => {Navigator.pushNamed(context, '/package')},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          backgroundColor: const Color(0xffffffff),
          foregroundColor: const Color(0xff555555),
          shadowColor: Colors.transparent,
          alignment: Alignment.centerLeft,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
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
                      appTitle,
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
      );
    }

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
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          fixedSize: Size(MediaQuery.of(context).size.width, 40),
          shadowColor: Colors.transparent,
          elevation: 0,
          foregroundColor: const Color(0xff555555),
          backgroundColor: const Color(0xffffffff),
          alignment: Alignment.centerLeft,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const [
            Icon(
              Icons.add,
              // onPressed: () {},
              color: Color(0xff3f51b5),
              size: 24,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Text(
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
          ],
        ),
      ),
      packageBox(
        "Kernel 5.10.58-GoogleLTS-xanmod1-pledge",
        "187MB",
        const Image(
          image: AssetImage("images/gearlock.png"),
          height: 32,
          width: 32,
          fit: BoxFit.contain,
        ),
      ),
      packageBox(
        "Microcode",
        "2MB",
        const Image(
          image: AssetImage("images/gearlock.png"),
          height: 32,
          width: 32,
          fit: BoxFit.contain,
        ),
      ),
      packageBox(
        "Toolbox",
        "18MB",
        const Image(
          image: AssetImage("images/gearlock.png"),
          height: 32,
          width: 32,
          fit: BoxFit.contain,
        ),
      ),
      packageBox(
        "Kernel 5.4.102-GoogleLTS-sakura-pledge",
        "156MB",
        const Image(
          image: AssetImage("images/gearlock.png"),
          height: 32,
          width: 32,
          fit: BoxFit.contain,
        ),
      ),
      packageBox(
        "Linux Firmware",
        "200MB",
        const Image(
          image: AssetImage("images/gearlock.png"),
          height: 32,
          width: 32,
          fit: BoxFit.contain,
        ),
      ),
      packageBox(
        "Gaming Protocol",
        "6MB",
        const Image(
          image: AssetImage("images/gearlock.png"),
          height: 32,
          width: 32,
          fit: BoxFit.contain,
        ),
      ),
    ];
    return ListView.builder(
      itemCount: (body.length < 20) ? body.length : 20,
      itemBuilder: (context, index) {
        return body[index];
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}
