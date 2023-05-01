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
  int course;
  List<Question> questions;

  CourseListModel({
    required this.id,
    required this.course,
    required this.questions,
  });

  factory CourseListModel.fromJson(Map<String, dynamic> json) =>
      CourseListModel(
        id: json["id"],
        course: json["course"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course": course,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  String id;
  String questionText;
  List<Answer> answers;

  Question({
    required this.id,
    required this.questionText,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        questionText: json["question_text"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question_text": questionText,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}

class Answer {
  String id;
  String answerText;
  bool isCorrect;

  Answer({
    required this.id,
    required this.answerText,
    required this.isCorrect,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        answerText: json["answer_text"],
        isCorrect: json["is_correct"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "answer_text": answerText,
        "is_correct": isCorrect,
      };
}
