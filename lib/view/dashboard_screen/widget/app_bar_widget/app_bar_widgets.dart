import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/view/common/common_widgets/animated_container_toggle_switch/animated_toggle_switch.dart';
import 'package:ielts/view/common/constants.dart';

class AppBarDashBoard extends StatelessWidget {
  const AppBarDashBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 20).r,
          child: Image.asset(
            "assets/images/logo.png",
            height: 50.h,
            // width: .w,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0).r,
          child: const SliderWidget(),
        ),
      ],
    );
  }
}
