import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:magadh_tech_project/api_services/url/config.dart';
import 'package:magadh_tech_project/common_widget/marker_dialog.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/map/controller/map_controller.dart';
import 'package:magadh_tech_project/screen/profile/profile_scaffold.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  var mapController = Get.put(MapController());

  //String filterDistance = "";
  final Mode _mode = Mode.overlay;
  RxBool searchNotApplied = false.obs;


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
          //locationAndTypeBottomSheet.locationAndTypeBottomSheet(context),
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

          ///----------- Filter section -------------
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

                    ///------------------ search Icon ---------------------
                    child: Icon(
                      Icons.search,
                      color: ConstantColors.whiteColor,
                      size: SizeConfig.defaultSize! * Dimens.size15,
                    ),
                  ),
                ),
              ),

              ///------------------ Search your place text ---------------------
              Expanded(
                flex: 8,
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size20),
                  child: Text(
                    mapController.userLocation.value == ""
                        ? "Search your place"
                        : mapController.userLocation.value,
                    style: TextStyle(
                        color: ConstantColors.darkGreyColor,
                        fontFamily: ConstantFonts.poppinsSemiBold),
                  ),
                ),
              ),

              ///----------- Grey border -------------
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.defaultSize! * Dimens.size5,
                        bottom: SizeConfig.defaultSize! * Dimens.size5,
                      ),
                      child: ColoredBox(
                        color: ConstantColors.borderGreyColor,
                        child: const SizedBox(
                          width: 1,
                          height: double.maxFinite,
                        ),
                      ),
                    ),

                    ///----------- User Profile icon -------------
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => {
                        Get.to(()=> const ProfileScaffold())
                      },
                      child: Padding(
                        padding:  EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size8),
                        child: Icon(
                          Icons.person,
                          color: ConstantColors.primaryColor,
                          size: SizeConfig.defaultSize! * Dimens.size25,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  ///--------- Search suggestions section -----------
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
                borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size20),
                borderSide: BorderSide(color: Colors.white))),
        components: [Component(Component.country, "in"), Component(Component.country, "in")]);

    displayPrediction(p!);
  }

  void onError(PlacesAutocompleteResponse response) {
    print("--====>>>> ERRROR  " + response.errorMessage!);
  }

  /// -------- search functionality ---------------
  Future<void> displayPrediction(Prediction p) async {
    //mapController.mechanicDistanceList.clear();
    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: Config.GOOGLE_MAP_API_KEY, apiHeaders: await const GoogleApiHeaders().getHeaders());

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    searchNotApplied.value = true;

    mapController.marker.add(Marker(
        markerId: const MarkerId("100"),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: ConstantStrings.yourLocation)));

    mapController.userLocation.value = detail.result.formattedAddress.toString();

    mapController.userLocationLatitude.value = lat;
    mapController.userLocationLongitude.value = lng;

    setState(() {});

    mapController.googleMapController
        .animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
  }
}