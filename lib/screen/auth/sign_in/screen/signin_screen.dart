import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/common_widget/right_arrow_button_widget.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/screen/auth/otp_verification/otp_verification_scaffold.dart';
import 'package:magadh_tech_project/screen/auth/sign_in/controller/signin_controller.dart';
import 'package:magadh_tech_project/screen/auth/sign_in/widgets/mobile_num_textfield_widget.dart';
import 'package:magadh_tech_project/utils/size_config.dart';
import 'package:magadh_tech_project/res/constant_assets.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';

class SignInScreen extends StatelessWidget {
  FocusNode myFocusNode = FocusNode();
  var signInController = Get.put(SignInController());


  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          children: [

            Flexible(
              flex: 3,
              child: Padding(
                padding:  EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size50, left: SizeConfig.defaultSize! * Dimens.size20, right: SizeConfig.defaultSize! * Dimens.size20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///------------------- Sign in text --------------
                    Text(
                      ConstantStrings.signIn,
                      style: TextStyle(
                          fontFamily: ConstantFonts.poppinsBold,
                          color: ConstantColors.whiteColor,
                          fontSize: SizeConfig.defaultSize! * Dimens.size35),
                    ),

                    ///------------------- Sign in description --------------
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size10),
                      child: Text(
                        ConstantStrings.signInDescription,
                        style: TextStyle(
                            fontFamily: ConstantFonts.poppinsSemiBold,
                            color: ConstantColors.whiteColor,
                            fontSize: SizeConfig.defaultSize! * Dimens.size16),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ///------------- Mobile number textfield widget --------
            Flexible(
              flex: 4,
              child: MobileNumberTextFieldWidget()
            ),
          ],
        ),
      );

  }
}
