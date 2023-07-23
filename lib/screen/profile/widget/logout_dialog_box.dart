import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/common_widget/plain_button.dart';
import 'package:magadh_tech_project/screen/auth/sign_in/signin_scaffold.dart';
import 'package:magadh_tech_project/screen/profile/controller/profile_controller.dart';
import 'package:magadh_tech_project/utils/size_config.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutDialogBox extends StatelessWidget {
  var profileController = Get.put(ProfileController());

  LogoutDialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size2),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: SizeConfig.defaultSize! * Dimens.size250,
        decoration: BoxDecoration(
          color: ConstantColors.whiteColor,
          borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size20),
          border: Border.all(color: ConstantColors.borderGreyColor),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.defaultSize! * Dimens.size10,
              right: SizeConfig.defaultSize! * Dimens.size10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              ///-------------- Logout text -----------------
              Text(
                ConstantStrings.logout,
                style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * Dimens.size25,
                    fontWeight: FontWeight.w600,
                    fontFamily: ConstantFonts.poppinsSemiBold),
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * Dimens.size16,
              ),

              ///-------------- Are you sure text -----------------
              Text(
                ConstantStrings.areYouSureYouWantToLogout,
                style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * Dimens.size16,
                    fontFamily: ConstantFonts.poppinsRegular),
                textAlign: TextAlign.center,
              ),



              ///------------------- Cancel button  --------------
              Row(
                children: [
                  Flexible(
                    flex: 6,
                    child: PlainButton(
                        height: SizeConfig.defaultSize! * Dimens.size50,
                        bgColor: ConstantColors.greyColor,
                        text: ConstantStrings.cancel,
                        textColor: ConstantColors.whiteColor,
                        press: (BuildContext context) => {
                          Get.back()
                          //press(context)
                        }),
                  ),

                  ///------------------- Logout button  --------------
                  Flexible(
                    flex: 7,
                    child: PlainButton(
                        height: SizeConfig.defaultSize! * Dimens.size50,
                        bgColor: ConstantColors.redColor,
                        text: ConstantStrings.yesLogout,
                        textColor: ConstantColors.whiteColor,
                        press: (BuildContext context) => {
                          profileController.logoutFunction()
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
