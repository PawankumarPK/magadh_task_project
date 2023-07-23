import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/common_widget/appbar_widget.dart';
import 'package:magadh_tech_project/common_widget/edit_profile_widget.dart';
import 'package:magadh_tech_project/common_widget/plain_button.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/child/new_user_map_scaffold.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/controller/add_user_controller.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/map/child/add_user/widgets/add_new-coordinate_widget.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class AddUserScreen extends StatefulWidget {
  AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  var addUserController = Get.put(AddUserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => addUserController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ConstantColors.primaryColor),
            ))
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  AppBarWidget(
                    title: ConstantStrings.addNewUser,
                  ),

                  ///---------- Add New coordinates section -------
                  AddNewCoordinateWidget(longitude: addUserController.longitude.value,latitude: addUserController.latitude.value,),

                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size20),
                    child: Column(
                      children: [
                        ///------------------- Name text field --------------
                        EditTextFields(
                            controller: addUserController.nameController,
                            title: "Name",
                            inputLength: 20,
                            onChanged: (value) {}),

                        ///------------------- Email text field --------------
                        EditTextFields(
                            controller: addUserController.emailController,
                            title: "Email",
                            inputLength: 20,
                            onChanged: (value) {}),

                        ///------------------- Contact text field --------------
                        EditTextFields(
                            controller: addUserController.contactController,
                            title: "Phone",
                            inputLength: 10,
                            onChanged: (value) {}),
                      ],
                    ),
                  ),

                  ///------------------- Get Submit button  --------------
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size50),
                    child: PlainButton(
                        width: double.maxFinite,
                        height: SizeConfig.defaultSize! * Dimens.size55,
                        bgColor: ConstantColors.primaryColor,
                        text: ConstantStrings.submit,
                        textColor: ConstantColors.whiteColor,
                        press: (BuildContext context) =>
                            {addUserController.addNewUserApiFunction()}),
                  ),
                ],
              ),
            ),
    ));
  }
}
