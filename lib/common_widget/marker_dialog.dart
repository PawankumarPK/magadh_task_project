import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/screen/map/controller/map_controller.dart';
import 'package:magadh_tech_project/screen/map/model/all_users_model.dart';
import 'package:magadh_tech_project/utils/size_config.dart';
import 'package:magadh_tech_project/api_services/url/Config.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';

class MarkerDialog extends StatelessWidget {
  final User userDataList;
  var mapController = Get.put(MapController());

  MarkerDialog({Key? key, required this.userDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * Dimens.size350,
      decoration: BoxDecoration(
        color: ConstantColors.whiteColor,
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * Dimens.size20),
        border: Border.all(color: ConstantColors.borderGreyColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///------------------ Image Widget ------------------
          Container(
            width: double.maxFinite,
            height: SizeConfig.defaultSize! * Dimens.size100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('${Config.IMAGE_PATH_URL}/${userDataList.image}')),
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(SizeConfig.defaultSize! * Dimens.size20,),topRight: Radius.circular(SizeConfig.defaultSize! * Dimens.size20,)),
            ),
          ),

          ///------------------ User details Widgets ------------------
          Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.defaultSize! * Dimens.size10,
                left: SizeConfig.defaultSize! * Dimens.size10),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// User name textview
                      Padding(
                        padding: EdgeInsets.only(right: SizeConfig.defaultSize! * Dimens.size5),
                        child: Text(
                          userDataList.name,
                          style: TextStyle(
                              fontFamily: ConstantFonts.poppinsSemiBold,
                              color: ConstantColors.darkGreyColor,
                              fontSize: SizeConfig.defaultSize! * Dimens.size13),
                        ),
                      ),

                      /// Phone textview
                      Padding(
                        padding: EdgeInsets.only(right: SizeConfig.defaultSize! * Dimens.size10),
                        child: Column(
                          children: [
                            Text(
                              userDataList.phone,
                              style: TextStyle(
                                  fontFamily: ConstantFonts.poppinsBold,
                                  color: ConstantColors.darkGreyColor,
                                  fontSize: SizeConfig.defaultSize! * Dimens.size13),
                            ),
                          ],
                        ),
                      ),

                      /// Email Textview
                      Padding(
                        padding: EdgeInsets.only(
                            right: SizeConfig.defaultSize! * Dimens.size2,
                            top: SizeConfig.defaultSize! * Dimens.size5,
                            bottom: SizeConfig.defaultSize! * Dimens.size8),
                        child: Text(
                          userDataList.email,
                          style: TextStyle(
                              fontFamily: ConstantFonts.poppinsSemiBold,
                              color: ConstantColors.primaryColor,
                              fontSize: SizeConfig.defaultSize! * Dimens.size11),
                        ),
                      ),

                      /// Call Button
                      Padding(
                        padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size5),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => {
                                mapController.contactNo.value = userDataList.phone,
                                mapController.call()
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: SizeConfig.defaultSize! * Dimens.size8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.defaultSize! * Dimens.size20),
                                    border: Border.all(color: ConstantColors.primaryColor),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      /// Call Icon
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: SizeConfig.defaultSize! * Dimens.size10,
                                            right: SizeConfig.defaultSize! * Dimens.size5,
                                            top: SizeConfig.defaultSize! * Dimens.size8,
                                            bottom: SizeConfig.defaultSize! * Dimens.size8),
                                        child: Icon(
                                          Icons.call,
                                          color: ConstantColors.primaryColor,
                                          size: SizeConfig.defaultSize! * Dimens.size12,
                                        ),
                                      ),

                                      /// Call textview
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: SizeConfig.defaultSize! * Dimens.size10,
                                            top: SizeConfig.defaultSize! * Dimens.size5,
                                            bottom: SizeConfig.defaultSize! * Dimens.size5),
                                        child: Text(
                                          ConstantStrings.call,
                                          style: TextStyle(
                                              fontFamily: ConstantFonts.poppinsSemiBold,
                                              color: ConstantColors.primaryColor,
                                              fontSize: SizeConfig.defaultSize! * Dimens.size12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
