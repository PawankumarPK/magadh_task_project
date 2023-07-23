import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/add_user_scaffold.dart';
import 'package:magadh_tech_project/utils/size_config.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';

class AddNewUserButtonWidget extends StatelessWidget {

  const AddNewUserButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: SizeConfig.defaultSize! * Dimens.size15,
          bottom: SizeConfig.defaultSize! * Dimens.size70),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          Get.to(()=> const AddUserScaffold());
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size30),
              color: ConstantColors.whiteColor,
              boxShadow: [
                BoxShadow(
                    color: ConstantColors.darkGreyColor.withOpacity(0.3),
                    blurRadius: SizeConfig.defaultSize! * Dimens.size5,
                    spreadRadius: SizeConfig.defaultSize! * Dimens.size2)
              ]),
          height: SizeConfig.defaultSize! * Dimens.size50,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size10),
                child: Container(
                  width: SizeConfig.defaultSize! * Dimens.size30,
                  height: SizeConfig.defaultSize! * Dimens.size30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ConstantColors.primaryColor,
                  ),

                  ///------------------ Add Icon ---------------------
                  child: Icon(
                    Icons.add_rounded,
                    color: ConstantColors.whiteColor,
                    size: SizeConfig.defaultSize! * Dimens.size15,
                  ),
                ),
              ),

              ///------------------ Add New User text ---------------------
              Padding(
                padding: EdgeInsets.all(SizeConfig.defaultSize! * Dimens.size10),
                child: Center(
                  child: Text(
                    ConstantStrings.addNewUser,
                    style: TextStyle(
                        color: ConstantColors.darkGreyColor,
                        fontFamily: ConstantFonts.poppinsSemiBold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
