// To parse this JSON data, do
//
//     final createCourseModel = createCourseModelFromJson(jsonString);

import 'dart:convert';

CreateCourseModel createCourseModelFromJson(String str) =>
    CreateCourseModel.fromJson(json.decode(str));

String createCourseModelToJson(CreateCourseModel data) =>
    json.encode(data.toJson());

class CreateCourseModel {
  String name;
  String courseCode;
  String content;

  CreateCourseModel({
    required this.name,
    required this.courseCode,
    required this.content,
  });

  factory CreateCourseModel.fromJson(Map<String, dynamic> json) =>
      CreateCourseModel(
        name: json["name"],
        courseCode: json["course_code"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "course_code": courseCode,
        "content": content,
      };
}
