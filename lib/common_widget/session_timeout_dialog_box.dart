import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/common_widget/plain_button.dart';
import 'package:magadh_tech_project/screen/auth/sign_in/controller/signin_controller.dart';
import 'package:magadh_tech_project/screen/auth/sign_in/signin_scaffold.dart';
import 'package:magadh_tech_project/screen/profile/controller/profile_controller.dart';
import 'package:magadh_tech_project/utils/size_config.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionTimeOutDialogBox extends StatelessWidget {
  final errorCode;
  var signInController = Get.put(SignInController());
  var profileController = Get.put(ProfileController());


   SessionTimeOutDialogBox({Key? key, this.errorCode}) : super(key: key);

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

              Text(
                ConstantStrings.sessionTimeout,
                style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * Dimens.size25,
                    fontWeight: FontWeight.w600,
                    fontFamily: ConstantFonts.poppinsSemiBold),
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * Dimens.size16,
              ),
              Text(
                "$errorCode , ${ConstantStrings.youAreBeingTimedOut}",
                style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * Dimens.size14,
                    fontFamily: ConstantFonts.poppinsRegular),
                textAlign: TextAlign.center,
              ),



              ///------------------- Cancel button  --------------
              PlainButton(
                  height: SizeConfig.defaultSize! * Dimens.size50,
                  width: SizeConfig.defaultSize! * Dimens.size250,
                  bgColor: ConstantColors.primaryColor,
                  text: ConstantStrings.backToLogin,
                  textColor: ConstantColors.whiteColor,
                  press: (BuildContext context) => {
                    profileController.logoutFunction()
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
