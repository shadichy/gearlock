import 'package:flutter/material.dart';
import 'package:gearlock/dlpkg.dart';
import 'dart:math';

import 'package:gearlock/global_widgets.dart';
// import 'package:gearlock/global_widgets.dart';
// import 'package:gearlock/searchresult.dart';

List terms = ["gearlock", "lmao", "bruh"];

List searchKeyword(String query) {
  List matchQuery = [
    const PkgByKeyword(
        icon:
            "https://www.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png",
        name: "gearlock")
  ];
  for (var keyword in terms) {
    if (keyword.toLowerCase().contains(query.trim().toLowerCase())) {
      matchQuery.add(keyword);
    }
  }
  return matchQuery;
}

class PkgByKeyword {
  final String icon;
  final String name;
  const PkgByKeyword({
    required this.icon,
    required this.name,
  });
}

class SearchPkg extends GearStatefulWidget {
  SearchPkg({
    super.key,
    required super.callbackAdd,
    required super.callGoBack,
    required super.preventBack,
  });

  @override
  State<SearchPkg> createState() => _SearchPkgState();
}

class _SearchPkgState extends State<SearchPkg> {
  late final void Function(GearStatefulWidget page) callbackAdd;
  late final void Function() callGoBack;

  @override
  void initState() {
    super.initState();
    callbackAdd = widget.callbackAdd;
    callGoBack = widget.callGoBack;
  }

  void goToSearch() {
    showSearch(
      context: context,
      delegate: SearchBox(
        callbackAdd: callbackAdd,
        callGoBack: callGoBack,
      ),
    );
  }

  void backToSearch() {}

  void goToDownloadPackage(String appUrl) {
    callbackAdd(PackageDownload(
      callbackAdd: callbackAdd,
      callGoBack: callGoBack,
      preventBack: () {},
      appUrl: appUrl,
    ));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      Container(
        height: 54,
        padding: const EdgeInsets.only(left: 4),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => callGoBack(),
              color: const Color(0xff303f9f),
              iconSize: 24,
              splashRadius: 24,
              // padding: const EdgeInsets.only(right: 8),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: goToSearch,
                style: ElevatedButton.styleFrom(
                  // padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  // minimumSize: Size(MediaQuery.of(context).size.width * .7, 36),
                  // maximumSize: Size(MediaQuery.of(context).size.width * .8, 36),
                  minimumSize: const Size.fromHeight(36),
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  foregroundColor: const Color(0xff929292),
                  backgroundColor: const Color(0xffffffff),
                  alignment: Alignment.centerLeft,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    // side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  // margin: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // alignment: Alignment.centerLeft,
                ),
                // height: 44,
                child: const Text(
                  "Search packages or extensions",
                  style: TextStyle(
                      // color: Color(0x000000ff),
                      fontSize: 14),
                ),
              ),
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

class SearchBox extends SearchDelegate {
  final void Function(GearStatefulWidget page) callbackAdd;
  final void Function() callGoBack;
  SearchBox({
    required this.callbackAdd,
    required this.callGoBack,
  });

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear),
          iconSize: 24,
          splashRadius: 24,
        ),
        IconButton(
          onPressed: () => showResults(context),
          icon: const Icon(Icons.search_rounded),
          iconSize: 24,
          splashRadius: 24,
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back),
        iconSize: 24,
        splashRadius: 24,
      );

  @override
  Widget buildResults(BuildContext context) => SearchResultsOf(
        keyword: query,
        callbackAdd: callbackAdd,
        callGoBack: callGoBack,
        close: close,
        preventBack: () {},
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchQuery = searchKeyword(query);
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) => (matchQuery[index] is PkgByKeyword)
          ? ListTile(
              onTap: () {
                close(context, null);
                callbackAdd(PackageDownload(
                  callbackAdd: callbackAdd,
                  callGoBack: callGoBack,
                  preventBack: () {},
                  appUrl: "",
                ));
              },
              leading: Image(
                image: NetworkImage(matchQuery[index].icon),
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.grid_view,
                  size: 32,
                ),
                width: 32,
                height: 32,
              ),
              title: Text(
                matchQuery[index].name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            )
          : ListTile(
              onTap: () {
                query = matchQuery[index].toString();
                showResults(context);
              },
              leading: const SizedBox(
                width: 32,
                height: 32,
              ),
              title: Text(matchQuery[index].toString()),
              trailing: IconButton(
                onPressed: () {
                  query = "${matchQuery[index]} ";
                },
                icon: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: const Icon(Icons.arrow_outward),
                ),
                iconSize: 24,
                splashRadius: .00000001,
                padding: const EdgeInsets.all(0),
                color: const Color(0xaa000000),
              ),
            ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) =>
      super.appBarTheme(context).copyWith(
            appBarTheme: super.appBarTheme(context).appBarTheme.copyWith(
                  elevation: 0.0,
                  toolbarHeight: 54,
                ),
          );
}

class SearchResultsOf extends GearStatefulWidget {
  final String keyword;
  final void Function(BuildContext context, dynamic result) close;
  SearchResultsOf({
    super.key,
    required super.callbackAdd,
    required super.callGoBack,
    required this.keyword,
    required this.close,
    required super.preventBack,
  });

  @override
  State<SearchResultsOf> createState() => _SearchResultsOfState();
}

class _SearchResultsOfState extends State<SearchResultsOf> {
  late final String keyword;

  late final void Function(GearStatefulWidget page) callbackAdd;
  late final void Function() callGoBack;
  late final void Function(BuildContext context, dynamic result) close;
  @override
  void initState() {
    super.initState();
    callbackAdd = widget.callbackAdd;
    callGoBack = widget.callGoBack;
    keyword = widget.keyword;

    close = widget.close;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      ElevatedButton(
        onPressed: () {
          close(context, null);
          callbackAdd(PackageDownload(
            callbackAdd: callbackAdd,
            callGoBack: callGoBack,
            appUrl: "",
            preventBack: () {},
          ));
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          // decoration: const BoxDecoration(color: Color(0xffffffff)),
          backgroundColor: const Color(0xffffffff),
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 64,
              height: 72,
              decoration: BoxDecoration(
                // color: const Color(0x00000000),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
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
                  children: const [
                    Text(
                      "Surface Boot Params to Optimize Graphics and WiFi",
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                    Text(
                      "Riggs6012 ",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 13,
                        color: Color(0x9a000000),
                      ),
                    ),
                    Text(
                      "12MB",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 10,
                        color: Color(0x90000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
