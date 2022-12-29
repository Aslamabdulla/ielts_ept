import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/common_widgets/notification_widget/notification.dart';
import 'package:ielts/view/result_screen/result_screen.dart';

ElevatedButton floatingActionSubmit(
    BuildContext context, GlobalKey<FormState> formKey) {
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
            notificationSuccess(
                    "Success", "Your previous question was submitted")
                .show(context);
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
