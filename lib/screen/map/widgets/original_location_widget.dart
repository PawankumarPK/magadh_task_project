import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/map/controller/map_controller.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class OriginalLocationWidget extends StatefulWidget {

   OriginalLocationWidget({Key? key}) : super(key: key);

  @override
  State<OriginalLocationWidget> createState() => _OriginalLocationWidgetState();
}

class _OriginalLocationWidgetState extends State<OriginalLocationWidget> {
  var mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Position position = await mapController.determinePosition();
        mapController.googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(CameraPosition(
                target: LatLng(position.latitude, position.longitude), zoom: 14)));

        mapController.userLocationMarker.clear();

        mapController.marker.add(Marker(
            markerId: const MarkerId("101"),
            position: LatLng(position.latitude,  position.longitude),
            infoWindow: InfoWindow(title: ConstantStrings.yourLocation)));
        setState(() {});
      },
      child: Padding(
        padding: EdgeInsets.only(
            right: SizeConfig.defaultSize! * Dimens.size15,
            bottom: SizeConfig.defaultSize! * Dimens.size220),
        child: Container(
          width: SizeConfig.defaultSize! * Dimens.size50,
          height: SizeConfig.defaultSize! * Dimens.size50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ConstantColors.darkGreyColor,
          ),

          ///------------------ my location icon ---------------------
          child: Icon(
            Icons.my_location,
            color: ConstantColors.whiteColor,
            size: SizeConfig.defaultSize! * Dimens.size25,
          ),
        ),
      ),
    );
  }
}
