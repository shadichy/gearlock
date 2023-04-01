import 'package:flutter/material.dart';
import 'package:gearlock/core/global_widgets.dart';
import 'package:gearlock/core/single_route.dart';

class GearTestSingleRoute extends StatefulWidget {
  const GearTestSingleRoute({
    super.key,
  });

  @override
  State<GearTestSingleRoute> createState() => _GearTestSingleRouteState();
}

class _GearTestSingleRouteState extends State<GearTestSingleRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [];
    return SingleRoute(children: body, onPop: () async => true);
  }
}

class GearTestTemplate extends GearStatefulWidget {
  const GearTestTemplate({
    super.key,
    required super.callbackAdd,
    required super.callGoBack,
  });

  @override
  State<GearTestTemplate> createState() => _GearTestTemplateState();
}

class _GearTestTemplateState extends State<GearTestTemplate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [];
    return ListView.builder(
      itemCount: body.length,
      itemBuilder: (context, index) {
        return body[index];
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}

class NormalTestTemplate extends StatefulWidget {
  const NormalTestTemplate({
    super.key,
  });

  @override
  State<NormalTestTemplate> createState() => _NormalTestTemplateState();
}

class _NormalTestTemplateState extends State<NormalTestTemplate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [];
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: ListView.builder(
        itemCount: body.length,
        itemBuilder: (context, index) {
          return body[index];
        },
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
