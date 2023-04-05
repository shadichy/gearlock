import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gearlock/core/expansion_panel.dart';
import 'package:gearlock/core/global_widgets.dart';
import 'package:gearlock/core/home_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gearlock/settings/settings.dart';
import 'package:gearlock/settings/update.dart';

class AboutPage extends GearStatefulWidget {
  const AboutPage({
    super.key,
    required super.callbackAdd,
    required super.callGoBack,
  });

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
    Widget multiExpandaText(List<List<String>> content) {
      List<NoGapExpansionPanelRadio> txtbox = [];
      for (var ctn in content) {
        txtbox.add(NoGapExpansionPanelRadio(
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
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          body: ListTile(
            title: Text(
              ctn[1],
              textAlign: TextAlign.start,
              // maxLines: 1,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ));
      }
      return expandaBox(0, txtbox);
    }

    List<Widget> body = [
      // Container(
      //   alignment: Alignment.center,
      //   margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      //   padding: const EdgeInsets.all(0),
      //   width: MediaQuery.of(context).size.width,
      //   height: 50,
      //   decoration: const BoxDecoration(
      //     color: Color(0x00000000),
      //     shape: BoxShape.rectangle,
      //     borderRadius: BorderRadius.zero,
      //   ),
      //   child: topText(["GEAR", "LOCK"]),
      // ),
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
      Padding(
        padding: const EdgeInsets.fromLTRB(36, 2, 36, 8),
        child: Text(
          AppLocalizations.of(context)!.briefdesc,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
            fontSize: 13,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "${AppLocalizations.of(context)!.website}: ",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
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
                color: Theme.of(context).colorScheme.primary,
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
          children: [
            Text(
              "${AppLocalizations.of(context)!.email}: ",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
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
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
      multiExpandaText([
        [
          AppLocalizations.of(context)!.descriptions,
          AppLocalizations.of(context)!.fulldesc,
        ],
        [
          AppLocalizations.of(context)!.credits,
          AppLocalizations.of(context)!.fullcredits,
        ],
        [
          AppLocalizations.of(context)!.license,
          AppLocalizations.of(context)!.fulllicense,
        ]
      ]),
      ElevatedButton(
        onPressed: () => Clipboard.setData(
          const ClipboardData(text: "https://github.com/shadichy/gearlock"),
        ),
        style: ElevatedButton.styleFrom(
          // backgroundColor: const Color(0xffffffff),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          fixedSize: Size(MediaQuery.of(context).size.width, 60),
          foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
          shadowColor: Colors.transparent,
          alignment: Alignment.centerLeft,
          shape: const RoundedRectangleBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                AppLocalizations.of(context)!.srccode,
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const Icon(
              Icons.launch,
              color: Color(0xff6c6c6c),
              size: 18,
            ),
          ],
        ),
      ),
      ElevatedButton(
        onPressed: () => callbackAdd(
          AppSettings(callbackAdd: callbackAdd, callGoBack: callGoBack),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.all(16),
          fixedSize: Size(MediaQuery.of(context).size.width, 60),
          foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              AppLocalizations.of(context)!.settings,
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const Icon(
              Icons.settings,
              color: Color(0xff6c6c6c),
              size: 18,
            ),
          ],
        ),
      ),
      ElevatedButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Updater(),
        )),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          // fixedSize: Size(MediaQuery.of(context).size.width, 60),
          foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
          shadowColor: Colors.transparent,
          alignment: Alignment.centerLeft,
          shape: const RoundedRectangleBorder(),
          padding: const EdgeInsets.all(16),
        ),
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
                Text(
                  AppLocalizations.of(context)!.checkupdate,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.foundupdate,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
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
