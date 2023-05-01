import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_ed/core/function/functions.dart';
import 'package:smart_ed/core/models/course_model/create_course_model.dart';
import 'package:smart_ed/core/services/base_api.dart';

class CourseService extends ChangeNotifier {
  bool isLoading = false;

  startloading() {
    isLoading = true;
    notifyListeners();
  }

  stoploading() {
    isLoading = false;
    notifyListeners();
  }

  createcourse(BuildContext context, {name, code, content}) {
    startloading();

    var formData = FormData.fromMap({
      "name": name,
      "course_code": code,
      "content": content,
    });

    postRequest(
      url: 'api/v1/courses/create/',
      body: formData,
      onResponse: (onResponse) {
        CreateCourseModel snap = CreateCourseModel.fromJson(onResponse.data);
        stoploading();
        if (snap.name.isNotEmpty) {
          AppFunctions().showSnackbar(context, 'Course created successfully.');
        } else {
          AppFunctions().showSnackbar(context, 'An error occured.');
        }
      },
      onError: (resp, {error}) {
        stoploading();
        String removebrac = resp.message.toString().replaceAll('[', '');
        String removebrac2 = removebrac.replaceAll(']', '');
        String removeCurly = removebrac2.replaceAll('{', '');
        String last = removeCurly.replaceAll('}', '');
        AppFunctions().showSnackbar(context, last);
      },
    );
  }
}
