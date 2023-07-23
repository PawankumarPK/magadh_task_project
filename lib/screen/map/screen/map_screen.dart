import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:magadh_tech_project/main.dart';
import 'package:magadh_tech_project/screen/map/controller/map_controller.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/map/widgets/add_user_button_section.dart';
import 'package:magadh_tech_project/screen/map/widgets/view_list_button_section.dart';
import 'package:magadh_tech_project/screen/map/widgets/original_location_widget.dart';
import 'package:magadh_tech_project/screen/map/widgets/search_section.dart';
import 'package:magadh_tech_project/screen/profile/profile_scaffold.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ///------------------ Google map ----------------
          Obx(
            () => mapController.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(ConstantColors.primaryColor),
                  ))
                : GoogleMap(
                    initialCameraPosition: mapController.initialCameraPosition,
                    markers: Set<Marker>.of(mapController.marker),
                    mapType: MapType.normal,

                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    mapToolbarEnabled: false,


                    onMapCreated: (GoogleMapController controller) async {
                      mapController.controller.complete(controller);
                      mapController.googleMapController = controller;
                      mapController.customInfoWindowController.googleMapController = controller;

                      Position position = await mapController.determinePosition();

                      mapController.googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                              target: LatLng(position.latitude, position.longitude), zoom: 14)));

                      mapController.userLocationMarker.clear();

                      mapController.marker.add(Marker(
                          markerId: const MarkerId("100"),
                          position: LatLng(position.latitude,  position.longitude),
                          infoWindow: InfoWindow(title: ConstantStrings.yourLocation)));
                      setState(() {});
                    },
                    onTap: (position) {
                      mapController.customInfoWindowController.hideInfoWindow!();
                    },
                    onCameraMove: (position) {
                      mapController.customInfoWindowController.onCameraMove!();
                    },
                  ),
          ),

          ///--------------- Marker dialog widget ----------
          CustomInfoWindow(
            controller: mapController.customInfoWindowController,
            height: SizeConfig.defaultSize! * Dimens.size250,
            width: SizeConfig.defaultSize! * Dimens.size270,
            offset: SizeConfig.defaultSize! * Dimens.size50,
          ),

          ///------------------ Search section ----------------
          const Positioned(
            right: 1,
            left: 1,
            top: 1,
            child: SearchSection(),
          ),

          ///------------------ View list button section ---------------------
          Positioned(bottom: 1, right: 1, child: ViewListButtonSection()),

          ///------------------ Add New User button section ---------------------
          const Positioned(bottom: 1, right: 1, child: AddNewUserButtonWidget()),
        ],
      ),
    );
  }

}
