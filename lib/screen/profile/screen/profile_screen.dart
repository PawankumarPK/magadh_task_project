import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/common_widget/appbar_widget.dart';
import 'package:magadh_tech_project/screen/profile/controller/profile_controller.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/profile/widget/coordinates_widget.dart';
import 'package:magadh_tech_project/screen/profile/widget/my_account_widget.dart';
import 'package:magadh_tech_project/screen/profile/widget/profile_detail_widget.dart';
import 'package:magadh_tech_project/screen/profile/widget/profile_img_widget.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => profileController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ConstantColors.primaryColor),
            ))
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarWidget(title: "Profile"),

                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.defaultSize! * Dimens.size25,
                      right: SizeConfig.defaultSize! * Dimens.size15,
                    ),
                    child: Row(
                      children: [

                        ///---------- Profile img widget ---------
                        Flexible(
                          flex: 3,
                          child: ProfileImgWidget()
                        ),

                        ///----------- Profile detail widget ----------
                        Flexible(
                          flex: 7,
                          child: ProfileDetailWidget()
                        )
                      ],
                    ),
                  ),

                  ///------------- Coordinates Widget ----------
                  const CoordinatesWidget(),

                  ///--------------------- My Account section --------------
                  MyAccountWidget()
                ],
              ),
            ),
    ));
  }
}
