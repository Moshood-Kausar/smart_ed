// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String username;
  String fullName;
  String email;
  int pkid;
  List<String>? password;

  RegisterModel({
    required this.username,
    required this.fullName,
    required this.email,
    required this.pkid,
    this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        username: json["username"],
        fullName: json["full_name"],
        email: json["email"],
        pkid: json["pkid"],
        password: json["password"] ?? [],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "full_name": fullName,
        "email": email,
        "pkid": pkid,
        "password": password,
      };
}
