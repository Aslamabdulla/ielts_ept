// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:progress_indicator/progress_indicator.dart';

import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/exercise_model/exerscise_model.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/common_widgets/back_button_app_bar/back_button.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/dashboard_screen/bg_cirle_clipper.dart/bg_circle_clipper.dart';

import 'widgets/questions_with_formfield/questions_and_formfield_widget.dart';
import 'widgets/app_bar_exercise/app_bar_exercise.dart';
import 'widgets/audio_player_widget/audio_player.dart';

class ExerciseTestSubjectScreen extends StatefulWidget {
  const ExerciseTestSubjectScreen({super.key});

  @override
  State<ExerciseTestSubjectScreen> createState() =>
      _ExerciseTestSubjectScreenState();
}

final formKey = GlobalKey<FormState>();

class _ExerciseTestSubjectScreenState extends State<ExerciseTestSubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Stack(
          children: [
            BgCircleFirstClipper(width: screenWidth),
            BGCircleSecondClipper(width: screenWidth),
            Obx(() => !exerciseCtrl.isLoading.value
                ? SafeArea(
                    child: exerciseCtrl.exerciseData.value.isNotEmpty
                        ? Column(
                            children: [
                              widgetAppBarExercise(),
                              AudioPlayer(
                                  id: exerciseCtrl
                                          .exerciseData[exerciseCtrl
                                              .currentExerciseIndex.value]
                                          ?.id ??
                                      0),
                              kHeight20,
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                          exerciseCtrl
                                                  .exerciseData[exerciseCtrl
                                                      .currentExerciseIndex
                                                      .value]
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
                                          horizontal: 10.w, vertical: 15.h),
                                      decoration: kBoxDecorExerciseBox,
                                      child: Form(
                                        key: formKey,
                                        child: ListView.separated(
                                            primary: false,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return QuestionAndAnswerTextFieldWidget(
                                                index: index,
                                                subQuestion: exerciseCtrl
                                                    .exerciseData[exerciseCtrl
                                                        .currentExerciseIndex
                                                        .value]
                                                    ?.subQuestions?[index],
                                              );
                                            },
                                            separatorBuilder:
                                                (context, index) => kHeight15,
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
                                height: 100.h,
                                width: 50.w,
                              )
                            ],
                          )
                        : Column(
                            children: [
                              widgetAppBarExercise(),
                              Container(
                                  width: screenWidth,
                                  height: screenHeight,
                                  alignment: Alignment.center,
                                  child: const Text("Error Occured")),
                            ],
                          ))
                : Column(
                    children: [
                      widgetAppBarExercise(),
                      Container(
                          width: screenWidth,
                          height: screenHeight,
                          alignment: Alignment.center,
                          child: CupertinoActivityIndicator(
                            radius: 20.r,
                            color: kBlack,
                          )),
                    ],
                  ))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
          style: kSubmitButtonStyle,
          onPressed: () async {
            // FocusScope.of(context).unfocus();
            exerciseCtrl.textControllerChange.value = false;
            int temp = exerciseCtrl.exerciseData.length;
            int index = exerciseCtrl.currentExerciseIndex.value;
            exerciseCtrl.saveResult().then((value) {
              if (temp - 1 > index) {
                exerciseCtrl.nextExercise();
                formKey.currentState?.reset();
                exerciseCtrl.textControllerChange.value = true;
              } else {
                exerciseCtrl.saveResult();
              }
            });
          },
          child: const Text("SUBMIT")),
    );
  }
}
