import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/api_services/repository/post_routes.dart';
import 'package:magadh_tech_project/common_widget/session_timeout_dialog_box.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/screen/auth/otp_verification/otp_verification_scaffold.dart';
import 'package:magadh_tech_project/screen/auth/sign_in/model/signin_model.dart';
import 'package:magadh_tech_project/utils/custom_object/animation_message.dart';
import 'package:magadh_tech_project/utils/custom_object/custom_object.dart';

class SignInController extends GetxController {
  RxBool isLoading = false.obs;
  var flutterToast = AnimationMessage();
  TextEditingController contactNoController = TextEditingController();
  RxInt otp = 0.obs;


  ///--------------- Send Otp to phone number ----------------------
  void sendOtp(String phoneNo) async {
    flutterToast.toast(ConstantStrings.sendingOtp);

    try {
      isLoading.value = true;
      await PostRoutes.sendOtp(phoneNo);

      switch (CustomObject.responseStatus) {
        case 200:
          final result = signInModelFromJson(CustomObject.responseBody.body);
          var message = result.message;
          otp.value = result.otp;

          flutterToast.toast(message);

          Get.off(const OtpVerificationScaffold(), arguments: [
            {"phoneNo": phoneNo},
            {"otp":otp.value}
          ]);

          break;
        case 401:
          Get.dialog( SessionTimeOutDialogBox(errorCode: ConstantStrings.errorCode401,));
          break;
        case 404:
          flutterToast.snackBar(ConstantStrings.status404, ConstantStrings.tryAgain);
          break;
        default:
          flutterToast.toast(ConstantStrings.somethingWentWrong);
      }
    } finally {
      isLoading.value = false;
    }
  }
}
