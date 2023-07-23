import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class RightArrowButtonWidget extends StatelessWidget {

  final text;
  final Function(BuildContext) press;

  const RightArrowButtonWidget({Key? key, this.text, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => {
        press(context)
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size30),
            color: ConstantColors.primaryColor,
            boxShadow: [
              BoxShadow(
                  color: ConstantColors.darkGreyColor.withOpacity(0.3),
                  blurRadius: SizeConfig.defaultSize! * Dimens.size5,
                  spreadRadius: SizeConfig.defaultSize! * Dimens.size2)
            ]),
        height: SizeConfig.defaultSize! * Dimens.size55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            ///------------------ button title text ---------------------
            Padding(
              padding:
              EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size30),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * Dimens.size16,
                    color: ConstantColors.whiteColor,
                    fontFamily: ConstantFonts.poppinsSemiBold),
              ),
            ),

            Padding(
              padding:
              EdgeInsets.only(right: SizeConfig.defaultSize! * Dimens.size20),
              child: RotatedBox(
                quarterTurns: 2,
                child: Icon(
                  Icons.arrow_back,
                  color: ConstantColors.whiteColor,
                  size: SizeConfig.defaultSize! * Dimens.size25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
