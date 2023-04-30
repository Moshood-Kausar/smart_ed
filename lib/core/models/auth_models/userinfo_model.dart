// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) =>
    UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  Profile profile;

  UserInfoModel({
    required this.profile,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "profile": profile.toJson(),
      };
}

class Profile {
  String username;
  String fullname;
  String email;
  String phoneNumber;
  String aboutMe;
  String profilePhoto;
  String gender;
  String school;
  String course;
  String country;
  String city;
  String? detail;

  Profile({
    required this.username,
    required this.fullname,
    required this.email,
    required this.phoneNumber,
    required this.aboutMe,
    required this.profilePhoto,
    required this.gender,
    required this.school,
    required this.course,
    required this.country,
    required this.city,
    this.detail,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        aboutMe: json["about_me"],
        profilePhoto: json["profile_photo"],
        gender: json["gender"],
        school: json["school"],
        course: json["course"],
        country: json["country"],
        city: json["city"],
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "fullname": fullname,
        "email": email,
        "phone_number": phoneNumber,
        "about_me": aboutMe,
        "profile_photo": profilePhoto,
        "gender": gender,
        "school": school,
        "course": course,
        "country": country,
        "city": city,
        "detail": detail,
      };
}
