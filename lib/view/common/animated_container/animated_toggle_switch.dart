import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:slide_switcher/slide_switcher.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SlideSwitcher(
        onSelect: (int index) {
          dashCtrl.switcherIndex4.value = index;
        },
        containerColor: Colors.black,
        containerBorder: Border.all(color: Colors.transparent),
        containerBorderRadius: 10,
        slidersGradients: const [
          LinearGradient(
            colors: [
              kWhite,
              kWhite,
            ],
          ),
          LinearGradient(
            colors: [
              kWhite,
              kWhite,
            ],
          ),
        ],
        indents: 5,
        containerHeight: 40.h,
        containerWight: 150.w,
        children: [
          Container(
            alignment: Alignment.center,
            height: 30.h,
            width: 65.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: dashCtrl.switcherIndex4.value == 0
                    ? kWhite
                    : Colors.transparent),
            child: FittedBox(
              child: Text(
                'General',
                style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: dashCtrl.switcherIndex4.value == 0
                        ? kBlack.withOpacity(0.9)
                        : Colors.white),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 30.h,
            width: 80.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: dashCtrl.switcherIndex4.value == 1
                    ? kWhite
                    : Colors.transparent),
            child: FittedBox(
              child: Text(
                'Academic',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp,
                    color: dashCtrl.switcherIndex4.value == 1
                        ? kBlack.withOpacity(0.9)
                        : Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
