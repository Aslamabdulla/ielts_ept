import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/constants.dart';

Future<dynamic> dialogueWarning() {
  return Get.defaultDialog(
      backgroundColor: Colors.white,
      title: "Warning",
      titleStyle: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 20.sp, color: kBlack),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/warning.gif",
            height: 250.h,
            width: 250..w,
          ),
          Text(
            "Test is in progress, this will impact your score are you wish to continue??  ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16.sp, color: kBlack),
          ),
          kHeight15,
        ],
      ),
      actions: <Widget>[
        TextButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                backgroundColor: const MaterialStatePropertyAll<Color>(kBlack)),
            onPressed: () async {
              Get.close(2);
              if (exerciseCtrl.resultPageShow.value) {
                exerciseCtrl.quitTest();
              }
            },
            child: Text(
              "OK",
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 16.sp, color: kWhite),
            ))
      ]);
}
