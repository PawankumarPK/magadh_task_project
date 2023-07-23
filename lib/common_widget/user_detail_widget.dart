import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/api_services/url/Config.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/map/child/userslist/controller/userslist_controller.dart';
import 'package:magadh_tech_project/screen/map/model/all_users_model.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class UsersDetailWidget extends StatelessWidget {
  final User usersData;
  var usersListController = Get.put(UsersListController());

  UsersDetailWidget({Key? key, required this.usersData,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size10),
      child: Container(
        height: SizeConfig.defaultSize! * Dimens.size320,
        color: ConstantColors.whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///------------------  User Image ------------------
            Padding(
              padding: EdgeInsets.only(left:SizeConfig.defaultSize! * Dimens.size10,right: SizeConfig.defaultSize! * Dimens.size10),
              child: Container(
                width: double.maxFinite,
                height: SizeConfig.defaultSize! * Dimens.size150,
                decoration:  BoxDecoration(
                  image:  DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('${Config.IMAGE_PATH_URL}/${usersData.image}')),
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.defaultSize! * Dimens.size5)),
                ),
              ),
            ),

            ///------------------ Users details section ------------------
            Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.defaultSize! * Dimens.size10,
                  left: SizeConfig.defaultSize! * Dimens.size10),
              child: SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// user name textview
                          FittedBox(
                            child: Text(
                              usersData.name,
                              style: TextStyle(
                                  fontFamily: ConstantFonts.poppinsSemiBold,
                                  color: ConstantColors.darkGreyColor,
                                  fontSize: SizeConfig.defaultSize! * Dimens.size16),
                            ),
                          ),

                          /// Email section
                          Padding(
                            padding: EdgeInsets.only(
                                right: SizeConfig.defaultSize! * Dimens.size2,
                                top: SizeConfig.defaultSize! * Dimens.size5,
                                bottom: SizeConfig.defaultSize! * Dimens.size8),
                            child: Text(
                              usersData.email,
                              style: TextStyle(
                                  fontFamily: ConstantFonts.poppinsSemiBold,
                                  color: ConstantColors.primaryColor,
                                  fontSize: SizeConfig.defaultSize! * Dimens.size15),
                            ),
                          ),

                        ],
                      ),
                    ),

                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            /// Phone textview
                            Text(
                            usersData.phone,
                              style: TextStyle(
                                  fontFamily: ConstantFonts.poppinsBold,
                                  color: ConstantColors.darkGreyColor,
                                  fontSize: SizeConfig.defaultSize! * Dimens.size14),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ///---------------- Call buttons --------------
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.defaultSize! * Dimens.size10,
                  top: SizeConfig.defaultSize! * Dimens.size15),
              child: InkWell(
                onTap: () => {
                  usersListController.contactNo.value = usersData.phone,
                  usersListController.callNow()
                },
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size8),
                  child: Container(
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size20),
                      border: Border.all(color: ConstantColors.primaryColor),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Call Icon
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.defaultSize! * Dimens.size5,
                              right: SizeConfig.defaultSize! * Dimens.size5,
                              top: SizeConfig.defaultSize! * Dimens.size8,
                              bottom: SizeConfig.defaultSize! * Dimens.size8),
                          child: Icon(
                            Icons.call,
                            color: ConstantColors.primaryColor,
                            size: SizeConfig.defaultSize! * Dimens.size20,
                          ),
                        ),

                        /// Call textview
                        Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.defaultSize! * Dimens.size10,
                              top: SizeConfig.defaultSize! * Dimens.size8,
                              bottom: SizeConfig.defaultSize! * Dimens.size8),
                          child: Text(
                            ConstantStrings.call,
                            style: TextStyle(
                                fontFamily: ConstantFonts.poppinsSemiBold,
                                color: ConstantColors.primaryColor,
                                fontSize: SizeConfig.defaultSize! * Dimens.size13),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
