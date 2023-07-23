import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/api_services/url/Config.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/profile/controller/profile_controller.dart';
import 'package:magadh_tech_project/utils/size_config.dart';


class ProfileImgWidget extends StatelessWidget {
  var profileController = Get.put(ProfileController());

  ProfileImgWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size20),
      child: profileController.profileImage.value != "No Image"
          ? Container(
        width: SizeConfig.defaultSize! * Dimens.size90,
        height: SizeConfig.defaultSize! * Dimens.size90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ConstantColors.bgColor,
        ),


        child: Container(
          width: SizeConfig.defaultSize! * Dimens.size200,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    '${Config.IMAGE_PATH_URL}/${profileController.profileImage.value}')),
            borderRadius: BorderRadius.all(Radius.circular(
                SizeConfig.defaultSize! * Dimens.size200)),
          ),
        ),
      )
          : Container(
        width: SizeConfig.defaultSize! * Dimens.size90,
        height: SizeConfig.defaultSize! * Dimens.size90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ConstantColors.bgColor,
        ),

        ///------------------ Icon ---------------------
        child: Icon(
          Icons.image_outlined,
          color: ConstantColors.blackColor,
          size: SizeConfig.defaultSize! * Dimens.size40,
        ),


      ),
    );
  }
}
