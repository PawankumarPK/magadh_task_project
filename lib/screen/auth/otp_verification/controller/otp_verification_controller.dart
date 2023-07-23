import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/api_services/repository/post_routes.dart';
import 'package:magadh_tech_project/main.dart';
import 'package:magadh_tech_project/main.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/screen/auth/otp_verification/model/otp_verification_model.dart';
import 'package:magadh_tech_project/screen/auth/sign_in/controller/signin_controller.dart';
import 'package:magadh_tech_project/screen/map/map_scaffold.dart';
import 'package:magadh_tech_project/utils/custom_object/animation_message.dart';
import 'package:magadh_tech_project/utils/custom_object/custom_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerificationController extends GetxController {
  dynamic argumentData = Get.arguments;
  String latitude = "";
  String longitude = "";
  String name = "";
  String email = "";
  String imgUrl = "";
  String phoneNo = "";
  RxString otp = "".obs;
  RxBool isLoading = false.obs;
  var flutterToast = AnimationMessage();
  String countryCode = "+91"; // give your
  late RxString verificationCode = "".obs;
  final TextEditingController pinPutController = TextEditingController();
  final FocusNode pinPutFocusNode = FocusNode();
  Timer? countdownTimer;
  Rx<Duration> myDuration = const Duration(seconds: 60).obs;
  var signInController = Get.put(SignInController());
  late SharedPreferences prefs;

  @override
  void onInit() {
    phoneNo = argumentData[0]['phoneNo'];
    otp.value = argumentData[1]['otp'].toString();
    print("====>>>> OTP  "+ otp.value);
    startTimer();
    super.onInit();
  }

  void verifyOtp(String enteredOtpValue){
    if(enteredOtpValue == otp.value.toString()){
      flutterToast.toast("Otp verify");
      verifyOtpApiFunction(phoneNo,otp.value.toString());
    }else{
      flutterToast.toast(ConstantStrings.wrongOTP);
    }
  }



  Future<void> verifyOtpApiFunction(String phoneNo, String otp) async {
    try {
      isLoading.value = true;
      await PostRoutes.loginVerify(phoneNo,otp);

      switch (CustomObject.responseStatus) {
        case 200:
          final result = otpVerificationModelFromJson(CustomObject.responseBody.body);
          var token = result.token;

          Get.delete<SignInController>();

          CustomObject.token = token;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("token", CustomObject.token);

          print("=====>>>> GET TOKEN OTP  ${CustomObject.token}");


          Get.to(()=> const MapScaffold());
          print("======>>>>> TOKEN "+ token);
          break;
        case 401:
          flutterToast.snackBar(ConstantStrings.otpNotMatched, ConstantStrings.tryAgain);
          break;
        default:
          flutterToast.toast(ConstantStrings.somethingWentWrong);
      }
    } finally {
      isLoading.value = false;
    }
  }



  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void resetTimer() {
    myDuration.value = const Duration(seconds: 60);
    startTimer();
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
      final seconds = myDuration.value.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration.value = Duration(seconds: seconds);
      }
  }
}
