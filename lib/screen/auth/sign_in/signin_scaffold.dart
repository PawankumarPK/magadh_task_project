import 'package:flutter/material.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/screen/auth/sign_in/screen/signin_screen.dart';
import 'package:magadh_tech_project/utils/size_config.dart';

class SignInScaffold extends StatelessWidget {
  const SignInScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Initialize size config
    SizeConfig().init(context);

    return  Scaffold(
      backgroundColor: ConstantColors.primaryColor,
      body: SignInScreen(),
    );
  }
}
