import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common_widgets/dialogue_warning_test/warning_dialogue.dart';
import 'package:ielts/view/common/constants.dart';

IconButton backButtonLeadingAppBar(bool backEnabled) {
  return IconButton(
      onPressed: () {
        backEnabled
            ? Get.back()
            : exerciseCtrl.resultPageShow.value
                ? dialogueWarning()
                : Get.back();
      },
      icon: Icon(
        Icons.chevron_left,
        size: 30.h,
        color: kBlack,
      ));
}
