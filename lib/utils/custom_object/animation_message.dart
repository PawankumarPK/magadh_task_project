import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/res/dimens.dart';
import 'package:magadh_tech_project/utils/size_config.dart';


class AnimationMessage{

  void toast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ConstantColors.primaryColor,
        textColor: Colors.white,
        fontSize: SizeConfig.defaultSize! * Dimens.size16);
  }

  void snackBar(String title,String content){
    Get.snackbar(
      title,
      content,
      //icon: Icon(Icons.person, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: ConstantColors.redColor,
      borderRadius: SizeConfig.defaultSize! * Dimens.size1,
      margin: EdgeInsets.all(SizeConfig.defaultSize! * Dimens.size2),
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      //dismissDirection: SnackBarD.HORIZONTAL,
      forwardAnimationCurve: Curves.easeOutBack,

    );

  }



}