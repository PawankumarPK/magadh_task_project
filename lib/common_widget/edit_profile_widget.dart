import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/utils/size_config.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/dimens.dart';

class EditTextFields extends StatelessWidget {

  TextEditingController controller;
  final String title;
  final ValueChanged<String> onChanged;
  final int inputLength;

  EditTextFields({Key? key,required this.controller, required this.title, required this.onChanged, required this.inputLength,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size30,
          left: SizeConfig.defaultSize! * Dimens.size20,
          right: SizeConfig.defaultSize! * Dimens.size20),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(
            color: ConstantColors.darkGreyColor,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.defaultSize! * Dimens.size30)),
          color: ConstantColors.whiteColor,
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          cursorColor: ConstantColors.primaryColor,
          //focusNode: myFocusNode,
          inputFormatters:[
            LengthLimitingTextInputFormatter(inputLength),
          ],
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(
                left: SizeConfig.defaultSize! * Dimens.size15,
                bottom: SizeConfig.defaultSize! * Dimens.size11,
                top: SizeConfig.defaultSize! * Dimens.size11,
                right: SizeConfig.defaultSize! * Dimens.size15),
            /*prefixIcon: Icon(
                        Icons.social_distance_rounded,
                        color: ConstantColors.blackColor,
                      ),*/
            labelText: title,
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
    );
  }
}
