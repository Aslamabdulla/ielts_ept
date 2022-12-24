import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/main.dart';
import 'package:ielts/services/api.dart';
import 'package:ielts/view/dashboard_screen/dashboard_screen.dart';
import 'package:ielts/view/login_screen/login_screen.dart';

class RegistrationController extends GetxController {
  String? name;
  RxBool isLoading = false.obs;
  String? phoneNum;
  String? email;
  Rx<String?> token = prefs.getString("token").obs;

  checkExistence() async {
    try {
      Map data = {"type": "email", "value": email};

      final response = await ApiCalls().postRequest(data, "check_existence/");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        Get.offAll(() => const LoginScreen(),
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
          token.value = prefs.getString("token");

          await dashCtrl.dashBoardFetch(data: dashCtrl.generalData);
          Get.offAll(() => const HomeScreen(),
              transition: Transition.rightToLeft,
              duration: const Duration(milliseconds: 400));

          Get.snackbar("Success", "User registered Successfully");
          isLoading.value = false;
          dashCtrl.update();
        } else {
          Get.snackbar("Error", "Authentication Failed");
          isLoading.value = false;
        }
      } else {
        Get.snackbar("Error", "User Already exist");
        isLoading.value = false;
      }
    } catch (e) {
      Get.snackbar("Error", "Invalid Request");
      isLoading.value = false;
    }
  }

  loginUser() async {
    try {
      Map data = {
        "username": phoneNum,
      };
      final response = await ApiCalls().postRequest(data, "login/");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var postData = jsonDecode(response.body);
        prefs.setString("token", postData["data"]["token"]);
        prefs.setString("name", postData["data"]["name"]);
        token.value = prefs.getString("token");
        print(token);
        await dashCtrl.dashBoardFetch(data: dashCtrl.generalData);
        Get.offAll(() => const HomeScreen(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 400));

        Get.snackbar("Success", "User Login Successfully");
        isLoading.value = false;
        dashCtrl.update();
      } else {
        Get.snackbar("Error", "Authentication Failed");
        isLoading.value = false;
      }
    } catch (e) {
      Get.snackbar("Error", "Error Occured");
      isLoading.value = false;
    }
  }
}
