import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/view/common/constants.dart';

IconButton backButtonLeadingAppBar() {
  return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.chevron_left,
        size: 30.h,
        color: kBlack,
      ));
}
