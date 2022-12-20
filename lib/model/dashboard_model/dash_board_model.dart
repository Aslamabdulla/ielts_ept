// To parse this JSON data, do
//
//     final dashBoardModel = dashBoardModelFromJson(jsonString);

import 'dart:convert';

DashBoardModel dashBoardModelFromJson(String str) => DashBoardModel.fromJson(json.decode(str));

String dashBoardModelToJson(DashBoardModel data) => json.encode(data.toJson());

class DashBoardModel {
    DashBoardModel({
      required  this.success,
    required    this.data,
    required    this.message,
    });

    bool success;
    Data data;
    String message;

    factory DashBoardModel.fromJson(Map<String, dynamic> json) => DashBoardModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    Data({
   required     this.user,
   required     this.subjects,
   required     this.lessons,
 required       this.latestNews,
    });

    User user;
    List<Subject> subjects;
    List<Lesson> lessons;
    List<LatestNew> latestNews;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        subjects: List<Subject>.from(json["subjects"].map((x) => Subject.fromJson(x))),
        lessons: List<Lesson>.from(json["lessons"].map((x) => Lesson.fromJson(x))),
        latestNews: List<LatestNew>.from(json["latest_news"].map((x) => LatestNew.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
        "lessons": List<dynamic>.from(lessons.map((x) => x.toJson())),
        "latest_news": List<dynamic>.from(latestNews.map((x) => x.toJson())),
    };
}

class LatestNew {
    LatestNew({
   required     this.id,
   required     this.institutionId,
  required      this.image,
  required      this.title,
   required     this.description,
    required    this.createdAt,
    required    this.updatedAt,
     required   this.status,
    });

    int id;
    String institutionId;
    String image;
    String title;
    String description;
    DateTime createdAt;
    DateTime updatedAt;
    String status;

    factory LatestNew.fromJson(Map<String, dynamic> json) => LatestNew(
        id: json["id"],
        institutionId: json["institution_id"],
        image: json["image"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "institution_id": institutionId,
        "image": image,
        "title": title,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": status,
    };
}

class Lesson {
    Lesson({
    required    this.id,
   required     this.icon,
   required     this.title,
    });

    int id;
    String icon;
    String title;

    factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json["id"],
        icon: json["icon"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "title": title,
    };
}

class Subject {
    Subject({
  required      this.id,
    required    this.subjectId,
     required   this.userTestsCount,
  required      this.testsCount,
  required      this.subject,
    });

    int id;
    String subjectId;
    dynamic userTestsCount;
    int testsCount;
    User subject;

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        subjectId: json["subject_id"],
        userTestsCount: json["user_tests_count"],
        testsCount: json["tests_count"],
        subject: User.fromJson(json["subject"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subject_id": subjectId,
        "user_tests_count": userTestsCount,
        "tests_count": testsCount,
        "subject": subject.toJson(),
    };
}

class User {
    User({
   required     this.id,
    required    this.name,
    });

    int id;
    String name;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
