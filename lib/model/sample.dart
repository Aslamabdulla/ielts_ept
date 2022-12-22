// To parse this JSON data, do
//
//     final modelClass = modelClassFromJson(jsonString);

import 'dart:convert';

ModelClass modelClassFromJson(String str) =>
    ModelClass.fromJson(json.decode(str));

String modelClassToJson(ModelClass data) => json.encode(data.toJson());

class ModelClass {
  ModelClass({
    required this.data,
  });

  Data data;

  factory ModelClass.fromJson(Map<String, dynamic> json) => ModelClass(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.tests,
  });

  List<Test> tests;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tests: List<Test>.from(json["tests"].map((x) => Test.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tests": List<dynamic>.from(tests.map((x) => x.toJson())),
      };
}

class Test {
  Test({
    required this.id,
    required this.name,
    required this.duration,
    required this.exercisesCount,
    required this.userTest,
  });

  int id;
  String name;
  String duration;
  String exercisesCount;
  dynamic userTest;

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json["id"],
        name: json["name"],
        duration: json["duration"],
        exercisesCount: json["exercises_count"],
        userTest: json["user_test"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "duration": duration,
        "exercises_count": exercisesCount,
        "user_test": userTest,
      };
}
