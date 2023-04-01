import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoGearLock extends StatefulWidget {
  const NoGearLock({
    super.key,
  });

  @override
  State<NoGearLock> createState() => _NoGearLockState();
}

class _NoGearLockState extends State<NoGearLock> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SvgPicture.asset(
              "images/gearlock.svg",
              fit: BoxFit.contain,
              width: 100,
              height: 100,
            ),
          ),
          const ListTile(
            title: Text(
              "GEARLOCK NOT FOUND!",
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                color: Color(0xff303f9f),
              ),
            ),
            subtitle: Text(
              "Please install this app on device that has GearLock installed",
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                fontSize: 12,
                color: Color(0xff929292),
              ),
            ),
          )
        ],
      ),
    );
  }
}
