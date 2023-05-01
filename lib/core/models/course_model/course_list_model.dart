// To parse this JSON data, do
//
//     final courseListModel = courseListModelFromJson(jsonString);

import 'dart:convert';

List<CourseListModel> courseListModelFromJson(String str) =>
    List<CourseListModel>.from(
        json.decode(str).map((x) => CourseListModel.fromJson(x)));

String courseListModelToJson(List<CourseListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseListModel {
  String id;
  String name;
  String courseCode;
  String content;

  CourseListModel({
    required this.id,
    required this.name,
    required this.courseCode,
    required this.content,
  });

  factory CourseListModel.fromJson(Map<String, dynamic> json) =>
      CourseListModel(
        id: json["id"],
        name: json["name"],
        courseCode: json["course_code"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "course_code": courseCode,
        "content": content,
      };
}
