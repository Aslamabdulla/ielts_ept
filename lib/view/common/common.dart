import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/view/common/constants.dart';

final screenHeight = Get.height;
final screenWidth = Get.width;

BoxDecoration boxDecorSplash(String image) => BoxDecoration(
    image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover));
final textStyleSubjectsTile =
    TextStyle(fontSize: 14.sp, color: kWhite, fontWeight: FontWeight.w500);
final kBorderRadius10 = BorderRadius.circular(10.r);
final textLatestNewsText10 = TextStyle(
    fontSize: 10.sp, overflow: TextOverflow.clip, fontWeight: FontWeight.w400);
