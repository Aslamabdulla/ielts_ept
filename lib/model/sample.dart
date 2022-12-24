import 'dart:convert';

SampleModel sampleModelFromJson(String str) =>
    SampleModel.fromJson(json.decode(str));

String sampleModelToJson(SampleModel data) => json.encode(data.toJson());

class SampleModel {
  SampleModel({
    this.subjectId,
    this.testId,
    this.exerciseId,
    this.category,
    required this.question,
  });

  String? subjectId;
  String? testId;
  String? exerciseId;
  String? category;
  List<Question> question;

  factory SampleModel.fromJson(Map<String, dynamic> json) => SampleModel(
        subjectId: json["subject_id"],
        testId: json["test_id"],
        exerciseId: json["exercise_id"],
        category: json["category"],
        question: List<Question>.from(
            json["question"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subject_id": subjectId,
        "test_id": testId,
        "exercise_id": exerciseId,
        "category": category,
        "question": List<dynamic>.from(question.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    this.questionId,
    this.answer,
    this.audioAnswerFile,
    this.audioRightAnswer,
    this.points,
    this.scoredPoints,
    this.status,
  });

  int? questionId;
  String? answer;
  dynamic? audioAnswerFile;
  dynamic? audioRightAnswer;
  int? points;
  int? scoredPoints;
  String? status;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        questionId: json["question_id"],
        answer: json["answer"],
        audioAnswerFile: json["audio_answer_file"],
        audioRightAnswer: json["audio_right_answer"],
        points: json["points"],
        scoredPoints: json["scored_points"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "answer": answer,
        "audio_answer_file": audioAnswerFile,
        "audio_right_answer": audioRightAnswer,
        "points": points,
        "scored_points": scoredPoints,
        "status": status,
      };
}
