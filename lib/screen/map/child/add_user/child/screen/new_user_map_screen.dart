import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:magadh_tech_project/common_widget/right_arrow_button_widget.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/child/controller/new_user_map_controller.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/child/widget/new_user_search_section.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/controller/add_user_controller.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class NewUserMapScreen extends StatefulWidget {
  const NewUserMapScreen({Key? key}) : super(key: key);

  @override
  State<NewUserMapScreen> createState() => _NewUserMapScreenState();
}

class _NewUserMapScreenState extends State<NewUserMapScreen> {
  var newUserMapController = Get.put(NewUserMapController());
  var addUserController = Get.put(AddUserController());

  /*final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialCameraPosition =
  CameraPosition(target: LatLng(28.61613425208965, 77.2176218032837), zoom: 14.0);
*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ///------------------ Google map ----------------
          Obx(
                () => newUserMapController.isLoading.value
                ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(ConstantColors.primaryColor),
                ))
                : GoogleMap(
              initialCameraPosition: newUserMapController.initialCameraPosition,
              markers: Set<Marker>.of(newUserMapController.marker),
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              onMapCreated: (GoogleMapController controller) async {
                newUserMapController.controller.complete(controller);
                newUserMapController.googleMapController = controller;
                Position position = await newUserMapController.determinePosition();

                newUserMapController.googleMapController.animateCamera(

                    CameraUpdate.newCameraPosition(CameraPosition(
                        target: LatLng(position.latitude, position.longitude), zoom: 14)));


                newUserMapController.userLocationMarker.clear();

                addUserController.longitude.value = position.longitude;
                addUserController.latitude.value = position.latitude;

                newUserMapController.buttonActive.value = true;

                newUserMapController.marker.add(Marker(
                    markerId: const MarkerId("100"),
                    position: LatLng(position.latitude, position.longitude),
                    infoWindow: InfoWindow(title: ConstantStrings.yourLocation),

                ));
                setState(() {});
              },
              onTap: (position) {},
              onCameraMove: (position) {},
            ),
          ),


          ///------------------ Search section ----------------
          const Positioned(
            right: 1,
            left: 1,
            top: 1,
            child: NewUserSearchSection(),
          ),


          ///------------------ Add Coordinate button section ---------------------
          Positioned(
            bottom: 1,
            right: 1,
            left: 1,
            child: Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.defaultSize! * Dimens.size20,
                  right: SizeConfig.defaultSize! * Dimens.size20,
                  bottom: SizeConfig.defaultSize! * Dimens.size20
              ),
              child: RightArrowButtonWidget(
                  text: newUserMapController.buttonActive.value == true?ConstantStrings.addCoordinates:ConstantStrings.detectingYourLocation,
                  press: (BuildContext context) => {
                    Get.back()
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
