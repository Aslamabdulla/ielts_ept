import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/exercise_model/exerscise_model.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/exercise_screen/exercise_screen_listening.dart';

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

    audioContrl.currentUrl.value = exerciseCtrl
            .exerciseData[exerciseCtrl.currentExerciseIndex.value]?.audio ??
        "";
    exerciseCtrl.mapQuestions();
    return FadeIn(
      duration: Duration(milliseconds: 400),
      child: Column(
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
                  onChanged: (value) {
                    if (exerciseCtrl.textControllerChange.value) {
                      exerciseCtrl.questionData.value[index]?.answer = value;
                    }

                    // subQuestion?.type?.name = value;
                    print(exerciseCtrl.questionData.value[index]?.answer);
                  },
                ),
        ],
      ),
    );
  }
}
