import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/controller/internet_check_controller/internet_controller.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/exercise_screen_listening/widgets/app_bar_exercise/app_bar_exercise.dart';

class ErrorWidgetNetwork extends StatelessWidget {
  final String image;
  const ErrorWidgetNetwork({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      timerCtrl.timerCancel();
    });
    return Column(
      children: [
        widgetAppBarExercise(),
        GetBuilder<InterNetCheckController>(
            init: InterNetCheckController(),
            builder: (ctrl) {
              return Container(
                  width: screenWidth,
                  height: screenHeight,
                  alignment: Alignment.center,
                  child: Image.asset(
                    ctrl.isConnected.value ? image : "assets/images/404.gif",
                    height: 150.h,
                    width: 150.w,
                  ));
            }),
      ],
    );
  }
}
