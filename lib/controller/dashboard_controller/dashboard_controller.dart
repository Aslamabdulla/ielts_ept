import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielts/main.dart';
import 'package:ielts/model/dashboard_model/dash_board_model.dart';
import 'package:ielts/services/api.dart';
import 'package:ielts/model/category_bottom_nav/category.dart';

class DashBoardController extends GetxController {
  RxInt switcherIndex4 = 0.obs;
  Rx<String?> token = prefs.getString("token").obs;
  RxList<bool> isSelected = [true, false].obs;
  RxInt currentBottomIndex = 0.obs;
  RxInt prevBottomIndex = 0.obs;
  var pecentage = 0.0.obs;
  Rx<String?> userName = prefs.getString("name").obs;
  Map generalData = {"category": "IELTS", "type": "General"};
  Map academicData = {"category": "IELTS", "type": "Academic"};
  DashBoardModel? dashboardData;
  Future<DashBoardModel?> dashBoardFetch({Map? data}) async {
    try {
      data ??= generalData;

      final response = await ApiCalls().postRequest(data, "dashboard/");

      if (response.statusCode == 200 || response.statusCode == 201) {
        token = prefs.getString("token").obs;
        var temp = await jsonDecode(response.body);

        dashboardData = DashBoardModel.fromJson(temp);
        return dashboardData;

        //  var data = DashBoardModel.
      } else {
        // Get.offAll(() => LoginScreen(),
        //     transition: Transition.rightToLeft,
        //     duration: const Duration(milliseconds: 400));
        return null;
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
  // @override
  // void onReady() {
  //   dashBoardFetch();
  //   super.onReady();
  // }

  Future<double> calculatePercentage(int index) async {
    try {
      double temp = dashboardData?.data.subjects[index].userTestsCount /
          dashboardData?.data.subjects[index].testsCount;
      if (temp == null) {
        pecentage.value == 0;
      }
      pecentage.value = temp * 100;
    } catch (e) {
      pecentage.value = 0.0;
    }
    return pecentage.value;
    // update();
  }
}
