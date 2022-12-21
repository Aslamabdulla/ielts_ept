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

  postSubject({required subject_id}) async {
    if (dashCtrl.switcherIndex4.value == 0) {
      category = "IELTS";
    } else {
      category = "Academic";
    }
    Map temp = {"category": category, "subject_id": subject_id};
    var response = await http.post(Uri.parse(kBaseUrl + "subject/"),
        body: temp, headers: {'Authorization': 'Bearer $token'});

    print(response.body);
    return response;
  }
}
