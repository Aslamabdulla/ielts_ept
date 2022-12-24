// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/view/exercise_screen/widgets/submit_button/submit_button.dart';
import 'package:progress_indicator/progress_indicator.dart';

import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/exercise_model/exerscise_model.dart';
import 'package:ielts/view/common/common_widgets/back_button_app_bar/back_button.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/dashboard_screen/bg_cirle_clipper.dart/bg_circle_clipper.dart';

import 'widgets/app_bar_exercise/app_bar_exercise.dart';
import 'widgets/audio_player_widget/audio_player.dart';

class ExerciseTestSubjectScreen extends StatelessWidget {
  const ExerciseTestSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!audioContrl.isPlaying.value) {
        audioContrl.init();
      }
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Stack(
          children: [
            BgCircleFirstClipper(width: screenWidth),
            BGCircleSecondClipper(width: screenWidth),
            SafeArea(
                child: Obx(() => !exerciseCtrl.isLoading.value
                    ? Column(
                        children: [
                          widgetAppBarExercise(),
                          audioPlayerWidget(),
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
                                                  .currentExerciseIndex.value]
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
                                  child: ListView.separated(
                                      primary: false,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return QuestionAndAnswerTextFieldWidget(
                                          index: index,
                                          subQuestion: exerciseCtrl
                                              .exerciseData[exerciseCtrl
                                                  .currentExerciseIndex.value]
                                              ?.subQuestions?[index],
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          kHeight15,
                                      itemCount: exerciseCtrl
                                              .exerciseData[exerciseCtrl
                                                  .currentExerciseIndex.value]
                                              ?.subQuestions
                                              ?.length ??
                                          0),
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
                    : Container(
                        width: screenWidth,
                        height: screenHeight,
                        alignment: Alignment.center,
                        child: CupertinoActivityIndicator(
                          radius: 20.r,
                          color: kBlack,
                        ))))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: submitButtonFloatingAction(context),
    );
  }
}

class QuestionAndAnswerTextFieldWidget extends StatelessWidget {
  final int index;
  final SubQuestions? subQuestion;
  const QuestionAndAnswerTextFieldWidget({
    Key? key,
    required this.index,
    required this.subQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String questions =
        exerciseCtrl.parseHtmlString(subQuestion?.question ?? "");
    print(exerciseCtrl
        .exerciseData[exerciseCtrl.currentExerciseIndex.value]?.audio);
    audioContrl.currentUrl.value = exerciseCtrl
            .exerciseData[exerciseCtrl.currentExerciseIndex.value]?.audio ??
        "";
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 318.w,
              child: Text(
                questions.replaceAll(RegExp(r'<#>'), ""),
                overflow: TextOverflow.clip,
                style: TextStyle(
                    color: Colors.black.withOpacity(.6),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        kHeight10,
        subQuestion?.answer == null
            ? const SizedBox()
            : TextFormField(
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(
                    bottom: 10,
                    left: 10,
                  ),
                  hintText: "Type here",
                  border: OutlineInputBorder(

                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      )),
                ),
              ),
      ],
    );
  }
}
