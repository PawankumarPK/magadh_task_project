import 'package:flutter/material.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/utils/custom_object/custom_object.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class CoordinatesWidget extends StatelessWidget {
  const CoordinatesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///--------------------- Coordinate textview --------------
        Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.defaultSize! * Dimens.size35,
              left: SizeConfig.defaultSize! * Dimens.size20),
          child: Container(
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            child: Text(
              ConstantStrings.coordinates,
              style: TextStyle(
                  fontSize: SizeConfig.defaultSize! * Dimens.size16,
                  color: ConstantColors.greyColor,
                  fontFamily: ConstantFonts.poppinsSemiBold),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.defaultSize! * Dimens.size5,
              right: SizeConfig.defaultSize! * Dimens.size20,
              top: SizeConfig.defaultSize! * Dimens.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                    EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size15),
                    child: Text(
                      ConstantStrings.latitude,
                      style: TextStyle(
                          fontSize: SizeConfig.defaultSize! * Dimens.size16,
                          color: ConstantColors.darkGreyColor,
                          fontFamily: ConstantFonts.poppinsSemiBold),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size15),
                    child: Text(
                      CustomObject.latitude.toString(),
                      style: TextStyle(
                          fontSize: SizeConfig.defaultSize! * Dimens.size16,
                          color: ConstantColors.blackColor,
                          fontFamily: ConstantFonts.poppinsSemiBold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                    EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size15),
                    child: Text(
                      ConstantStrings.longitude,
                      style: TextStyle(
                          fontSize: SizeConfig.defaultSize! * Dimens.size16,
                          color: ConstantColors.darkGreyColor,
                          fontFamily: ConstantFonts.poppinsSemiBold),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size15),
                    child: Text(
                      CustomObject.longitude.toString(),
                      style: TextStyle(
                          fontSize: SizeConfig.defaultSize! * Dimens.size16,
                          color: ConstantColors.blackColor,
                          fontFamily: ConstantFonts.poppinsSemiBold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
