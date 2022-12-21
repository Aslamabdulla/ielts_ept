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
final headTextNixmat = TextStyle(fontFamily: "Nixmat", fontSize: 20.sp);
final centerTextSubjectScreen =
    TextStyle(fontSize: 16.sp, color: kBlack, fontWeight: FontWeight.w600);
final kSubjectTesttile = BoxDecoration(
  boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(.5), //New
        blurRadius: 8.0,
        spreadRadius: 0)
  ],
  borderRadius: BorderRadius.circular(6),
  color: kWhite,
);
final kSubjectTesttileWithOpacity = BoxDecoration(
  boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(.25), //New
        blurRadius: 5.0,
        spreadRadius: 0)
  ],
  borderRadius: BorderRadius.circular(6),
  color: kWhite.withOpacity(.5),
);
