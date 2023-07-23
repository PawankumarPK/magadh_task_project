import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/auth/otp_verification/controller/otp_verification_controller.dart';
import 'package:magadh_tech_project/utils/size_config.dart';
import 'package:pinput/pin_put/pin_put.dart';


class VerificationCodeWidget extends StatelessWidget {
  var otpVerificationController = Get.put(OtpVerificationController());

  ///------------------ Pinput entered field value box ui---------------
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: ConstantColors.bgColor,
    borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size10),
    border: Border.all(
      color: ConstantColors.blackColor,
      width: SizeConfig.defaultSize! * Dimens.size2,
    ),
  );

  ///------------------ Pinput selected field box ui---------------
  final BoxDecoration selectedFieldPinPutDecoration = BoxDecoration(
    color: ConstantColors.bgColor,
    borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size10),
    border: Border.all(
      color: ConstantColors.greenColor,
      width: 2,
    ),
  );

  ///------------------ Pinput remaining fields value box ui---------------
  final BoxDecoration followingFieldPinPutDecoration = BoxDecoration(
    color: ConstantColors.bgColor,
    borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size10),
    border: Border.all(
      color: ConstantColors.redColor,
      width: SizeConfig.defaultSize! * Dimens.size2,
    ),
  );


  VerificationCodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeConfig.defaultSize! * Dimens.size30),
            topRight: Radius.circular(SizeConfig.defaultSize! * Dimens.size30)),
        color: ConstantColors.whiteColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.defaultSize! * Dimens.size20,
            right: SizeConfig.defaultSize! * Dimens.size20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///--------------------------- Verification code boxes ui --------------------
            PinPut(
              fieldsCount: 6,
              textStyle: TextStyle(
                  fontSize: SizeConfig.defaultSize! * Dimens.size20,
                  fontFamily: ConstantFonts.poppinsSemiBold,
                  color: ConstantColors.blackColor),
              eachFieldWidth: SizeConfig.defaultSize! * Dimens.size55,
              eachFieldHeight: SizeConfig.defaultSize! * Dimens.size55,
              focusNode: otpVerificationController.pinPutFocusNode,
              controller: otpVerificationController.pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: selectedFieldPinPutDecoration,
              followingFieldDecoration: followingFieldPinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
              onSubmit: (pin) async {
                otpVerificationController.verifyOtp(pin);
              },
            ),

            ///------------------ timer text  ------------------
            Obx(
                  () => Padding(
                padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size50),
                child: Text(
                  "00:${otpVerificationController.myDuration.value.inSeconds} seconds",
                  style: TextStyle(
                      fontFamily: ConstantFonts.poppinsSemiBold,
                      color: ConstantColors.greyColor,
                      fontSize: SizeConfig.defaultSize! * Dimens.size16),
                ),
              ),
            ),

            ///------------------ resend otp text  ---------------
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size10),
                    child: Text(
                      ConstantStrings.doNotReceiveOtp,
                      style: TextStyle(
                          fontFamily: ConstantFonts.poppinsSemiBold,
                          color: ConstantColors.greyColor,
                          fontSize: SizeConfig.defaultSize! * Dimens.size16),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => {
                      otpVerificationController.pinPutController.clear(),
                      otpVerificationController.resetTimer(),
                      otpVerificationController.signInController.sendOtp(otpVerificationController.phoneNo)
                    },
                    child: Padding(
                      padding:
                      EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size10),
                      child: Text(
                        ConstantStrings.resendOtp,
                        style: TextStyle(
                            fontFamily: ConstantFonts.poppinsSemiBold,
                            color: otpVerificationController.myDuration.value.inSeconds == 0
                                ? ConstantColors.primaryColor
                                : ConstantColors.lightPrimaryColor.withOpacity(0.4),
                            fontSize: SizeConfig.defaultSize! * Dimens.size16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size10),
              child: Text(
                "OTP for testing purpose: ${otpVerificationController.otp.value}",
                style: TextStyle(
                    fontFamily: ConstantFonts.poppinsSemiBold,
                    color: ConstantColors.darkGreyColor,
                    fontSize: SizeConfig.defaultSize! * Dimens.size12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
