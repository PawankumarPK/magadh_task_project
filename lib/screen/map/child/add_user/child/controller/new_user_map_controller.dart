import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:magadh_tech_project/utils/custom_object/animation_message.dart';

class NewUserMapController extends GetxController {
  RxBool isLoading = false.obs;
  var flutterToast = AnimationMessage();
  RxString userLocation = "".obs;
  RxBool buttonActive = false.obs;
  List<Marker> marker = <Marker>[].obs;
  Set<Marker> userLocationMarker = {}; //markers for google map
  late GoogleMapController googleMapController;

  final Completer<GoogleMapController> controller = Completer();

  final CameraPosition initialCameraPosition =
  const CameraPosition(target: LatLng(28.61613425208965, 77.2176218032837), zoom: 14.0);


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
    return position;
  }
}