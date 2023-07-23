import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/auth/otp_verification/controller/otp_verification_controller.dart';
import 'package:magadh_tech_project/screen/auth/otp_verification/widget/verification_code_widget.dart';
import 'package:magadh_tech_project/utils/size_config.dart';
import 'package:pinput/pin_put/pin_put.dart';


class OtpTopWidget extends StatelessWidget {
  var otpVerificationController = Get.put(OtpVerificationController());

  OtpTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.defaultSize! * Dimens.size20,
          top: SizeConfig.defaultSize! * Dimens.size20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => {Get.back()},
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: ConstantColors.whiteColor,
              size: SizeConfig.defaultSize! * Dimens.size30,
            ),
          ),

          ///------------------otp verification text ---------------
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size20),
            child: Text(
              ConstantStrings.otpVerification,
              style: TextStyle(
                  fontFamily: ConstantFonts.poppinsBold,
                  color: ConstantColors.whiteColor,
                  fontSize: SizeConfig.defaultSize! * Dimens.size35),
            ),
          ),

          ///------------------mobile number text section ---------------
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// description
                Text(
                  ConstantStrings.otpVerificationDescription,
                  style: TextStyle(
                      fontFamily: ConstantFonts.poppinsSemiBold,
                      color: ConstantColors.whiteColor,
                      fontSize: SizeConfig.defaultSize! * Dimens.size16),
                ),
                /// Country code with phone number
                Text(
                  "${otpVerificationController.countryCode} ${otpVerificationController.phoneNo}",
                  style: TextStyle(
                      fontFamily: ConstantFonts.poppinsSemiBold,
                      color: ConstantColors.whiteColor,
                      fontSize: SizeConfig.defaultSize! * Dimens.size16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
