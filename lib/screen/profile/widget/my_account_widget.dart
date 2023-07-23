import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/profile/controller/profile_controller.dart';
import 'package:magadh_tech_project/screen/profile/widget/logout_dialog_box.dart';
import 'package:magadh_tech_project/utils/custom_object/custom_object.dart';
import 'package:magadh_tech_project/utils/size_config.dart';


class MyAccountWidget extends StatelessWidget {
  var profileController = Get.put(ProfileController());

  MyAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.defaultSize! * Dimens.size20,
          left: SizeConfig.defaultSize! * Dimens.size20),
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size35),
              child: Text(
                ConstantStrings.myAccount,
                style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * Dimens.size16,
                    color: ConstantColors.greyColor,
                    fontFamily: ConstantFonts.poppinsSemiBold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size15),
              child: Text(
                profileController.emailId.value != ""
                    ? profileController.emailId.value
                    : ConstantStrings.updateYourEmail,
                style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * Dimens.size14,
                    color: ConstantColors.blackColor,
                    fontFamily: ConstantFonts.poppinsSemiBold),
              ),
            ),

            ///--------------------- Logout textview --------------
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => {
                Get.dialog(LogoutDialogBox())
              },
              child: Padding(
                padding:
                EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size15),
                child: Text(
                  ConstantStrings.logout,
                  style: TextStyle(
                      fontSize: SizeConfig.defaultSize! * Dimens.size16,
                      color: ConstantColors.redColor,
                      fontFamily: ConstantFonts.poppinsSemiBold),
                ),
              ),
            ),

            SizedBox(
              height: SizeConfig.defaultSize! * Dimens.size20,
            )
          ],
        ),
      ),
    );
  }
}
