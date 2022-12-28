// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/dashboard_screen/bg_cirle_clipper.dart/bg_circle_clipper.dart';
import 'package:ielts/view/exercise_screen_listening/widgets/app_bar_exercise/app_bar_exercise.dart';
import 'package:ielts/view/exercise_screen_listening/widgets/audio_player_widget/audio_player.dart';
import 'package:ielts/view/exercise_screen_listening/widgets/error_widget/error_widget.dart';
import 'package:ielts/view/exercise_screen_listening/widgets/questions_with_formfield/questions_and_formfield_widget.dart';
import 'package:ielts/view/exercise_screen_writing/widgets/form_field_and_questions.dart';
import 'package:ielts/view/result_screen/result_screen.dart';

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
                            return Column(
                              children: [
                                widgetAppBarExercise(),
                                activityindicator(),
                              ],
                            );
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
                                        Container(
                                          width: 390.w,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.w, vertical: 15.h),
                                          decoration: kBoxDecorExerciseBox,
                                          child: Form(
                                            key: formKey,
                                            child: ListView.separated(
                                                primary: false,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  return QuestionTextFieldWidgetWriting(
                                                    imgeUrl:
                                                        "$exerciseCtrl.imageUrl${snapshot.data?[exerciseCtrl.currentExerciseIndex.value]?.image ?? ""}",
                                                    index: index,
                                                    subQuestion: exerciseCtrl
                                                        .exerciseData[exerciseCtrl
                                                            .currentExerciseIndex
                                                            .value]
                                                        ?.subQuestions?[index],
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) =>
                                                        kHeight15,
                                                itemCount: exerciseCtrl
                                                        .exerciseData[exerciseCtrl
                                                            .currentExerciseIndex
                                                            .value]
                                                        ?.subQuestions
                                                        ?.length ??
                                                    0),
                                          ),
                                        ),
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
          floatingActionButton: floatingActionButtonSubmit()),
    );
  }

  Container activityindicator() {
    return Container(
        width: screenWidth,
        height: screenHeight,
        alignment: Alignment.center,
        child: CupertinoActivityIndicator(
          radius: 20.r,
          color: kBlack,
        ));
  }

  ElevatedButton floatingActionButtonSubmit() {
    return ElevatedButton(
        style: kSubmitButtonStyle,
        onPressed: () async {
          if (exerciseCtrl.resultPageShow.value) {
            exerciseCtrl.textControllerChange.value = false;
            int temp = exerciseCtrl.exerciseData.length;
            int index = exerciseCtrl.currentExerciseIndex.value;
            if (temp - 1 > index) {
              // exerciseCtrl.addPrevAnswerdQuestions();
              exerciseCtrl.addPrevAnswerdQuestion();
              exerciseCtrl.nextExercise();
              formKey.currentState?.reset();
              exerciseCtrl.textControllerChange.value = true;
            } else {
              var text;
              exerciseCtrl.saveResult();
              audioContrl.audioPlayer.pause();
              exerciseCtrl.resultPageShow.value
                  ? Get.to(
                      () => ResultPageScreen(
                          testId: exerciseCtrl
                                  .exerciseData[
                                      exerciseCtrl.currentExerciseIndex.value]
                                  ?.testId
                                  .toString() ??
                              ""),
                      duration: const Duration(milliseconds: 400),
                      transition: Transition.rightToLeft)
                  : text = "r";
            }
          }
        },
        child: const Text("SUBMIT"));
  }
}
