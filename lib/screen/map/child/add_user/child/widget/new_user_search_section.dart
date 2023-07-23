import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:magadh_tech_project/api_services/url/Config.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/child/controller/new_user_map_controller.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/controller/add_user_controller.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class NewUserSearchSection extends StatefulWidget {
  const NewUserSearchSection({Key? key}) : super(key: key);

  @override
  State<NewUserSearchSection> createState() => _NewUserSearchSectionState();
}

class _NewUserSearchSectionState extends State<NewUserSearchSection> {
  var newUserMapController = Get.put(NewUserMapController());
  var addUserController = Get.put(AddUserController());

  final Mode _mode = Mode.overlay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.defaultSize! * Dimens.size20,
        left: SizeConfig.defaultSize! * Dimens.size20,
        right: SizeConfig.defaultSize! * Dimens.size20,
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => {
          handlePressForSearchButton()
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size30),
              color: ConstantColors.whiteColor,
              boxShadow: [
                BoxShadow(
                    color: ConstantColors.darkGreyColor.withOpacity(0.3),
                    blurRadius: SizeConfig.defaultSize! * Dimens.size5,
                    spreadRadius: SizeConfig.defaultSize! * Dimens.size2)
              ]),
          height: SizeConfig.defaultSize! * Dimens.size50,

          ///----------- Search section -------------
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size10),
                  child: Container(
                    width: SizeConfig.defaultSize! * Dimens.size30,
                    height: SizeConfig.defaultSize! * Dimens.size30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ConstantColors.primaryColor,
                    ),

                    ///------------------ Icon ---------------------
                    child: Icon(
                      Icons.search,
                      color: ConstantColors.whiteColor,
                      size: SizeConfig.defaultSize! * Dimens.size15,
                    ),
                  ),
                ),
              ),

              ///------------------ Search your place text ---------------------
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size20),
                child: Text(
                  newUserMapController.userLocation.value == ""
                      ? ConstantStrings.searchYourPlace
                      : newUserMapController.userLocation.value,
                  style: TextStyle(
                      color: ConstantColors.darkGreyColor,
                      fontFamily: ConstantFonts.poppinsSemiBold),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> handlePressForSearchButton() async {
    Prediction? p = await PlacesAutocomplete.show(
        offset: 0,
        radius: 1000,
        context: context,
        region: "us",
        apiKey: Config.GOOGLE_MAP_API_KEY,
        onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: ["(regions)"],
        decoration: InputDecoration(
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white))),
        components: [Component(Component.country, "in"), Component(Component.country, "in")]);

    displayPrediction(p!);
  }

  void onError(PlacesAutocompleteResponse response) {}

  ///
  Future<void> displayPrediction(Prediction p) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: Config.GOOGLE_MAP_API_KEY, apiHeaders: await const GoogleApiHeaders().getHeaders());

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    newUserMapController.marker.add(Marker(
        markerId: const MarkerId("100"),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: ConstantStrings.yourLocation)));


    newUserMapController.userLocation.value = detail.result.formattedAddress.toString();

    addUserController.longitude.value = lng;
    addUserController.latitude.value = lat;

    setState(() {});

    newUserMapController.googleMapController
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
  }

}