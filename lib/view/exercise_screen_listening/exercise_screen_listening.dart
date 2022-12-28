// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/view/exercise_screen_writing/widgets/form_field_and_questions.dart';
import 'package:ielts/view/exercise_screen_listening/widgets/error_widget/error_widget.dart';
import 'package:ielts/view/subject_tests_screen/widgets/app_bar/app_bar.dart';
import 'package:progress_indicator/progress_indicator.dart';

import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/exercise_model/exerscise_model.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/common_widgets/back_button_app_bar/back_button.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/dashboard_screen/bg_cirle_clipper.dart/bg_circle_clipper.dart';
import 'package:ielts/view/result_screen/result_screen.dart';

import 'widgets/app_bar_exercise/app_bar_exercise.dart';
import 'widgets/audio_player_widget/audio_player.dart';
import 'widgets/questions_with_formfield/questions_and_formfield_widget.dart';

class ExerciseListeningScreen extends StatefulWidget {
  final String testId;
  const ExerciseListeningScreen({
    Key? key,
    required this.testId,
  }) : super(key: key);

  @override
  State<ExerciseListeningScreen> createState() =>
      _ExerciseListeningScreenState();
}

final formKey = GlobalKey<FormState>();

class _ExerciseListeningScreenState extends State<ExerciseListeningScreen> {
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
                                Container(
                                    width: screenWidth,
                                    height: screenHeight,
                                    alignment: Alignment.center,
                                    child: CupertinoActivityIndicator(
                                      radius: 20.r,
                                      color: kBlack,
                                    )),
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
                                  timerCtrl.currentSubject.value == "1"
                                      ? AudioPlayer(
                                          id: exerciseCtrl
                                                  .exerciseData[exerciseCtrl
                                                      .currentExerciseIndex
                                                      .value]
                                                  ?.id ??
                                              0)
                                      : const SizedBox(),
                                  kHeight20,
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
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
                                              horizontal: 12.w, vertical: 15.h),
                                          decoration: kBoxDecorExerciseBox,
                                          child: Form(
                                            key: formKey,
                                            child: ListView.separated(
                                                primary: false,
                                                shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  String imageUrl =
                                                      "https://qicksale.com/ept_backend/storage/";
                                                  return QuestionAndAnswerTextFieldWidget(
                                                    imgeUrl:
                                                        "$imageUrl${snapshot.data?[exerciseCtrl.currentExerciseIndex.value]?.image ?? ""}",
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
          floatingActionButton: ElevatedButton(
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
                                        .exerciseData[exerciseCtrl
                                            .currentExerciseIndex.value]
                                        ?.testId
                                        .toString() ??
                                    ""),
                            duration: const Duration(milliseconds: 400),
                            transition: Transition.rightToLeft)
                        : text = "r";
                  }
                }
              },
              child: const Text("SUBMIT"))),
    );
  }
}
