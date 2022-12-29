import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/main.dart';
import 'package:ielts/model/dashboard_model/dash_board_model.dart';
import 'package:ielts/model/subject_test_model/test_model/test_model.dart';
import 'package:ielts/model/subject_test_model/tests_tiles.dart';

import 'package:ielts/services/api.dart';
import 'package:ielts/model/category_bottom_nav/category.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/subject_tests_screen/widgets/premium_dialogue_box/dialogue_premium_widget.dart';

class DashBoardController extends GetxController {
  String imageUrl = "https://qicksale.com/ept_backend/storage/";
  RxInt switcherIndex4 = 0.obs;
  Rx<String?> token = prefs.getString("token").obs;
  RxList<Subject>? subjectList = <Subject>[].obs;
  RxList<bool> isSelected = [true, false].obs;
  RxInt currentBottomIndex = 0.obs;
  RxInt prevBottomIndex = 0.obs;
  RxBool isLoading = false.obs;
  var pecentage = 0.0.obs;
  RxBool deactivated = true.obs;
  Rx<String?> userName = "USER".obs;
  Map generalData = {"category": "IELTS", "type": "General"};
  Map academicData = {"category": "IELTS", "type": "Academic"};
  RxDouble padding = 150.0.h.obs;
  RxDouble bottomPadding = 0.0.h.obs;

  var dashboardData = Rxn<DashBoardModel>();
  Future<DashBoardModel?> dashBoardFetch({Map? data}) async {
    try {
      data ??= generalData;
      final response = await ApiCalls().postRequest(data, "dashboard/");
      if (response.statusCode == 200 || response.statusCode == 201) {
        token = prefs.getString("token").obs;
        var temp = await jsonDecode(response.body);
        userName.value = prefs.getString("name");
        dashboardData.value = DashBoardModel.fromJson(temp);
        subjectList?.value = dashboardData.value?.data.subjects.map((e) {
              return e;
            }).toList() ??
            [];
        return dashboardData.value;
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
      double temp = double.parse(
              dashboardData.value?.data.subjects[index].userTestsCount ?? "0") /
          double.parse(
              dashboardData.value?.data.subjects[index].testsCount.toString() ??
                  "1");
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

    if (tests?.data == null) {
      return;
    } else {
      tests?.data?.tests?.forEach((element) {
        if (element.userTest == null) {
          testTiles.add(TestTile(deactivated.value, element, "4", true));
        } else if (int.parse(element.userTest?.exercisesCount ?? "4") >= 4) {
          testTiles.add(TestTile(deactivated.value, element, "0", true));
        } else if (int.parse(element.userTest?.exercisesCount ?? "4") >= 0) {
          int count = 4 - int.parse(element.userTest?.exercisesCount ?? "4");
          testTiles.add(
              TestTile(deactivated.value, element, count.toString(), true));
        }
      });
    }
  }

  Future<TestsModel?> fetchTests({required String subjectId}) async {
    try {
      final response = await ApiCalls().postTestSubject(subjectid: subjectId);
      if (response.statusCode == 200 || response.statusCode == 201) {
        tests = testModelFromJson(response.body);

        sort();
        isLoading.value = false;
        return tests;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  showpPremiumDialogue() {
    Get.defaultDialog(
        title: "",
        backgroundColor: Colors.transparent,
        content: Column(
          children: [
            const DialogueBoxPremiumWidget(
                color: kDialogueboxColor1, package: "Full Package"),
            kHeight15,
            const DialogueBoxPremiumWidget(
                color: kDialogueboxColor2, package: "Custom"),
          ],
        ));
  }

  @override
  void onClose() {
    regCtrl.dispose();
    timerCtrl.dispose();
    exerciseCtrl.dispose();
    dashCtrl.dispose();
    super.onClose();
  }
}
