import 'package:flutter/material.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common.dart';

ElevatedButton submitButtonFloatingAction(BuildContext context) {
  return ElevatedButton(
      style: kSubmitButtonStyle,
      onPressed: () {
        FocusScope.of(context).unfocus();
        int temp = exerciseCtrl.exerciseData.length;
        int index = exerciseCtrl.currentExerciseIndex.value;

        if (temp - 1 > index) {
          exerciseCtrl.currentExerciseIndex.value++;
          audioContrl.init();
        } else {
          exerciseCtrl.saveResult();
        }
      },
      child: const Text("SUBMIT"));
}
