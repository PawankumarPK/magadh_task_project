import 'package:flutter/material.dart';
import 'package:magadh_tech_project/screen/map/screen/map_screen.dart';
import 'package:magadh_tech_project/utils/size_config.dart';


class MapScaffold extends StatelessWidget {
  const MapScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return const Scaffold(
      body: MapScreen(),
    );
  }
}
