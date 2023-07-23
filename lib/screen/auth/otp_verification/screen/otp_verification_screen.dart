import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magadh_tech_project/screen/auth/otp_verification/controller/otp_verification_controller.dart';
import 'package:magadh_tech_project/screen/auth/otp_verification/widget/otp_top_widget.dart';
import 'package:magadh_tech_project/screen/auth/otp_verification/widget/verification_code_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  var otpVerificationController = Get.put(OtpVerificationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 4,
            child: OtpTopWidget(),
          ),
          Flexible(
            flex: 5,
            child: VerificationCodeWidget(),
          ),
        ],
      ),
    );
  }
}
