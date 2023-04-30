import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_ed/core/function/functions.dart';
import 'package:smart_ed/core/models/auth_models/auth_model.dart';
import 'package:smart_ed/core/models/auth_models/userinfo_model.dart';
import 'package:smart_ed/core/services/base_api.dart';
import 'package:smart_ed/utils/approutes.dart';
import 'package:smart_ed/utils/texts.dart';

class AuthService extends ChangeNotifier {
  bool isLoading = false;

  startloading() {
    isLoading = true;
    notifyListeners();
  }

  stoploading() {
    isLoading = false;
    notifyListeners();
  }

  register(BuildContext context, {uname, fname, email, pass}) {
    startloading();
    var formData = FormData.fromMap({
      'username': uname,
      'fname': fname,
      'email': email,
      'password': pass,
    });

    postRequest(
      url: 'api/v1/auth/jwt/create',
      body: formData,
      onResponse: (response) {
        AuthModel data = AuthModel.fromJson(response.data);
        stoploading();
        if (data.detail != null) {
          AppFunctions().showSnackbar(context, 'Registration successful');
        } else {
          AppFunctions().showSnackbar(context, data.detail!);
        }
      },
      onError: (resp, {error}) {
        stoploading();
        AppFunctions().showSnackbar(context, error);
      },
    );
  }

  login(BuildContext context, {email, pass}) {
    startloading();
    var formData = FormData.fromMap({
      'email': email,
      'password': pass,
    });

    postRequest(
      url: 'api/v1/auth/jwt/create',
      body: formData,
      onResponse: (response) {
        AuthModel data = AuthModel.fromJson(response.data);
        stoploading();
        if (data.detail == null) {
          var box = Hive.box(infobox);
          box.put('access', data.access);
          box.put('refresh', data.refresh);
          userinfo(context);
        } else {
          AppFunctions().showSnackbar(context, data.detail!);
        }
      },
      onError: (resp, {error}) {
        stoploading();
        AppFunctions().showSnackbar(context, resp.message);
      },
    );
  }

  userinfo(BuildContext context) {
    startloading();

    getRequest(
      url: 'api/v1/profile/me',
      onResponse: (response) {
        UserInfoModel data = UserInfoModel.fromJson(response.data);
        stoploading();
        if (data.profile.detail == null) {
          var box = Hive.box(infobox);
          box.put('username', data.profile.username);
          box.put('fullname', data.profile.fullname);
          box.put('email', data.profile.email);
          box.put('phone', data.profile.phoneNumber);
          box.put('about', data.profile.aboutMe);
          box.put('pic', data.profile.profilePhoto);
          box.put('gender', data.profile.gender);
          box.put('school', data.profile.school);
          box.put('course', data.profile.course);
          box.put('country', data.profile.country);
          box.put('city', data.profile.city);

          AppFunctions().showSnackbar(context, 'Login successful');
          Navigator.pushNamed(context, dashboardRoute);
        } else {
          AppFunctions().showSnackbar(context, data.profile.detail!);
        }
      },
      onError: (resp, {error}) {
        stoploading();
        AppFunctions().showSnackbar(context, resp.message);
      },
    );
  }
}
