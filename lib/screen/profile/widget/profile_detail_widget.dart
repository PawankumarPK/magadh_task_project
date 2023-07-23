import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/profile/child/edit_profile/edit_profile_scaffold.dart';
import 'package:magadh_tech_project/screen/profile/controller/profile_controller.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class ProfileDetailWidget extends StatelessWidget {
  var profileController = Get.put(ProfileController());

  ProfileDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.defaultSize! * Dimens.size15),
              child: Text(
                profileController.name.value,
                style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * Dimens.size16,
                    color: ConstantColors.blackColor,
                    fontFamily: ConstantFonts.poppinsSemiBold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.defaultSize! * Dimens.size15,
                  top: SizeConfig.defaultSize! * Dimens.size5),
              child: Center(
                child: Text(
                  profileController.contactNo.value == "0"
                      ? "Update your contact no."
                      : profileController.contactNo.value,
                  style: TextStyle(
                      fontSize: SizeConfig.defaultSize! * Dimens.size15,
                      color: ConstantColors.greyColor,
                      fontFamily: ConstantFonts.poppinsSemiBold),
                ),
              ),
            ),
          ],
        ),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => {
            Get.delete<ProfileController>(),
            Get.to(() => const EditProfileScaffold(), arguments: [
              {"name": profileController.name.value},
              {"contact": profileController.contactNo.value},
              {"email": profileController.emailId.value},
              {"profileImage": profileController.profileImage.value}
            ])
          },
          child: Container(
            width: SizeConfig.defaultSize! * Dimens.size30,
            height: SizeConfig.defaultSize! * Dimens.size30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ConstantColors.blackColor,
            ),

            ///------------------ Icon ---------------------
            child: Icon(
              Icons.edit,
              color: ConstantColors.whiteColor,
              size: SizeConfig.defaultSize! * Dimens.size15,
            ),
          ),
        ),
      ],
    );
  }
}
