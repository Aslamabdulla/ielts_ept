import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:ielts/dependency/dependency.dart';

class ApiCalls {
  // final log = logger;
  String kBaseUrl = "https://qicksale.com/ept_backend/api/";
  String imageUrl = "https://qicksale.com/ept_backend/storage/";
  String? token = regCtrl.token.value;
  String category = "";
  Future<http.Response> postRequest(var data, String endpoint) async {
    var fullUrl = kBaseUrl + endpoint;
    var response = await http.post(Uri.parse(fullUrl),
        body: data, headers: {'Authorization': 'Bearer $token'});

    return response;
  }

  Future<http.Response> postTestSubject({required String subjectid}) async {
    if (dashCtrl.switcherIndex4.value == 0) {
      category = "IELTS";
    } else {
      category = "Academic";
    }
    Map temp = {"category": category, "subject_id": subjectid};
    var response = await http.post(Uri.parse("${kBaseUrl}tests/"),
        body: temp, headers: {'Authorization': 'Bearer $token'});

    // print(response.body);
    return response;
  }

  Future<http.Response> postTestExercise({required String testId}) async {
    if (dashCtrl.switcherIndex4.value == 0) {
      category = "IELTS";
    } else {
      category = "Academic";
    }
    Map temp = {"category": category, "test_id": testId};
    var response = await http.post(Uri.parse("${kBaseUrl}exercises/"),
        body: temp, headers: {'Authorization': 'Bearer $token'});

    return response;
  }

  Future<http.Response> saveResult({required Map<String, dynamic> data}) async {
    if (dashCtrl.switcherIndex4.value == 0) {
      category = "IELTS";
    } else {
      category = "Academic";
    }
    // Map temp = {"category": category, "test_id": testId};
    var post = jsonEncode(data);

    var response = await http.post(Uri.parse("${kBaseUrl}save_result/"),
        body: post,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        });

    return response;
  }
}
