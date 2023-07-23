import 'package:flutter/material.dart';
import 'package:magadh_tech_project/utils/size_config.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class PlainButton extends StatelessWidget {
  final width;
  final height;
  final bgColor;
  final text;
  final textColor;
  final Function(BuildContext) press;

  const PlainButton({Key? key, this.bgColor, this.text, required this.press, this.width, this.height, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top:SizeConfig.defaultSize! * Dimens.size20, left: SizeConfig.defaultSize! * Dimens.size20,right: SizeConfig.defaultSize! * Dimens.size20,),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => {
          press(context)
        },
        child: Container(
          //width: SizeConfig.defaultSize! * Dimens.size120,
          width: width,
          //height: SizeConfig.defaultSize! * Dimens.size40,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size30),
              color: bgColor,
              boxShadow: [
                BoxShadow(
                    color: ConstantColors.darkGreyColor.withOpacity(0.3),
                    blurRadius: SizeConfig.defaultSize! * Dimens.size5,
                    spreadRadius: SizeConfig.defaultSize! * Dimens.size2)
              ]),


          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: SizeConfig.defaultSize! * Dimens.size15,
                  color: textColor,
                  fontFamily: ConstantFonts.poppinsSemiBold),
            ),
          ),
        ),
      ),
    );
  }
}
