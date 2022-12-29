// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:ielts/view/exercise_screen_listening/widgets/build_exercise_screen/exercise_screen_list_build.dart';

import 'package:ielts/view/exercise_screen_listening/widgets/error_widget/error_widget.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/dashboard_screen/bg_cirle_clipper.dart/bg_circle_clipper.dart';

import 'widgets/activity_indicator/activity_indicator.dart';
import 'widgets/app_bar_exercise/app_bar_exercise.dart';
import 'widgets/audio_player_widget/audio_player.dart';
import 'widgets/submit_button_listening/submit_button.dart';

class ExerciseListeningScreen extends StatefulWidget {
  final String testId;
  const ExerciseListeningScreen({
    Key? key,
    required this.testId,
  }) : super(key: key);

  @override
  State<ExerciseListeningScreen> createState() =>
      _ExerciseListeningScreenState();
}

final formKey = GlobalKey<FormState>();

class _ExerciseListeningScreenState extends State<ExerciseListeningScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: kWhite,
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Stack(
              children: [
                BgCircleFirstClipper(width: screenWidth),
                BGCircleSecondClipper(width: screenWidth),
                SafeArea(
                    child: FutureBuilder(
                        future: exerciseCtrl.fetchExercise(widget.testId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const ActivityIndicatorWidget();
                          } else if (snapshot.hasError) {
                            exerciseCtrl.resultPageShow.value = false;
                            return const ErrorWidgetNetwork(
                              image: "assets/images/404.gif",
                            );
                          } else if (snapshot.data == null) {
                            exerciseCtrl.resultPageShow.value = false;
                            return const ErrorWidgetNetwork(
                              image: "assets/images/404.gif",
                            );
                          } else if (exerciseCtrl.exerciseData.isEmpty) {
                            exerciseCtrl.resultPageShow.value = false;
                            return const ErrorWidgetNetwork(
                              image: "assets/images/completed_task.gif",
                            );
                          } else {
                            exerciseCtrl.resultPageShow.value = true;

                            return Obx(
                              () => Column(
                                children: [
                                  widgetAppBarExercise(),
                                  timerCtrl.currentSubject.value == "1"
                                      ? AudioPlayer(
                                          id: exerciseCtrl
                                                  .exerciseData[exerciseCtrl
                                                      .currentExerciseIndex
                                                      .value]
                                                  ?.id ??
                                              0)
                                      : const SizedBox(),
                                  kHeight20,
                                  buidExerciseScreen(snapshot, formKey),
                                  kHeight200
                                ],
                              ),
                            );
                          }
                        }))
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: floatingActionSubmit(context, formKey)),
    );
  }
}
