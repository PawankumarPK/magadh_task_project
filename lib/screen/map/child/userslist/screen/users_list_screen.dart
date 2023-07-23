import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/common_widget/appbar_widget.dart';
import 'package:magadh_tech_project/common_widget/user_detail_widget.dart';
import 'package:magadh_tech_project/common_widget/plain_button.dart';
import 'package:magadh_tech_project/screen/map/child/userslist/controller/userslist_controller.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/map/controller/map_controller.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  var usersListController = Get.put(UsersListController());
  var mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => usersListController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ConstantColors.primaryColor),
            ))
          : Container(
              color: ConstantColors.bgColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///------------------ AppBar section ---------------------
                  const Flexible(
                    flex: 1,
                      child: AppBarWidget(title: "All Users",)),


                  ///------------------ All Users Listview ---------------------
                  Flexible(
                    flex: 7,
                      child: allUsersListBody())
                ],
              ),
            ),
    ));
  }

  Widget allUsersListBody() {
    if (usersListController.isLoading.value) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(ConstantColors.primaryColor),
      ));
    }

    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: mapController.allUserList.isNotEmpty

          ? ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: mapController.allUserList.length,
              itemBuilder: (BuildContext ctx, int index) {
                final usersData = mapController.allUserList[index];

                return UsersDetailWidget(
                  usersData: usersData,
                );
              },
            )
          : Center(
              /// If list is blank
              child: Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.defaultSize! * Dimens.size15,
                    right: SizeConfig.defaultSize! * Dimens.size10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ConstantStrings.noUserAvailable,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: ConstantFonts.poppinsBold,
                          color: ConstantColors.darkGreyColor,
                          fontSize: SizeConfig.defaultSize! * Dimens.size15),
                    ),

                  ],
                ),
              ),
            ),
    );
  }

}
