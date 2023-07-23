import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/child/new_user_map_scaffold.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/controller/add_user_controller.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class AddNewCoordinateWidget extends StatelessWidget {
  //var addUserController = Get.put(AddUserController());
  final longitude;
  final latitude;

  AddNewCoordinateWidget({Key? key, this.longitude, this.latitude}) : super(key: key);

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ConstantStrings.addNewCoordinates,
                  style: TextStyle(
                      fontSize: SizeConfig.defaultSize! * Dimens.size16,
                      color: ConstantColors.greyColor,
                      fontFamily: ConstantFonts.poppinsSemiBold),
                ),

                ///------------------ Add Icon ---------------------
                InkWell(
                  onTap: ()=> {
                    Get.to(()=> const NewUserMapScaffold())
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(right: SizeConfig.defaultSize! * Dimens.size15),
                    child: Icon(
                      Icons.add_circle,
                      color: ConstantColors.primaryColor,
                      size: SizeConfig.defaultSize! * Dimens.size25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        ///-------------- Longitude & Latitude section -----------
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.defaultSize! * Dimens.size5,
              right: SizeConfig.defaultSize! * Dimens.size20,
              top: SizeConfig.defaultSize! * Dimens.size20),
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
                      latitude.toString(),
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
                      longitude.toString(),
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
