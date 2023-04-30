// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsondynamic);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(dynamic str) =>
    UserInfoModel.fromJson(json.decode(str));

dynamic userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  Profile profile;

  UserInfoModel({
    required this.profile,
  });

  factory UserInfoModel.fromJson(Map<dynamic, dynamic> json) => UserInfoModel(
        profile: Profile.fromJson(json["profile"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "profile": profile.toJson(),
      };
}

class Profile {
  dynamic username;
  dynamic fullname;
  dynamic email;
  dynamic phoneNumber;
  dynamic aboutMe;
  dynamic profilePhoto;
  dynamic gender;
  dynamic school;
  dynamic course;
  dynamic country;
  dynamic city;
  dynamic detail;

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

  factory Profile.fromJson(Map<dynamic, dynamic> json) => Profile(
        username: json["username"] ?? '',
        fullname: json["fullname"] ?? '',
        email: json["email"] ?? '',
        phoneNumber: json["phone_number"] ?? '',
        aboutMe: json["about_me"] ?? '',
        profilePhoto: json["profile_photo"] ?? '',
        gender: json["gender"] ?? '',
        school: json["school"] ?? '',
        course: json["course"] ?? '',
        country: json["country"] ?? '',
        city: json["city"] ?? '',
        detail: json["detail"],
      );

  Map<dynamic, dynamic> toJson() => {
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
