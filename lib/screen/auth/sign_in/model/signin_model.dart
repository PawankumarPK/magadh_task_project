// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  String message;
  int otp;

  SignInModel({
    required this.message,
    required this.otp,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    message: json["message"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "otp": otp,
  };
}
