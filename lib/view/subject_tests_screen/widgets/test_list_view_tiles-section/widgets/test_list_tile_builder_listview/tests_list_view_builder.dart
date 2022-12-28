// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/subject_test_model/test_model/test_model.dart';
import 'package:ielts/view/common/common_widgets/notification_widget/notification.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/exercise_screen_listening/exercise_screen_listening.dart';
import 'package:ielts/view/exercise_screen_listening/widgets/error_widget/error_widget.dart';
import 'package:ielts/view/exercise_screen_writing/exercise_screen_writing.dart';
import 'package:ielts/view/subject_tests_screen/widgets/premium_dialogue_box/dialogue_premium_widget.dart';
import 'package:ielts/view/subject_tests_screen/widgets/test_list_view_tiles-section/widgets/timer_questions_try_left_section/timer_count_and_try_left.dart';

import '../../../../../common/common.dart';
import '../subject_list_tile_widget/list_tile_widget.dart';

class TestsListViewTilesWidgetBuilder extends StatelessWidget {
  const TestsListViewTilesWidgetBuilder({
    Key? key,
    required this.subjectId,
    required this.color,
  }) : super(key: key);

  final String subjectId;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TestsModel?>(
        future: dashCtrl.fetchTests(subjectId: subjectId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const ErrorWidgetNetwork(image: "assets/images/404.gif");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                width: screenWidth,
                height: screenHeight,
                alignment: Alignment.topCenter,
                child: CupertinoActivityIndicator(
                  radius: 20.r,
                  color: kBlack,
                ));
          } else if (snapshot.data?.data == null) {
            return const ErrorWidgetNetwork(image: "assets/images/404.gif");
          } else {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: dashCtrl.testTiles.length,
                  itemBuilder: (context, index) {
                    String? exerciseCount =
                        dashCtrl.testTiles[index]?.data.exercisesCount ?? "0";
                    if (index == 0) {
                      dashCtrl.testTiles[index]?.locked = false;
                    }
                    var counter =
                        dashCtrl.testTiles[index]?.data.duration ?? "";

                    if (index == 0) {
                      dashCtrl.testTiles[index]?.locked = false;
                    }
                    bool? locked = dashCtrl.testTiles[index]?.locked ?? true;
                    String? testName =
                        dashCtrl.testTiles[index]?.data.name ?? "Test";
                    int tryLeftCount = int.parse(dashCtrl.testTiles[index]?.data
                                .userTest?.exercisesCount ??
                            "4") -
                        4;

                    // ValueNotifier tries = ValueNotifier<String>();
                    return Opacity(
                        opacity: locked ? .55 : 1,
                        child: GestureDetector(
                          onTap: () {
                            if (locked) {
                              dashCtrl.showpPremiumDialogue();
                            } else if (timerCtrl.timerOnNow.value == false) {
                              timerCtrl.currentindex.value = index;
                              timerCtrl.currentSubject.value = subjectId;
                              exerciseCtrl.initExerserciseScreen();
                              if (timerCtrl.currentSubject.value == "1") {
                                exerciseCtrl.currentExerciseIndex.value = 0;
                                Get.to(() => ExerciseListeningScreen(
                                      testId: dashCtrl.testTiles[index]?.data.id
                                              .toString() ??
                                          "",
                                    ));
                              } else if (timerCtrl.currentSubject.value ==
                                  "4") {
                                exerciseCtrl.currentExerciseIndex.value = 0;
                                Get.to(() => ExerciseWritingScreen(
                                      index: index,
                                      testId: dashCtrl.testTiles[index]?.data.id
                                              .toString() ??
                                          "",
                                    ));
                              }

                              int tries = int.parse(
                                  dashCtrl.testTiles[index]?.tries ?? "");
                              tries--;
                              dashCtrl.testTiles[index]?.tries =
                                  tries.toString();
                            } else if (timerCtrl.currentindex.value == index &&
                                timerCtrl.currentSubject.value == subjectId) {
                              Get.to(() => ExerciseListeningScreen(
                                  testId: dashCtrl.testTiles[index]?.data.id
                                          .toString() ??
                                      ""));
                            } else {
                              notificationError(
                                      "Error", "Please complete pending test")
                                  .show(context);
                            }
                          },
                          child: AnimationConfiguration.staggeredList(
                              position: index,
                              delay: const Duration(milliseconds: 100),
                              child: SlideAnimation(
                                duration: const Duration(milliseconds: 2500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                horizontalOffset: 30,
                                verticalOffset: 300.0,
                                child: FlipAnimation(
                                  duration: const Duration(milliseconds: 3000),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  flipAxis: FlipAxis.y,
                                  child: SubjectTestListTileWidget(
                                      index: index,
                                      testName: testName,
                                      color: color,
                                      locked: locked,
                                      subjectId: subjectId,
                                      counter: counter,
                                      exerciseCount: exerciseCount,
                                      tryLeftCount: tryLeftCount.toString()),
                                ),
                              )),
                        ));
                  },
                ),
                if (dashCtrl.testTiles.length == 1 ||
                    dashCtrl.testTiles.isEmpty ||
                    dashCtrl.testTiles.length == 2)
                  Container(
                    height: 300.w,
                    width: 150.w,
                    color: Colors.transparent,
                  )
              ],
            );
          }
        });
  }
}

// class ErrorWidget extends StatelessWidget {
//   const ErrorWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//           width: screenWidth,
//           height: screenHeight,
//           alignment: Alignment.topCenter,
//           child: const Text("Error Occured")),
//     );
//   }
// }
