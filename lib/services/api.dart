import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:ielts/dependency/dependency.dart';

class ApiCalls {
  // final log = logger;
  String kBaseUrl = "https://qicksale.com/ept_backend/api/";
  String? token = dashCtrl.token.value;

  Future<http.Response> postRequest(var data, String endpoint) async {
    var fullUrl = kBaseUrl + endpoint;
    var response = await http.post(Uri.parse(fullUrl),
        body: data, headers: {'Authorization': 'Bearer $token'});
    // var res = jsonDecode(response.toString());

    return response;
    // var res = jsonDecode(response.body);
  }
}