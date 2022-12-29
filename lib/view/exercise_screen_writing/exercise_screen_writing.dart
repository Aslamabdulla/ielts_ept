// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ielts/dependency/dependency.dart';

import 'package:ielts/view/common/common.dart';

import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/dashboard_screen/bg_cirle_clipper.dart/bg_circle_clipper.dart';
import 'package:ielts/view/exercise_screen_listening/widgets/activity_indicator/activity_indicator.dart';
import 'package:ielts/view/exercise_screen_listening/widgets/app_bar_exercise/app_bar_exercise.dart';

import 'package:ielts/view/exercise_screen_listening/widgets/error_widget/error_widget.dart';

import 'widgets/buider_exercise_writing_widget/exercise_writing_builder.dart';
import 'widgets/submit_button/submit_button.dart';

class ExerciseWritingScreen extends StatefulWidget {
  final String testId;
  final int index;
  const ExerciseWritingScreen({
    Key? key,
    required this.testId,
    required this.index,
  }) : super(key: key);

  @override
  State<ExerciseWritingScreen> createState() => _ExerciseWritingScreenState();
}

final formKey = GlobalKey<FormState>();

class _ExerciseWritingScreenState extends State<ExerciseWritingScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: kWhite,
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Stack(
              children: [
                BgCircleFirstClipper(width: screenWidth),
                BGCircleSecondClipper(width: screenWidth),
                SafeArea(
                    child: FutureBuilder(
                        future: exerciseCtrl.fetchExercise(widget.testId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const ActivityIndicatorWidget();
                          } else if (snapshot.hasError) {
                            exerciseCtrl.resultPageShow.value = false;
                            return const ErrorWidgetNetwork(
                              image: "assets/images/404.gif",
                            );
                          } else if (snapshot.data == null) {
                            exerciseCtrl.resultPageShow.value = false;
                            return const ErrorWidgetNetwork(
                              image: "assets/images/404.gif",
                            );
                          } else if (exerciseCtrl.exerciseData.isEmpty) {
                            exerciseCtrl.resultPageShow.value = false;
                            return const ErrorWidgetNetwork(
                              image: "assets/images/completed_task.gif",
                            );
                          } else {
                            exerciseCtrl.resultPageShow.value = true;

                            return Obx(
                              () => Column(
                                children: [
                                  widgetAppBarExercise(),
                                  kHeight20,
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 5.r),
                                          child: Text(
                                              exerciseCtrl
                                                      .exerciseData[
                                                          widget.index]
                                                      ?.question
                                                      .toString() ??
                                                  "",
                                              overflow: TextOverflow.clip,
                                              style: kText12Weight600),
                                        ),
                                        kHeight10,
                                        buildExersiceWritingWidget(
                                            snapshot, formKey),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 200.h,
                                    width: 200.w,
                                  )
                                ],
                              ),
                            );
                          }
                        }))
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: floatingActionButtonSubmit(context, formKey)),
    );
  }
}
