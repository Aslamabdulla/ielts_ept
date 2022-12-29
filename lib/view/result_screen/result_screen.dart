// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animator/animator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common_widgets/result_background_clipper/result_screen_bg_clipper.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/result_screen/widgets/expandable_card_result.dart';

import '../common/common.dart';
import 'widgets/result_widget/result.dart';

class ResultPageScreen extends StatelessWidget {
  final String testId;
  const ResultPageScreen({
    Key? key,
    required this.testId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = Get.width;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: kBlack,
          title: Text(
            "RESULT",
            style: kTextAppBarResult,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            //
          ],
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: ResultBgClipper(),
              child: Container(
                height: 200.0.h,
                width: Get.width,
                decoration:
                    const BoxDecoration(gradient: kLinearGradientResult),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SlideFadeTransition(
                      curve: Curves.elasticOut,
                      delayStart: const Duration(milliseconds: 500),
                      animationDuration: const Duration(milliseconds: 1200),
                      offset: 2.5,
                      direction: Direction.horizontal,
                      child: Text("CHECK YOUR RESULT HERE",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600)),
                    ),
                    kHeight20,
                    const MyCustomWidget(
                      points: "",
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {
            int temp = exerciseCtrl.exerciseData.length;
            int index = exerciseCtrl.currentExerciseIndex.value;
            if (temp - 1 <= index || exerciseCtrl.isQuitted.value) {
              Get.close(2);
              // Get.close(2);
              exerciseCtrl.currentExerciseIndex.value = 0;
              exerciseCtrl.isQuitted.value = false;
              timerCtrl.timerCancel();
            } else if (temp - 1 > index) {
              exerciseCtrl.nextExercise();
              Get.back();
            }
          },
          child: Container(
            height: w / 2.75,
            width: w / 1.5,
            child: Animator<double>(
              duration: const Duration(milliseconds: 2000),
              cycles: 0,
              curve: Curves.easeInOut,
              tween: Tween<double>(begin: 0.0, end: 10.0),
              builder: (context, animatorState, child) => Column(
                children: [
                  SizedBox(
                    height: animatorState.value * 5,
                  ),
                  Container(
                    height: w / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          colors: [
                            tealishBlue,
                            // lavenderBlue,
                            turquiseBlue,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.1, 1]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(.15),
                          blurRadius: 20,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "FINISH TEST",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
