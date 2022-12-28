// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/exercise_model/exerscise_model.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';

class QuestionTextFieldWidgetWriting extends StatelessWidget {
  final int index;
  final SubQuestions? subQuestion;
  final String? imgeUrl;

  const QuestionTextFieldWidgetWriting({
    Key? key,
    required this.index,
    required this.subQuestion,
    required this.imgeUrl,
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
      duration: const Duration(milliseconds: 400),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            imgeUrl != dashCtrl.imageUrl
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    child: Image.network(
                      imgeUrl ?? "",
                      errorBuilder: (context, error, stackTrace) {
                        return SizedBox();
                      },
                    ))
                : const SizedBox(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 318.w,
                  child: Text(
                    questions.replaceAll(RegExp(r'<#>'), ""),
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            kHeight10,
            subQuestion?.answer == null
                ? const SizedBox()
                : TextFormField(
                    maxLines: 10,
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
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
