// To parse this JSON data, do
//
//     final profileDetailModel = profileDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileDetailModel profileDetailModelFromJson(String str) => ProfileDetailModel.fromJson(json.decode(str));

String profileDetailModelToJson(ProfileDetailModel data) => json.encode(data.toJson());

class ProfileDetailModel {
  String message;
  User user;

  ProfileDetailModel({
    required this.message,
    required this.user,
  });

  factory ProfileDetailModel.fromJson(Map<String, dynamic> json) => ProfileDetailModel(
    message: json["message"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user.toJson(),
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
    "name": name??"Update Your Name",
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
  dynamic latitude;
  dynamic longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    latitude: json["latitude"]??0.0,
    longitude: json["longitude"]??0.0,
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}
