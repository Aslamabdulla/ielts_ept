// To parse this JSON data, do
//
//     final resultModel = resultModelFromJson(jsonString);

import 'dart:convert';

ResultModel resultModelFromJson(String str) =>
    ResultModel.fromJson(json.decode(str));

String resultModelToJson(ResultModel data) => json.encode(data.toJson());

class ResultModel {
  ResultModel({
    this.subjectId,
    this.testId,
    this.exerciseId,
    this.category,
    required this.questions,
  });

  String? subjectId;
  String? testId;
  String? exerciseId;
  String? category;
  List<Questions?> questions;

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        subjectId: json["subject_id"],
        testId: json["test_id"],
        exerciseId: json["exercise_id"],
        category: json["category"],
        questions: List<Questions>.from(
            json["questions"].map((x) => Questions.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subject_id": subjectId,
        "test_id": testId,
        "exercise_id": exerciseId,
        "category": category,
        "questions": List<dynamic>.from(questions.map((x) => x?.toJson())),
      };
}

class Questions {
  Questions({
    this.questionId,
    this.answer,
    this.audioAnswerFile,
    this.audioRightAnswer,
    this.points,
    this.scoredPoints,
    this.status,
    this.rightAnswer,
  });

  int? questionId;
  String? answer;
  dynamic audioAnswerFile;
  dynamic audioRightAnswer;
  int? points;
  int? scoredPoints;
  String? status;
  String? rightAnswer;

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        questionId: json["question_id"],
        answer: json["answer"],
        audioAnswerFile: json["audio_answer_file"],
        audioRightAnswer: json["audio_right_answer"],
        points: json["points"],
        scoredPoints: json["scored_points"],
        status: json["status"],
        rightAnswer: json["right_answer"],
      );

  Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "answer": answer,
        "audio_answer_file": audioAnswerFile,
        "audio_right_answer": audioRightAnswer,
        "points": points,
        "scored_points": scoredPoints,
        "status": status,
        "right_answer": rightAnswer,
      };
}
