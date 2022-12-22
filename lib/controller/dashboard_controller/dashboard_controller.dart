import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielts/main.dart';
import 'package:ielts/model/dashboard_model/dash_board_model.dart';
import 'package:ielts/model/subject_test_model/test_model/test_model.dart';
import 'package:ielts/model/subject_test_model/tests_tiles.dart';
import 'package:ielts/services/api.dart';
import 'package:ielts/model/category_bottom_nav/category.dart';

class DashBoardController extends GetxController {
  RxInt switcherIndex4 = 0.obs;
  Rx<String?> token = prefs.getString("token").obs;
  RxList<bool> isSelected = [true, false].obs;
  RxInt currentBottomIndex = 0.obs;
  RxInt prevBottomIndex = 0.obs;
  RxBool isLoading = false.obs;
  var pecentage = 0.0.obs;
  Rx<String?> userName = "USER".obs;
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
        userName.value = prefs.getString("name");
        dashboardData = DashBoardModel.fromJson(temp);
        return dashboardData;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  RxList<Category> categoryList = [
    Category("Home", Icons.home, true),
    Category("Refer a friend", Icons.campaign, false),
    Category("Find a Course", Icons.menu_book_outlined, false),
    Category("My Account", Icons.account_box_outlined, false),
  ].obs;

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

  TestsModel? tests;
  RxList<TestTile?> testTiles = <TestTile>[].obs;

  sort() {
    testTiles.clear();
    String temp = "4";
    if (tests?.data == null) {
      return;
    } else {
      tests?.data.tests.forEach((element) {
        if (element.userTest == null) {
          element.userTest = temp;
        } else {
          int count = 4 - int.parse(element.userTest);
          element.userTest = count.toString();
        }

        testTiles.add(TestTile(true, element, element.userTest, true));
      });
    }
  }

  Future<TestsModel?> fetchTests({required String subjectId}) async {
    try {
      final response = await ApiCalls().postTestSubject(subjectid: subjectId);
      if (response.statusCode == 200 || response.statusCode == 201) {
        tests = testsModelFromJson(response.body);

        sort();
        isLoading.value = false;
        return tests;
      }
    } catch (e) {
      return null;
    }
    update();
  }
}
