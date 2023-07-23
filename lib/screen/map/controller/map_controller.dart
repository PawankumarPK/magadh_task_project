import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:magadh_tech_project/common_widget/marker_dialog.dart';
import 'package:magadh_tech_project/screen/auth/sign_in/signin_scaffold.dart';
import 'package:magadh_tech_project/screen/map/model/all_users_model.dart';
import 'package:magadh_tech_project/utils/custom_object/animation_message.dart';
import 'package:magadh_tech_project/api_services/repository/get_routes.dart';
import 'package:magadh_tech_project/res/constant_assets.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/utils/custom_object/custom_object.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:url_launcher/url_launcher.dart';

class MapController extends GetxController {
  RxBool isLoading = false.obs;
  var flutterToast = AnimationMessage();
  RxString userLocation = "".obs;
  RxDouble userLocationLatitude = 0.0.obs;
  RxDouble userLocationLongitude = 0.0.obs;
  String serviceType = "";
  //double walkingTimeTaking = 0.0;

  List<User> allUserList = <User>[].obs;

  List<Marker> marker = <Marker>[].obs;
  Set<Marker> userLocationMarker = {}; //markers for google map
  List<String> markerId = <String>[].obs;
  var userMarkerId = "userMarker";
  late GoogleMapController googleMapController;
  List<String> filteredUserList = [];
  List<String> filteredMechanicNameList = [];
  List<double> mechanicDistanceList = [];

  CustomInfoWindowController customInfoWindowController = CustomInfoWindowController();
  Uint8List? markerImage;
  Uint8List? youAreHereImage;
  RxString filterDistance = "".obs;
  var calDist = 0.0.obs;
  TextEditingController distanceController = TextEditingController();

  var calculatePremiumVendorDist = 0.0.obs;
  List<String> allPremiumVendorIdList = <String>[].obs;
  List<String> filteredPremiumVendorList = [];
  List<double> allPremiumVendorDistanceList = [];
  List premiumVendorData=[] ;


  late User items;
  var predication;
  Uri? phoneUrl;

  RxString planType = "".obs;
  RxString contactNo = "".obs;

  var latitude = 0.0;
  var longitude = 0.0;


  final Completer<GoogleMapController> controller = Completer();

  CameraPosition initialCameraPosition =
  const CameraPosition(target: LatLng(28.61613425208965, 77.2176218032837), zoom: 14.0);



  Future<Uint8List> getBytesFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  @override
  void onInit()  {
    super.onInit();
    //firebaseNotificationInit();
    allMechanicApiFunction();
  }

  Future<bool> allMechanicApiFunction() async {
    try {
      isLoading.value = true;
      await GetRoutes.getAllUsers();

      switch (CustomObject.responseStatus) {
        case 200:
          final result = allUsersModelFromJson(CustomObject.responseBody.body);
          allUserList = result.users;
          markerId.add(userMarkerId);
          for (int i = 0; i < allUserList.length; i++) {

            markerImage = await getBytesFromAssets(ConstantAssets.mechanicIcon, 100);
            items = allUserList[i];

            filteredUserList.add(markerId[i]);
            filteredMechanicNameList.add(allUserList[i].name);
            markerId.add(allUserList[i].id);

          }

          break;
        case 401:
          flutterToast.snackBar(ConstantStrings.status401, ConstantStrings.tryAgain);
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // prefs.clear();
          Get.offAll(()=> const SignInScaffold());
          break;

        default:
          flutterToast.toast(ConstantStrings.somethingWentWrong);
      }
    } finally {
      isLoading.value = false;
    }
    return false;
  }



  /// Check location permission
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        return Future.error("Location services are disabled");
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          return Future.error("Location permission denied");
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error("Location permission are permanently denied");
      }

      Position position = await Geolocator.getCurrentPosition();

      return position;

    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permission are permanently denied");
    }

    Position position = await Geolocator.getCurrentPosition();
    latitude = position.latitude;
    longitude = position.longitude;
    CustomObject.latitude = position.latitude;
    CustomObject.longitude = position.longitude;
    filterMarker(100.0,position.latitude,position.longitude);

    return position;
  }



  void filterMarker(double dist,double lat,double lon) {
    for (int i = 0; i < allUserList.length; i++) {
      placeFilteredMarker(
          allUserList[i].location.latitude,
          allUserList[i].location.longitude,
          //calDist.value / 1000,
          markerId[i].toString(),
          i);
    }
  }

  placeFilteredMarker(lat, lon,  index, i) {
    if (markerId.contains(markerId[i])) {
      filteredUserList.add(markerId[i]);

      marker.add(
        Marker(
          icon: BitmapDescriptor.fromBytes(markerImage!),
          markerId: MarkerId(index),
          position: LatLng(lat, lon),
          onTap: () {
            customInfoWindowController.addInfoWindow!(
              MarkerDialog(
                userDataList: allUserList[i],
              ),
              LatLng(lat, lon),
            );
          },
        ),
      );
    }
    if (markerId.contains(userMarkerId)) {
      marker.add(
        Marker(
            markerId: MarkerId(userMarkerId),
            position: LatLng(userLocationLatitude.value,
                userLocationLongitude.value),
            infoWindow: InfoWindow(title: ConstantStrings.yourLocation)),
      );
    }
  }

  Future<bool> call() async {
    phoneUrl = Uri(
      scheme: 'tel',
      path: contactNo.value,
    );
    launchUrl(phoneUrl!);
    return  true;

  }


}