import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/view/common/constants.dart';

final screenHeight = Get.height;
final screenWidth = Get.width;

BoxDecoration boxDecorSplash(String image) => BoxDecoration(
    image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover));

BoxDecoration kboxDecorationDialogue(Color color) => BoxDecoration(
      borderRadius: BorderRadius.circular(12.5.r),
      color: color,
    );
final textStyleSubjectsTile =
    TextStyle(fontSize: 14.sp, color: kWhite, fontWeight: FontWeight.w500);
final kBorderRadius10 = BorderRadius.circular(10.r);
final textLatestNewsText10 = TextStyle(
    fontSize: 10.sp, overflow: TextOverflow.clip, fontWeight: FontWeight.w400);
final kDialogueWhiteSubText = TextStyle(
    fontSize: 10.sp,
    overflow: TextOverflow.clip,
    fontWeight: FontWeight.w400,
    color: kWhite);
final headTextNixmat = TextStyle(fontFamily: "Nixmat", fontSize: 20.sp);
final centerTextSubjectScreen =
    TextStyle(fontSize: 15.sp, color: kBlack, fontWeight: FontWeight.w600);
final centerTextSubjectDialogue =
    TextStyle(fontSize: 15.sp, color: kWhite, fontWeight: FontWeight.w600);
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
        color: Colors.grey.withOpacity(.1), //New
        blurRadius: 0.0,
        spreadRadius: 0)
  ],
  borderRadius: BorderRadius.circular(6),
  color: kWhite.withOpacity(.7),
);
final kTextStyleTest = TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp);
final kText12Weight600 =
    TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp);
List<IconData> iconDialogue = [
  Icons.history_edu,
  Icons.volume_up_outlined,
  Icons.headphones,
  Icons.auto_stories,
];

List<String> iconDialogueText = ["Writing", "Speaking", "Listening", "Reading"];
final kTextAppBarExercise =
    TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp, color: kBlack);
final kBoxDecorExerciseBox = BoxDecoration(
  color: kWhite,
  boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(1), //New
        blurRadius: 10.0,
        spreadRadius: 0)
  ],
  borderRadius: BorderRadius.circular(10.r),
);
final kSubmitButtonStyle = ButtonStyle(
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
    backgroundColor:
        const MaterialStatePropertyAll<Color>(Color.fromRGBO(18, 91, 80, 1)),
    fixedSize: MaterialStatePropertyAll<Size>(Size(177.w, 41.h)));
