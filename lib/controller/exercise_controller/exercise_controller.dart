import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/exercise_model/exerscise_model.dart';
import 'package:ielts/model/result_model/result_model.dart';

import 'package:ielts/services/api.dart';

class ExerciseController extends GetxController {
  ExerciseModel? exerciseModel;
  RxBool textControllerChange = true.obs;
  RxList<Exercises?> exerciseData = <Exercises>[].obs;
  RxInt currentExerciseIndex = 0.obs;
  Rx<bool> isLoading = false.obs;
  RxInt totalExercise = 0.obs;
  int totalScore = 0;
  RxList<Questions?> questionData = <Questions>[].obs;
  String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body?.text).documentElement?.text ?? "";

    return parsedString;
  }

  fetchExercise(String testId) async {
    isLoading.value = true;
    try {
      final response = await ApiCalls().postTestExercise(testId: testId);
      if (response.statusCode == 200 || response.statusCode == 201) {
        exerciseModel = ExerciseModel.fromJson(jsonDecode(response.body));

        exerciseData.value = exerciseModel?.data?.exercises.map((e) {
          e.question = parseHtmlString(e.question ?? "");

          return e;
        }).toList() as List<Exercises?>;
        await audioContrl.setAudio();

        isLoading.value = false;
      }

      // sort();
      // isLoading.value = false;
      // return tests;

      // return print("Error occured");
    } catch (e) {
      log(e.toString());
    }
  }

  calculeteTotalExercise(int index) {
    totalExercise.value =
        int.parse(dashCtrl.testTiles[index]?.data.exercisesCount ?? "0");
    exerciseData[timerCtrl.currentindex.value]?.subQuestions?.length ?? 0;
  }

  Future saveResult() async {
    try {
      int score = 3;
      // Get.back();

      // onSubmitData();
      // audioContrl.audioPlayer.stop();

      print("called");
      var resultData = questionData.map((element) {
        // score = element?.scoredPoints ?? 0;
        element?.points = 5;
        if (element?.answer == null || element?.answer == "") {
          // totalScore++;
          element?.status = "NOT ATTENDED";
        } else if (element?.answer != null &&
            element?.answer?.toString().trim().toLowerCase() ==
                element?.rightAnswer.toString().trim().toLowerCase()) {
          // score++;
          totalScore++;
          element?.scoredPoints = score;
          element?.status = "Right";
        } else {
          element?.scoredPoints = 0;
          element?.status == "Wrong";
        }
        // score = 0;
        return element;
      }).toList();

      var result = ResultModel(
          subjectId: timerCtrl.currentSubject.value,
          questions: resultData,
          category: "IELTS",
          exerciseId: exerciseData[currentExerciseIndex.value]?.id.toString(),
          testId: exerciseData[currentExerciseIndex.value]?.testId.toString());
      exerciseData[currentExerciseIndex.value];
      var responce = await ApiCalls().saveResult(data: result.toJson());
      log(responce.statusCode.toString());
      totalScore = 0;
    } catch (e) {
      return null;
    }
  }

  onSubmitData() {
    // exerciseCtrl.currentExerciseIndex.value = 0;
  }

  nextExercise() {
    currentExerciseIndex.value++;

    audioContrl.openAudio(exerciseCtrl
            .exerciseData[exerciseCtrl.currentExerciseIndex.value]?.id ??
        0);
    audioContrl.isPlaying.value = false;
    textControllerChange.value = false;
  }

  mapQuestions() {
    try {
      questionData.value =
          exerciseData[currentExerciseIndex.value]?.subQuestions?.map((e) {
                return Questions(
                    answer: "",
                    audioAnswerFile: null,
                    audioRightAnswer: null,
                    points: 0,
                    questionId: e.id,
                    scoredPoints: 0,
                    rightAnswer: e.answer,
                    status: "Pending");
              }).toList() ??
              [];
      isLoading.value = false;
    } catch (e) {}
  }
}
