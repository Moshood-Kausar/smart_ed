// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  String refresh;
  String access;
  String? detail;

  AuthModel({
    required this.refresh,
    required this.access,
    this.detail,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        refresh: json["refresh"],
        access: json["access"],
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "detail": detail,
      };
}
