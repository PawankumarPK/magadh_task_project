// To parse this JSON data, do
//
//     final otpVerificationModel = otpVerificationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OtpVerificationModel otpVerificationModelFromJson(String str) => OtpVerificationModel.fromJson(json.decode(str));

String otpVerificationModelToJson(OtpVerificationModel data) => json.encode(data.toJson());

class OtpVerificationModel {
  String message;
  User user;
  String token;

  OtpVerificationModel({
    required this.message,
    required this.user,
    required this.token,
  });

  factory OtpVerificationModel.fromJson(Map<String, dynamic> json) => OtpVerificationModel(
    message: json["message"],
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  Location location;
  String id;
  String name;
  String email;
  String phone;
  int v;
  DateTime createdAt;
  DateTime updatedAt;
  String token;
  String image;

  User({
    required this.location,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    location: Location.fromJson(json["location"]),
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    v: json["__v"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    token: json["token"],
    image: json["image"]??"",
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "_id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "__v": v,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "token": token,
    "image": image,
  };
}

class Location {
  double latitude;
  double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude??28.620217,
    "longitude": longitude??77.219353,
  };
}
