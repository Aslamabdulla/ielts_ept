import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ielts/main.dart';
import 'package:ielts/services/api.dart';
import 'package:ielts/view/dashboard_screen/dashboard_screen.dart';
import 'package:ielts/view/login_screen/login_screen.dart';

class RegistrationController extends GetxController {
  String? name;
  String? phoneNum;
  String? email;
  settoken() {}
  checkExistence() async {
    try {
      Map data = {"type": "email", "value": email};

      final response = await ApiCalls().postRequest(data, "check_existence/");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var temp = jsonDecode(response.body);
        print(temp["success"]);
        return true;
      } else {
        Get.offAll(() => LoginScreen(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 400));
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  registerUser() async {
    try {
      if (await checkExistence()) {
        Map data = {
          "name": name,
          "phone": phoneNum,
          "institution_id": "1",
          "isd_code": "91",
          "email": email
        };

        final response = await ApiCalls().postRequest(data, "register/");

        if (response.statusCode == 200 || response.statusCode == 201) {
          var postData = jsonDecode(response.body);
          prefs.setString("token", postData["data"]["token"]);
          prefs.setString("name", postData["data"]["name"]);
          var token = prefs.getString("token");
          print(token);

          Get.offAll(() => const HomeScreen(),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 400));
          Get.snackbar("Success", "User registered Successfully");
        } else {
          Get.snackbar("Error", "Authentication Failed");
        }
      } else {
        Get.snackbar("Error", "User Already exist");
      }
    } catch (e) {
      Get.snackbar("Error", "Invalid Request");
    }
  }
}
