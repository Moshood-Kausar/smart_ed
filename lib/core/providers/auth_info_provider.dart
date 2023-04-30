import 'package:flutter/widgets.dart';

class UserInfoProvider extends ChangeNotifier {
  final UserInfoDB _userInfo = UserInfoDB(
    phoneno: '',
    aboutme: '',
    photo: '',
    gender: '',
    country: '',
    city: '',
    school: '',
    course: '',
    accessToken: '',
    refreshToken: '',
  );

  UserInfoDB get userInfo => _userInfo;

  void setUserInfo(UserInfoDB userInfo) {
    userInfo = userInfo;
    notifyListeners();
  }
}

class UserInfoDB {
  UserInfoDB({
    required this.aboutme,
    required this.accessToken,
    required this.city,
    required this.country,
    required this.course,
    required this.gender,
    required this.photo,
    required this.phoneno,
    required this.refreshToken,
    required this.school,
  });

  String phoneno;
  String aboutme;
  String photo;
  String gender;
  String country;
  String city;
  String school;
  String course;
  String accessToken;
  String refreshToken;
}
