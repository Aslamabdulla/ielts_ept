// To parse this JSON data, do
//
//     final getResultModel = getResultModelFromJson(jsonString);

import 'dart:convert';

GetResultModel getResultModelFromJson(String str) =>
    GetResultModel.fromJson(json.decode(str));

String getResultModelToJson(GetResultModel data) => json.encode(data.toJson());

class GetResultModel {
  GetResultModel({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory GetResultModel.fromJson(Map<String, dynamic> json) => GetResultModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.result,
  });

  Result? result;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}

class Result {
  Result({
    this.id,
    this.institutionId,
    this.userId,
    this.subjectId,
    this.testId,
    this.points,
    this.scoredPoints,
    this.band,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.exercises,
  });

  int? id;
  String? institutionId;
  String? userId;
  String? subjectId;
  String? testId;
  String? points;
  String? scoredPoints;
  dynamic band;
  dynamic comment;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? status;
  List<ExerciseElement>? exercises;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        institutionId: json["institution_id"],
        userId: json["user_id"],
        subjectId: json["subject_id"],
        testId: json["test_id"],
        points: json["points"],
        scoredPoints: json["scored_points"],
        band: json["band"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
        exercises: List<ExerciseElement>.from(
            json["exercises"].map((x) => ExerciseElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "institution_id": institutionId,
        "user_id": userId,
        "subject_id": subjectId,
        "test_id": testId,
        "points": points,
        "scored_points": scoredPoints,
        "band": band,
        "comment": comment,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
        "exercises":
            List<dynamic>.from(exercises?.map((x) => x.toJson()) ?? {}),
      };
}

class ExerciseElement {
  ExerciseElement({
    this.id,
    this.userTestId,
    this.exerciseId,
    this.points,
    this.scoredPoints,
    this.status,
    this.exercise,
    this.subQuestions,
  });

  int? id;
  String? userTestId;
  String? exerciseId;
  String? points;
  String? scoredPoints;
  String? status;
  QuestionClass? exercise;
  List<SubQuestion>? subQuestions;

  factory ExerciseElement.fromJson(Map<String, dynamic> json) =>
      ExerciseElement(
        id: json["id"],
        userTestId: json["user_test_id"],
        exerciseId: json["exercise_id"],
        points: json["points"],
        scoredPoints: json["scored_points"],
        status: json["status"],
        exercise: QuestionClass.fromJson(json["exercise"]),
        subQuestions: List<SubQuestion>.from(
            json["sub_questions"].map((x) => SubQuestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_test_id": userTestId,
        "exercise_id": exerciseId,
        "points": points,
        "scored_points": scoredPoints,
        "status": status,
        "exercise": exercise?.toJson(),
        "sub_questions":
            List<dynamic>.from(subQuestions?.map((x) => x.toJson()) ?? {}),
      };
}

class QuestionClass {
  QuestionClass({
    this.question,
  });

  String? question;

  factory QuestionClass.fromJson(Map<String, dynamic> json) => QuestionClass(
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
      };
}

class SubQuestion {
  SubQuestion({
    this.id,
    this.userExerciseId,
    this.questionId,
    this.answer,
    this.audioAnswer,
    this.rightAnswer,
    this.audioRightAnswer,
    this.points,
    this.scoredPoints,
    this.status,
    this.question,
  });

  int? id;
  String? userExerciseId;
  String? questionId;
  String? answer;
  dynamic audioAnswer;
  String? rightAnswer;
  dynamic audioRightAnswer;
  String? points;
  String? scoredPoints;
  Status? status;
  QuestionClass? question;

  factory SubQuestion.fromJson(Map<String, dynamic> json) => SubQuestion(
        id: json["id"],
        userExerciseId: json["user_exercise_id"],
        questionId: json["question_id"],
        answer: json["answer"] == null ? null : json["answer"],
        audioAnswer: json["audio_answer"],
        rightAnswer: json["right_answer"],
        audioRightAnswer: json["audio_right_answer"],
        points: json["points"],
        scoredPoints: json["scored_points"],
        status: statusValues.map[json["status"]],
        question: QuestionClass.fromJson(json["question"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_exercise_id": userExerciseId,
        "question_id": questionId,
        "answer": answer == null ? null : answer,
        "audio_answer": audioAnswer,
        "right_answer": rightAnswer,
        "audio_right_answer": audioRightAnswer,
        "points": points,
        "scored_points": scoredPoints,
        "status": statusValues.reverse[status],
        "question": question?.toJson(),
      };
}

enum Status { RIGHT, WRONG, NOT_ATTENDED }

final statusValues = EnumValues({
  "Not Attended": Status.NOT_ATTENDED,
  "Right": Status.RIGHT,
  "Wrong": Status.WRONG
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap ?? {};
  }
}
