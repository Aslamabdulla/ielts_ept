import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:slide_switcher/slide_switcher.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int switcherIndex4 = 0;
  @override
  Widget build(BuildContext context) {
    return SlideSwitcher(
      onSelect: (int index) => setState(() => switcherIndex4 = index),
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
              color: switcherIndex4 == 0 ? kWhite : Colors.transparent),
          child: Text(
            'General',
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: switcherIndex4 == 0
                    ? kBlack.withOpacity(0.9)
                    : Colors.white),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 30.h,
          width: 80.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: switcherIndex4 == 1 ? kWhite : Colors.transparent),
          child: Text(
            'Academic',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 11.sp,
                color: switcherIndex4 == 1
                    ? kBlack.withOpacity(0.9)
                    : Colors.white),
          ),
        ),
      ],
    );
  }
}
