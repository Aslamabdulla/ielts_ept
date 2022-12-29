import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/exercise_model/exerscise_model.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/exercise_screen_listening/widgets/questions_with_formfield/questions_and_formfield_widget.dart';

Container buidExerciseScreen(
    AsyncSnapshot<List<Exercises?>> snapshot, GlobalKey<FormState> formKey) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15.w),
    child: Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
                exerciseCtrl
                        .exerciseData[exerciseCtrl.currentExerciseIndex.value]
                        ?.question
                        .toString() ??
                    "",
                overflow: TextOverflow.clip,
                style: kText12Weight600),
          ),
          kHeight10,
          Container(
            width: 390.w,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
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
          ),
        ],
      ),
    ),
  );
}
