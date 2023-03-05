import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gearlock/global_widgets.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({
    super.key,
  });

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget multiExpandaText(List<List<String>> content) {
      List<ExpansionPanelRadio> txtbox = [];
      for (var ctn in content) {
        txtbox.add(ExpansionPanelRadio(
          backgroundColor: const Color(0xffffffff),
          canTapOnHeader: true,
          value: ctn[0],
          headerBuilder: (context, isExpanded) => Container(
            // alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Text(
              ctn[0],
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                color: Color(0xff000000),
              ),
            ),
          ),
          body: ListTile(
            title: Text(
              ctn[1],
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
        ));
      }
      return expandaBox(0, txtbox);
    }

    return ListView.builder(
      itemCount: 11,
      itemBuilder: (context, index) {
        return [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            padding: const EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0x00000000),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
            ),
            child: topText(["GEAR", "LOCK"]),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            padding: const EdgeInsets.all(0),
            width: 86,
            height: 86,
            decoration: BoxDecoration(
              color: const Color(0x00ffffff),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
            ),
            child: SvgPicture.asset(
              "images/gearlock.svg",
              height: 64,
              width: 64,
              fit: BoxFit.contain,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 18),
            child: Text(
              "v7.4.3",
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 12,
                color: Color(0xff7b7b7b),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(36, 2, 36, 8),
            child: Text(
              "GearLock is a GUI & Recovery program developed with with lots of time, patience and love by SupremeGamers.",
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                fontSize: 13,
                color: Color(0xff000000),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text(
                  "Website: ",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Color(0xff555555),
                  ),
                ),
                Text(
                  "GearLock - aopc.dev",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Color(0xff536dfe),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 2, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text(
                  "Email: ",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Color(0xff555555),
                  ),
                ),
                Text(
                  "android@gear.lock",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
          multiExpandaText([
            [
              "Descriptions",
              """
GearLock is a dynamically written bash program focused in performance with the intension of making modifications in android-x86 easier.

It is also intended to replace the need for traditional custom-recovery software for android-x86 which are found in mobile phones.

GearLock was made in a different perspective unlike traditional custom-recovery software for mobile phones.

GearLock and everything within it are standalone programs and does not need to rely on the android system.

It can be used both GUI and TTY in a user-friendly manner, including advanced CLI usage."""
            ],
            [
              "Credits",
              """
Here I'm trying to list all of the remarkable work by others which has been used to enrich GearLock.

Without their open-minded years of hard work, GearLock wouldn't have been the same.

- The great legendary GNU communtiy for their free and opensource softwares.
> <https://www.gnu.org/software>

- Igor Pavlov (p7zip)
> <http://p7zip.sourceforge.net>

- mcmilk (p7zip zstd plugin)
> <https://github.com/mcmilk/7-Zip-zstd>

- Jack Palevich (Terminal Emulator)
> <https://github.com/jackpal/Android-Terminal-Emulator>

- Roumen Petrov (Better Terminal Emulator, Termoneplus)
> <https://gitlab.com/termapps/termoneplus>

Also thanks to

- @hmtheboy154 (Contibutor)
- @SGNight (Contibutor)
- @electrikjesus (Contributor)
- Mido Fayad (Contibutor & Donator)
- Ahmad Moemen (Contibutor)
- Diaz (Donator)
- rk (Donator)
- <https://github.com/termux/termux-packages>
- <https://github.com/opsengine/cpulimit>
- <https://github.com/landley/toybox>
- <https://github.com/osospeed/ttyecho>
- <http://e2fsprogs.sourceforge.net>
- <https://github.com/arter97/resetprop>
"""
            ],
            [
              "License",
              """
GearLock
Copyright (C) 2021  SupremeGamers

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; version 2.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
"""
            ]
          ]),
          ElevatedButton(
            onPressed: () => Clipboard.setData(
              const ClipboardData(text: "https://github.com/shadichy/gearlock"),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffffffff),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              fixedSize: Size(MediaQuery.of(context).size.width, 60),
              foregroundColor: const Color(0xff555555),
              shadowColor: Colors.transparent,
              alignment: Alignment.centerLeft,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Source code",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Icon(
                  Icons.launch,
                  color: Color(0xff6c6c6c),
                  size: 18,
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xffffffff),
            height: 12,
            thickness: 0,
            indent: 0,
            endIndent: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text(
                  "Settings",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Color(0xff6c6c6c),
                  size: 18,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(
                      "Check for update",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                    Text(
                      "New update found!",
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
                IconButton(
                  icon: const Icon(Icons.launch),
                  onPressed: () {},
                  color: const Color(0xff6c6c6c),
                  iconSize: 18,
                ),
              ],
            ),
          ),
        ][index];
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}
