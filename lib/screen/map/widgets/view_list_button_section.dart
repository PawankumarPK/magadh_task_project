import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/screen/map/child/userslist/users_list_scaffold.dart';
import 'package:magadh_tech_project/screen/map/controller/map_controller.dart';
import 'package:magadh_tech_project/utils/size_config.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';

class ViewListButtonSection extends StatelessWidget {
  var mapController = Get.put(MapController());

  ViewListButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: SizeConfig.defaultSize! * Dimens.size15,
          bottom: SizeConfig.defaultSize! * Dimens.size150),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          Get.to(const UsersListScaffold());
          // goToLake()
        },

        /// Container of add new user
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
                    color: ConstantColors.whiteColor,
                  ),

                  ///------------------ user list Icon ---------------------
                  child: Icon(
                    Icons.list_alt,
                    color: ConstantColors.primaryColor,
                    size: SizeConfig.defaultSize! * Dimens.size20,
                  ),
                ),
              ),

              ///------------------ View list text ---------------------
              Padding(
                padding: EdgeInsets.all(SizeConfig.defaultSize! * Dimens.size10),
                child: Center(
                  child: Text(
                    ConstantStrings.viewList,
                    style: TextStyle(
                        color: ConstantColors.whiteColor,
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
