import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielts/main.dart';
import 'package:ielts/services/api.dart';
import 'package:ielts/view/common/bottom_nav_bar/widgets/category.dart';
import 'package:ielts/view/login_screen/login_screen.dart';

class DashBoardController extends GetxController {
  Rx<String?> token = prefs.getString("token").obs;
  RxList<bool> isSelected = [true, false].obs;
  RxInt currentBottomIndex = 0.obs;
  RxInt prevBottomIndex = 0.obs;
  Rx<String?> userName = prefs.getString("name").obs;
  dashBoardFetch() async {
    print(token.value);
    try {
      Map data = {"category": "IELTS", "type": "General"};

      final response = await ApiCalls().postRequest(data, "dashboard/");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var temp = jsonDecode(response.body);
        print(response.body);
      } else {
        Get.offAll(() => LoginScreen(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 400));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  RxList<Category> categoryList = [
    Category("Home", Icons.home, true),
    Category("Refer a friend", Icons.campaign, false),
    Category("Find a Course", Icons.menu_book_outlined, false),
    Category("My Account", Icons.account_box_outlined, false),
  ].obs;
}
