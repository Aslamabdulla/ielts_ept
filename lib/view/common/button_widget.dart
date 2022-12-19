import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constants.dart';

Widget buttonWidget(String string, double width, VoidCallback voidCallback) {
  Size size = Get.size;

  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: voidCallback,
    child: Container(
      height: 49.h,
      width: width.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kBlack,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        string,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
