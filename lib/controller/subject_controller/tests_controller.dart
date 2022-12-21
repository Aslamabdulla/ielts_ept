import 'dart:convert';

import 'package:get/get.dart';
import 'package:ielts/main.dart';
import 'package:ielts/model/subject_tests_model/tests_tiles.dart';
import 'package:ielts/model/subject_tests_model/test_model/test_model.dart';
import 'package:ielts/services/api.dart';

class TestController extends GetxController {
  Rx<String?>? token;
  TestsModel? tests;
  RxList<TestTile?> testTiles = <TestTile>[].obs;

  sort() {
    testTiles.clear();
    if (tests?.data == null) {
      return;
    } else {
      tests?.data.tests.forEach((element) {
        String temp = "4";
        element.userTest ??= element.userTest = temp;

        testTiles.add(TestTile(true, element, element.userTest));
      });

      // tests?.data.tests.map((e) {
      //   // print(e.name);
      //   return testTiles.add(TestTile(true, e, 4));
      // });
      // print(name);
    }
  }

  printTile() {
    print(testTiles.toString());
  }

  Future<TestsModel?> fetchTests({required String subjectId}) async {
    try {
      final response = await ApiCalls().postTestSubject(subjectid: subjectId);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print("hello");
        // var results = testsModelFromJson(response);
        // token = prefs.getString("token").obs;
        // print(response.body);

        tests = testsModelFromJson(response.body);
        // print(response.body);
        // print(tests?.data.tests.length);
        // tests = await jsonDecode(response.body);
        sort();
        return tests;
      }
    } catch (e) {
      return null;
    }
    update();
  }
}
