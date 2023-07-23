import 'package:flutter/material.dart';
import 'package:magadh_tech_project/res/constant_colors.dart';
import 'package:magadh_tech_project/screen/auth/otp_verification/screen/otp_verification_screen.dart';


class OtpVerificationScaffold extends StatelessWidget {
  const OtpVerificationScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: ConstantColors.primaryColor,
      body: OtpVerificationScreen(),
    );
  }
}
