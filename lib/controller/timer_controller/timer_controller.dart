import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielts/model/subject_test_model/tests_tiles.dart';

class TimerController extends GetxController {
  ValueNotifier<bool> timerOn = ValueNotifier<bool>(true);
  Timer? _timer;
  int remainingSeconds = 1;
  final time = '00.00'.obs;
  RxBool timerOnNow = false.obs;
  RxInt currentindex = 313.obs;
  RxString currentSubject = "-invalid".obs;
  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  startTimer(int seconds, TestTile? tile) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        time.value = '00.00';
        timerOnNow.value = false;
        int testCount = int.parse(tile?.data.userTest ?? "4");
        tile?.data.userTest = (testCount--).toString();
      } else {
        int minutes = remainingSeconds ~/ 60;

        int seconds = (remainingSeconds % 60);
        time.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainingSeconds--;
      }
    });
  }
}
