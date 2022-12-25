import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common_widgets/back_button_app_bar/back_button.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';

AppBar widgetAppBarExercise() {
  return AppBar(
    leading: backButtonLeadingAppBar(),
    backgroundColor: Colors.transparent,
    foregroundColor: kBlack,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.timer_outlined,
          color: kBlack,
          size: 20.sp,
        ),
        kWidth5,
        Obx(
          () => Text(
            timerCtrl.time.value,
            style: kTextAppBarExercise,
          ),
        )
      ],
    ),
    elevation: 0,
    centerTitle: true,
    actions: [
      TextButton(
        onPressed: () {
          // exerciseCtrl.saveResult();
          timerCtrl.timerCancel();
          Get.back();
          dashCtrl.fetchTests(subjectId: timerCtrl.currentSubject.value);
          timerCtrl.timerOnNow.value = false;
          audioContrl.audioPlayer.pause();
          int tries = int.parse(
              dashCtrl.testTiles[timerCtrl.currentindex.value]?.tries ?? "4");
          tries--;
          exerciseCtrl.saveResult();
          dashCtrl.testTiles[timerCtrl.currentindex.value]?.tries =
              tries.toString();

          dashCtrl.refreshGroup("trycount");

          // exerciseCtrl.currentExerciseIndex.value = 0;
        },
        child: Text(
          "Quit Exam",
          style: kTextAppBarExercise,
        ),
      ),
      kWidth10,
    ],
  );
}
