import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/exercise_model/exerscise_model.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/exercise_screen_writing/widgets/form_field_writing/form_field_and_questions.dart';

Container buildExersiceWritingWidget(
    AsyncSnapshot<List<Exercises?>> snapshot, GlobalKey<FormState> formKey) {
  return Container(
    width: 390.w,
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
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
                  .exerciseData[exerciseCtrl.currentExerciseIndex.value]
                  ?.subQuestions?[index],
            );
          },
          separatorBuilder: (context, index) => kHeight15,
          itemCount: exerciseCtrl
                  .exerciseData[exerciseCtrl.currentExerciseIndex.value]
                  ?.subQuestions
                  ?.length ??
              0),
    ),
  );
}
