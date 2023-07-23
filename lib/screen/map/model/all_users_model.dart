
import 'package:meta/meta.dart';
import 'dart:convert';

AllUsersModel allUsersModelFromJson(String str) => AllUsersModel.fromJson(json.decode(str));

String allUsersModelToJson(AllUsersModel data) => json.encode(data.toJson());

class AllUsersModel {
  List<User> users;
  int count;
  int page;

  AllUsersModel({
    required this.users,
    required this.count,
    required this.page,
  });

  factory AllUsersModel.fromJson(Map<String, dynamic> json) => AllUsersModel(
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    count: json["count"],
    page: json["page"],
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
    "count": count,
    "page": page,
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
    token: json["token"]??"",
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
    "latitude": latitude,
    "longitude": longitude,
  };
}
