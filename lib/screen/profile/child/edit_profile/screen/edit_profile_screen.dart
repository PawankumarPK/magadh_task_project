import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magadh_tech_project/common_widget/appbar_widget.dart';
import 'package:magadh_tech_project/common_widget/edit_profile_widget.dart';
import 'package:magadh_tech_project/common_widget/plain_button.dart';
import 'package:magadh_tech_project/screen/profile/child/edit_profile/controller/edit_profile_controller.dart';
import 'package:magadh_tech_project/api_services/url/Config.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/constant_fonts.dart';
import 'package:magadh_tech_project/res/constant_strings.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/screen/profile/child/edit_profile/widgets/profile_pic_widget.dart';
import 'package:magadh_tech_project/utils/custom_object/custom_object.dart';
import 'package:magadh_tech_project/utils/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var editProfileController = Get.put(EditProfileController());
  bool noImage = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => editProfileController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ConstantColors.primaryColor),
            ))
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarWidget(title: "Edit Profile",),

                  ///-------------- Profile pic section ----------
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size50),
                    child: Column(
                      children: [
                        InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => {selectOptionBottomSheet()},
                            child: ProfilePicWidget()),

                        ///------------------- Name text field --------------
                        EditTextFields(
                            controller: TextEditingController(
                              text: editProfileController.name.value,
                            ),
                            title: ConstantStrings.enterName,
                            inputLength: 20,
                            onChanged: (value) {
                              editProfileController.nameController.text = value;
                            }),

                        ///------------------- Contact text field --------------
                        EditTextFields(
                            controller: TextEditingController(
                              text: editProfileController.contactNo.value == "0"
                                  ? ""
                                  : editProfileController.contactNo.value,
                            ),
                            title: ConstantStrings.enterContact,
                            inputLength: 10,
                            onChanged: (value) {
                              editProfileController.contactController.text = value;
                            }),

                        ///------------------- Email text field --------------
                        EditTextFields(
                            controller: TextEditingController(
                              text: editProfileController.emailId.value == "0"
                                  ? ""
                                  : editProfileController.emailId.value,
                            ),
                            title: ConstantStrings.enterEmail,
                            inputLength: 30,
                            onChanged: (value) {
                              editProfileController.emailController.text = value;
                            }),

                      ],
                    ),
                  ),

                  ///------------------- Get Submit button  --------------
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.defaultSize! * Dimens.size20),
                    child: PlainButton(
                        width: double.maxFinite,
                        height: SizeConfig.defaultSize! * Dimens.size55,
                        bgColor: ConstantColors.primaryColor,
                        text: ConstantStrings.submit,
                        textColor: ConstantColors.whiteColor,
                        press: (BuildContext context) => {

                              if (editProfileController.file == null && editProfileController.profileImage.value != "No Image"){
                                editProfileController.updateProfileApiFunction(File(CustomObject.imgStringPath)),
                              } else {
                                editProfileController.updateProfileApiFunction(editProfileController.file!),
                              }
                         }),
                  ),
                ],
              ),
            ),
    ));
  }

  void selectOptionBottomSheet() {
    double width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: ConstantColors.whiteColor,
            child: Wrap(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(SizeConfig.defaultSize! * Dimens.size20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: width,
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.defaultSize! * Dimens.size10),
                        child: Text(
                          ConstantStrings.chooseOption,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: ConstantColors.blackColor,fontFamily: ConstantFonts.poppinsSemiBold),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * Dimens.size20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.defaultSize! * Dimens.size20),
                        width: width,
                        height: 1.0,
                        color: ConstantColors.greyColor.withOpacity(0.5),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          selectProfilePic(ImageSource.camera);
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: width,
                          padding: EdgeInsets.all(SizeConfig.defaultSize! * Dimens.size10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.camera_alt,
                                color: Colors.black.withOpacity(0.7),
                                size: SizeConfig.defaultSize! * Dimens.size20,
                              ),
                              SizedBox(
                                width: SizeConfig.defaultSize! * Dimens.size10,
                              ),
                              Text(ConstantStrings.camera,
                                  style: TextStyle(color: ConstantColors.blackColor,  fontFamily: ConstantFonts.poppinsRegular
                                  )),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          selectProfilePic(ImageSource.gallery);
                        },
                        child: Container(
                          width: width,
                          padding: EdgeInsets.all(SizeConfig.defaultSize! * Dimens.size10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.photo_album,
                                color: Colors.black.withOpacity(0.7),
                                size: SizeConfig.defaultSize! * Dimens.size20,
                              ),
                              SizedBox(
                                width: SizeConfig.defaultSize! * Dimens.size10,
                              ),
                              Text(
                                ConstantStrings.uploadFromGallery,
                                style: TextStyle(color: ConstantColors.blackColor,fontFamily: ConstantFonts.poppinsRegular),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Future selectProfilePic(ImageSource source) async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(source: source);
    if (mounted) {
      noImage = false;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        editProfileController.file = File(imageFile!.path);
        CustomObject.imgPath = File(imageFile.path);
        prefs.setString("profileImgPath", editProfileController.file!.path);
      });
    }
  }
}
