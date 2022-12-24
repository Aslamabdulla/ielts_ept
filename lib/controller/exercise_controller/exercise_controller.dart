import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/exercise_model/exerscise_model.dart';
import 'package:ielts/model/sample.dart';
import 'package:ielts/services/api.dart';

class ExerciseController extends GetxController {
  ExerciseModel? exerciseModel;
  RxList<Exercises?> exerciseData = <Exercises>[].obs;
  RxInt currentExerciseIndex = 0.obs;
  Rx<bool> isLoading = false.obs;
  RxInt totalExercise = 0.obs;
  String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body?.text).documentElement?.text ?? "";

    return parsedString;
  }

  fetchExercise(String testId) async {
    final response = await ApiCalls().postTestExercise(testId: testId);
    if (response.statusCode == 200 || response.statusCode == 201) {
      exerciseModel = ExerciseModel.fromJson(jsonDecode(response.body));

      exerciseData.value = exerciseModel?.data?.exercises.map((e) {
        e.question = parseHtmlString(e.question ?? "");

        return e;
      }).toList() as List<Exercises?>;
      audioContrl.init();
      isLoading.value = false;

      // sort();
      // isLoading.value = false;
      // return tests;

      // return print("Error occured");
    }
  }

  calculeteTotalExercise(int index) {
    totalExercise.value =
        int.parse(dashCtrl.testTiles[index]?.data.exercisesCount ?? "0");
    exerciseData[timerCtrl.currentindex.value]?.subQuestions?.length ?? 0;
  }

  saveResult() async {
    audioContrl.player.stop();
    Get.back();

    var temp = Question(
            answer: "answer",
            audioAnswerFile: null,
            points: 10,
            status: "Right",
            questionId: 732,
            audioRightAnswer: null,
            scoredPoints: 5)
        .toJson();
    var temp1 = Question(
            answer: "answer",
            audioAnswerFile: null,
            points: 10,
            status: "Right",
            questionId: 733,
            audioRightAnswer: null,
            scoredPoints: 4)
        .toJson();
    List<Map<String, dynamic>> list = [temp, temp1];
    // List<Question> ques = [
    //   {
    //     "question_id": 732,
    //     "answer": "answer",
    //     "audio_answer_file": null,
    //     "right_answer": "yes",
    //     "audio_right_answer": null,
    //     "points": 5,
    //     "scored_points": 4,
    //     "status": "Right"
    //   },

    // ];
    Map<String, dynamic> data = {
      "category": "IELTS",
      "subject_id": 1,
      "test_id": "1",
      "exercise_id": "6",
      "question": list
    };

    // var print = SampleModel.fromJson(data);
    // log(print.question[0].points.toString());
    final response = await ApiCalls().saveResult(data: data);
    onSubmitData();
    // if (response.statusCode == 200 || response.statusCode == 201) {

    // exerciseModel = ExerciseModel.fromJson(jsonDecode(response.body));
    // exerciseData.value = exerciseModel?.data?.exercises.map((e) {
    //   e.question = parseHtmlString(e.question ?? "");

    //   return e;
    // }).toList() as List<Exercises?>;

    // isLoading.value = false;
    // log(exerciseData[0]!.question.toString());
    // sort();
    // isLoading.value = false;
    // return tests;

    // return print("Error occured");
  }

  onSubmitData() {
    exerciseCtrl.currentExerciseIndex.value = 0;
  }
}
