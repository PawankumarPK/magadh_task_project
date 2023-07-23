import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/common_widget/edit_textfield_widget.dart';
import 'package:magadh_tech_project/common_widget/right_arrow_button_widget.dart';
import 'package:magadh_tech_project/common_widget/plain_button.dart';
import 'package:magadh_tech_project/screen/auth/sign_in/controller/signin_controller.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/utils/size_config.dart';


class MobileNumberTextFieldWidget extends StatelessWidget {
  var signInController = Get.put(SignInController());

  MobileNumberTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      //height: SizeConfig.defaultSize! * Dimens.size40,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.only(topLeft: Radius.circular(SizeConfig.defaultSize! * Dimens.size20), topRight: Radius.circular(SizeConfig.defaultSize! * Dimens.size30)),
        color: ConstantColors.whiteColor,
      ),

      child: Padding(
        padding:  EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size20, right: SizeConfig.defaultSize! * Dimens.size20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ///------------------- Mobile number text field --------------
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size20),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * Dimens.size30)),
                    color: ConstantColors.bgColor,
                    boxShadow: [
                      BoxShadow(
                          color: ConstantColors.greyColor.withOpacity(0.2),
                          blurRadius: SizeConfig.defaultSize! * Dimens.size4,
                          spreadRadius: SizeConfig.defaultSize! * Dimens.size1)
                    ]),
                child: TextField(
                  controller: signInController.contactNoController,
                  cursorColor: ConstantColors.primaryColor,
                  //focusNode: myFocusNode,
                  inputFormatters:[
                    LengthLimitingTextInputFormatter(10),
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size15, bottom: SizeConfig.defaultSize! * Dimens.size11, top: SizeConfig.defaultSize! * Dimens.size11, right: SizeConfig.defaultSize! * Dimens.size15),
                    prefixIcon: Icon(
                      Icons.call,
                      color: ConstantColors.blackColor,
                    ),
                    labelText: ConstantStrings.mobileNumber,
                    labelStyle: TextStyle(
                        fontSize: SizeConfig.defaultSize! * Dimens.size15,
                        color: ConstantColors.darkGreyColor,
                        fontFamily: ConstantFonts.poppinsSemiBold),
                    hintText: '',
                  ),
                  style: TextStyle(
                      fontSize: SizeConfig.defaultSize! * Dimens.size15,
                      color: ConstantColors.blackColor,
                      fontFamily: ConstantFonts.poppinsSemiBold),
                ),
              ),
            ),


            ///------------------- Get Otp button  --------------
            Padding(
              padding:  EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size20),
              child: RightArrowButtonWidget(
                  text: ConstantStrings.getOtp,
                  press: (BuildContext context) => {
                    signInController.sendOtp(signInController.contactNoController.text)

                  }),
            ),
          ],
        ),
      ),
    );
  }
}
