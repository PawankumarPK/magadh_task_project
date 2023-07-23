import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/api_services/url/Config.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/profile/child/edit_profile/controller/edit_profile_controller.dart';
import 'package:magadh_tech_project/utils/custom_object/custom_object.dart';
import 'package:magadh_tech_project/utils/size_config.dart';


class ProfilePicWidget extends StatelessWidget {
  var editProfileController = Get.put(EditProfileController());

  ProfilePicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (editProfileController.file != null) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * Dimens.size20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size200),
          child: Image.file(
            //to show image, you type like this.
            File(editProfileController.file!.path),
            fit: BoxFit.fitWidth,
            width: SizeConfig.defaultSize! * Dimens.size150,
            height: SizeConfig.defaultSize! * Dimens.size150,
          ),
        ),
      );
    } else if (editProfileController.profileImage.value != "" &&
        editProfileController.profileImage.value != "No Image") {
      return Container(
        width: SizeConfig.defaultSize! * Dimens.size150,
        height: SizeConfig.defaultSize! * Dimens.size150,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage('${Config.IMAGE_PATH_URL}/${editProfileController.profileImage.value}')),
          borderRadius: BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * Dimens.size200)),
        ),
      );
    } else if (editProfileController.profileImage.value.contains("No Image")) {
      return Container(
        width: SizeConfig.defaultSize! * Dimens.size150,
        height: SizeConfig.defaultSize! * Dimens.size150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ConstantColors.bgColor,
        ),

        ///------------------ Icon ---------------------
        child: Icon(
          Icons.person,
          color: ConstantColors.blackColor,
          size: SizeConfig.defaultSize! * Dimens.size50,
        ),
      );
    }

    return Container(
      width: SizeConfig.defaultSize! * Dimens.size150,
      height: SizeConfig.defaultSize! * Dimens.size150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ConstantColors.bgColor,
      ),

      ///------------------ Icon ---------------------
      child: Icon(
        Icons.person,
        color: ConstantColors.blackColor,
        size: SizeConfig.defaultSize! * Dimens.size50,
      ),
    );
  }
}
