import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/exercise_model/exerscise_model.dart';
import 'package:ielts/model/get_result_model/get_result_model.dart';
import 'package:ielts/model/save_data_model/result_model.dart';
import 'package:ielts/view/result_screen/result_screen.dart';
import 'package:string_similarity/string_similarity.dart';

import 'package:ielts/services/api.dart';

class ExerciseController extends GetxController {
  RxString currenttestId = "".obs;
  final String kBaseUrl = "https://qicksale.com/ept_backend/storage/";
  ExerciseModel? exerciseModel;
  RxInt currentTestIndex = 0.obs;
  RxBool textControllerChange = true.obs;
  RxList<Exercises?> exerciseData = <Exercises>[].obs;
  RxInt currentExerciseIndex = 0.obs;
  Rx<bool> isLoading = false.obs;
  RxInt totalExercise = 0.obs;
  RxInt totalScore = 0.obs;
  RxList<Questions?> questionData = <Questions>[].obs;
  List<Questions?> answersData = [];
  GetResultModel? resultModel;
  RxBool resultPageShow = true.obs;
  RxBool isQuitted = false.obs;
  String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body?.text).documentElement?.text ?? "";

    return parsedString;
  }

  Future<List<Exercises?>> fetchExercise(String testId) async {
    isLoading.value = true;
    try {
      final response = await ApiCalls().postTestExercise(testId: testId);
      if (response.statusCode == 200 || response.statusCode == 201) {
        exerciseModel = ExerciseModel.fromJson(jsonDecode(response.body));

        exerciseData.value = exerciseModel?.data?.exercises.map((e) {
          print(e.audio);
          e.question = parseHtmlString(e.question ?? "");

          return e;
        }).toList() as List<Exercises?>;
        await audioContrl.setAudio();

        isLoading.value = false;
        return exerciseData.value;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  calculeteTotalExercise(int index) {
    totalExercise.value =
        int.parse(dashCtrl.testTiles[index]?.data.exercisesCount ?? "0");
    exerciseData[timerCtrl.currentindex.value]?.subQuestions?.length ?? 0;
  }

  Future saveResult() async {
    totalScore.value = 0;
    try {
      int score = 0;

      var resultData = answersData.map((element) {
        element?.points = 5;
        if (element?.answer == null || element?.answer == "") {
          element?.status = "NOT ATTENDED";
          element?.scoredPoints = 0;
        } else if (element?.answer != null &&
            element?.answer?.toString().trim().toLowerCase() ==
                element?.rightAnswer.toString().trim().toLowerCase()) {
          element?.scoredPoints = 5;
          element?.status = "Right";
          totalScore.value = totalScore.value + 5;
        } else {
          score = 0;
          String correctAnswer =
              element?.rightAnswer?.toLowerCase().trim() ?? "null";
          String userAnswer = element?.answer?.toLowerCase().trim() ?? "empty";

          double scoredpoint =
              StringSimilarity.compareTwoStrings(correctAnswer, correctAnswer);
          double percentage =
              1 - (scoredpoint / max(correctAnswer.length, userAnswer.length));

          if (percentage >= 0.9) {
            score = 4;
          } else if (percentage >= 0.8) {
            score = 4;
          } else if (percentage >= 0.7) {
            score = 3;
          } else if (percentage >= 0.6) {
            score = 3;
          } else if (percentage >= 0.5) {
            score = 2;
          } else if (percentage >= 0.4) {
            score = 2;
          } else if (percentage >= 0.3) {
            score = 1;
          } else if (percentage >= 0.2) {
            score = 1;
          } else if (percentage >= 0.1) {
            score = 0;
          } else {
            score = 0;
          }
          if (score >= 4) {
            element?.status = "Right";
          } else {
            element?.status = "Wrong";
          }

          element?.scoredPoints = score;
          totalScore.value = totalScore.value +
              int.parse(element?.scoredPoints.toString() ?? "0");
        }

        return element;
      }).toList();

      var result = ResultModel(
          subjectId: timerCtrl.currentSubject.value,
          questions: resultData,
          category: "IELTS",
          exerciseId: exerciseData[currentExerciseIndex.value]?.id.toString(),
          testId: exerciseData[currentExerciseIndex.value]?.testId.toString());
      exerciseData[currentExerciseIndex.value];
      var response = await ApiCalls().saveResult(data: result.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        await dashCtrl.dashBoardFetch(
            data: dashCtrl.switcherIndex4.value == 1
                ? dashCtrl.academicData
                : dashCtrl.generalData);

        answersData.clear();

        dashCtrl.update(["dashCtrlr"]);
        dashCtrl.refreshGroup("trycount");
        textControllerChange.value = true;
      }
    } catch (e) {
      return null;
    }
  }

  nextExercise() {
    currentExerciseIndex.value++;

    audioContrl.openAudio(exerciseCtrl
            .exerciseData[exerciseCtrl.currentExerciseIndex.value]?.id ??
        0);
    audioContrl.isPlaying.value = false;
    textControllerChange.value = true;
  }

  mapQuestions() {
    try {
      questionData.value =
          exerciseData[currentExerciseIndex.value]?.subQuestions?.map((e) {
                return Questions(
                    answer: "",
                    audioAnswerFile: "null",
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

  addPrevAnswerdQuestion() {
    for (var element in questionData) {
      answersData.add(element);
    }
    saveResult();
  }

  initExerserciseScreen() {
    var counter =
        dashCtrl.testTiles[timerCtrl.currentindex.value]?.data.duration ?? "";
    isLoading.value = true;

    timerCtrl.startTimer(
        int.parse(counter) * 60,
        dashCtrl.testTiles[timerCtrl.currentindex.value],
        timerCtrl.currentindex.value);
    timerCtrl.timerOnNow.value = true;
  }

  quitTest() {
    if (resultPageShow.value) {
      addPrevAnswerdQuestion();

      timerCtrl.timerCancel();

      dashCtrl.fetchTests(subjectId: timerCtrl.currentSubject.value);
      timerCtrl.timerOnNow.value = false;
      if (audioContrl.audioPlayer.isPlaying.value) {
        audioContrl.audioPlayer.pause();
      }

      int tries = int.parse(
          dashCtrl.testTiles[timerCtrl.currentindex.value]?.tries ?? "4");
      tries--;

      dashCtrl.testTiles[timerCtrl.currentindex.value]?.tries =
          tries.toString();
      dashCtrl.refreshGroup("trycount");

      Get.to(
          () => ResultPageScreen(
              testId:
                  exerciseData[currentExerciseIndex.value]?.testId.toString() ??
                      "1"),
          duration: const Duration(milliseconds: 400),
          transition: Transition.rightToLeftWithFade);
    }
  }

  Future<GetResultModel?> getResults(String testId) async {
    isLoading.value = true;
    try {
      Map<String, dynamic> result = {"category": "IELTS", "test_id": testId};
      final response = await ApiCalls().getResult(data: result);
      if (response.statusCode == 200 || response.statusCode == 201) {
        resultModel = getResultModelFromJson(response.body);

        isLoading.value = false;
        return resultModel;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
