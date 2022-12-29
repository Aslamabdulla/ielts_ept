import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common_widgets/back_button_app_bar/back_button.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';

import '../../../common/common_widgets/dialogue_warning_test/warning_dialogue.dart';

AppBar widgetAppBarExercise() {
  return AppBar(
    leading: backButtonLeadingAppBar(false),
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
          exerciseCtrl.isQuitted.value = true;

          exerciseCtrl.resultPageShow.value
              ? dialogueWarning()
              : exerciseCtrl.quitTest();
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
