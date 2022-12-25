// To parse this JSON data, do
//
//     final testsModel = testsModelFromJson(jsonString);

// import 'dart:convert';

// TestsModel testsModelFromJson(String str) =>
//     TestsModel.fromJson(json.decode(str));

// String testsModelToJson(TestsModel data) => json.encode(data.toJson());

// class TestsModel {
//   TestsModel({
//     required this.success,
//     required this.data,
//     required this.message,
//   });

//   bool success;
//   Data data;
//   String message;

//   factory TestsModel.fromJson(Map<String, dynamic> json) => TestsModel(
//         success: json["success"],
//         data: Data.fromJson(json["data"]),
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "data": data.toJson(),
//         "message": message,
//       };
// }

// class Data {
//   Data({
//     required this.tests,
//   });

//   List<Test> tests;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         tests: List<Test>.from(json["tests"].map((x) => Test.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "tests": List<dynamic>.from(tests.map((x) => x.toJson())),
//       };
// }

// class Test {
//   Test({
//     required this.id,
//     required this.name,
//     required this.duration,
//     required this.exercisesCount,
//     this.userTest,
//   });

//   int id;
//   String name;
//   String duration;
//   String exercisesCount;
//   dynamic userTest;

//   factory Test.fromJson(Map<String, dynamic> json) => Test(
//         id: json["id"],
//         name: json["name"],
//         duration: json["duration"],
//         exercisesCount: json["exercises_count"],
//         userTest: json["user_test"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "duration": duration,
//         "exercises_count": exercisesCount,
//         "user_test": userTest,
//       };
// }
// To parse this JSON data, do
//
//     final testModel = testModelFromJson(jsonString);

import 'dart:convert';

TestsModel testModelFromJson(String str) =>
    TestsModel.fromJson(json.decode(str));

String testsModelToJson(TestsModel data) => json.encode(data.toJson());

class TestsModel {
  TestsModel({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory TestsModel.fromJson(Map<String, dynamic> json) => TestsModel(
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
    this.tests,
  });

  List<Test>? tests;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tests: List<Test>.from(json["tests"].map((x) => Test.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tests": List<dynamic>.from(tests?.map((x) => x.toJson()) ?? {}),
      };
}

class Test {
  Test({
    this.id,
    this.name,
    this.duration,
    this.exercisesCount,
    this.userTest,
  });

  int? id;
  String? name;
  String? duration;
  String? exercisesCount;
  UserTest? userTest;

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json["id"],
        name: json["name"],
        duration: json["duration"],
        exercisesCount: json["exercises_count"],
        userTest: json["user_test"] == null
            ? null
            : UserTest.fromJson(json["user_test"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "duration": duration,
        "exercises_count": exercisesCount,
        "user_test": userTest == null ? null : userTest?.toJson(),
      };
}

class UserTest {
  UserTest({
    this.id,
    this.testId,
    this.scoredPoints,
    this.exercisesCount,
  });

  int? id;
  String? testId;
  String? scoredPoints;
  String? exercisesCount;

  factory UserTest.fromJson(Map<String, dynamic> json) => UserTest(
        id: json["id"],
        testId: json["test_id"],
        scoredPoints: json["scored_points"],
        exercisesCount: json["exercises_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "test_id": testId,
        "scored_points": scoredPoints,
        "exercises_count": exercisesCount,
      };
}
