import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/common_widget/session_timeout_dialog_box.dart';
import 'package:magadh_tech_project/utils/custom_object/animation_message.dart';
import 'package:magadh_tech_project/api_services/repository/post_routes.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/utils/custom_object/custom_object.dart';

class AddUserController extends GetxController {
  dynamic argumentData = Get.arguments;
  RxBool isLoading = false.obs;
  var flutterToast = AnimationMessage();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  RxDouble longitude = 0.0.obs;
  RxDouble latitude = 0.0.obs;



  Future<bool> addNewUserApiFunction() async {

    try {
      isLoading.value = true;

      await PostRoutes.addNewUser(
        nameController.text,
        emailController.text,
        contactController.text,
        latitude.value,
        longitude.value
      );

      switch (CustomObject.responseStatus) {
        case 200:
          flutterToast.toast(ConstantStrings.userAddedSuccessfully);
          break;
        case 401:
          Get.dialog( SessionTimeOutDialogBox(
            errorCode: ConstantStrings.errorCode401,
          ));
          break;
        case 409:
          flutterToast.toast(ConstantStrings.userAlreadyExists);
          break;
        default:
          flutterToast.toast(ConstantStrings.somethingWentWrong);
      }
    } finally {
      isLoading.value = false;
    }
    return false;
  }
}
