import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/api_services/repository/patch_routes.dart';
import 'package:magadh_tech_project/common_widget/session_timeout_dialog_box.dart';
import 'package:magadh_tech_project/screen/profile/profile_scaffold.dart';
import 'package:magadh_tech_project/utils/custom_object/animation_message.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/utils/custom_object/custom_object.dart';

class EditProfileController extends GetxController{
  dynamic argumentData = Get.arguments;
  RxBool isLoading = false.obs;
  var flutterToast = AnimationMessage();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxString name = "".obs;
  RxString contactNo = "".obs;
  RxString emailId = "".obs;
  RxString profileImage = "".obs;

  File? file;

  @override
  void onInit() {
    super.onInit();
    name.value = argumentData[0]['name'];
    contactNo.value = argumentData[1]['contact'];
    emailId.value = argumentData[2]['email'];
    profileImage.value = argumentData[3]['profileImage'];

  }


  Future<bool> updateProfileApiFunction(File path) async {
    String userLocation = '{"location":{"latitude":${CustomObject.latitude},"longitude":${CustomObject.longitude}}}';

    try {
      isLoading.value = true;

      await PatchRoutes.updateUserProfile(
          userLocation,
          nameController.text,
          path
      );

      switch (CustomObject.responseStatus) {
        case 200:
          Get.delete<EditProfileController>();
          Get.off(const ProfileScaffold());
          flutterToast.toast(ConstantStrings.profileUpdated);
          break;
        case 401:
          Get.dialog( SessionTimeOutDialogBox(errorCode: ConstantStrings.errorCode401,));
          break;
        case 404:
          Get.dialog( SessionTimeOutDialogBox(errorCode: ConstantStrings.errorCode401,));
          break;
        case 413:
          flutterToast.toast(ConstantStrings.imageIsTooLarge);
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