import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class AppBarWidget extends StatelessWidget {
  final title;

  const AppBarWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.defaultSize! * Dimens.size15,
          top: SizeConfig.defaultSize! * Dimens.size10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Back Icon
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => {Get.back()},
            child: Icon(
              Icons.arrow_back_ios_rounded,
              size: SizeConfig.defaultSize! * Dimens.size30,
            ),
          ),

          /// Title
          Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.defaultSize! * Dimens.size10,
                left: SizeConfig.defaultSize! * Dimens.size5),
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                  fontFamily: ConstantFonts.poppinsBold,
                  color: ConstantColors.darkGreyColor,
                  fontSize: SizeConfig.defaultSize! * Dimens.size22),
            ),
          ),
        ],
      ),
    );
  }
}
