// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ielts/dependency/dependency.dart';

import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/subject_tests_screen/widgets/premium_dialogue_box/dialogue_premium_widget.dart';
import 'package:ielts/view/subject_tests_screen/widgets/test_list_view_tiles/widgets/timer_count_and_try_left.dart';

import '../../../common/common.dart';
import 'widgets/subject_list_tile_widget/list_tile_widget.dart';

class TestsListViewTilesWidgetBuilder extends StatelessWidget {
  // AsyncSnapshot<TestsModel?> snapshot;

  TestsListViewTilesWidgetBuilder({
    Key? key,
    required this.subjectId,
    required this.color,
  }) : super(key: key);

  final String subjectId;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Obx(() => !dashCtrl.isLoading.value
        ? ListView.builder(
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dashCtrl.testTiles.length,
            itemBuilder: (context, index) {
              String? exerciseCount =
                  dashCtrl.testTiles[index]?.data.exercisesCount ?? "0";

              var counter = dashCtrl.testTiles[index]?.data.duration ?? "";

              if (index == 0) {
                dashCtrl.testTiles[index]?.locked = false;
              }
              bool? locked = dashCtrl.testTiles[index]?.locked ?? true;
              String? testName = dashCtrl.testTiles[index]?.data.name ?? "Test";
              String? tryLeftCount =
                  dashCtrl.testTiles[index]?.data.userTest ?? 4;
              if (tryLeftCount == "0") dashCtrl.testTiles[index]?.locked = true;

              return Opacity(
                opacity: locked ? .55 : 1,
                child: GestureDetector(
                  onTap: () {
                    if (locked) {
                      Get.defaultDialog(
                          backgroundColor: Colors.transparent,
                          content: Column(
                            children: [
                              const DialogueBoxPremiumWidget(
                                  color: KDialogueboxColor1,
                                  package: "Full Package"),
                              kHeight15,
                              const DialogueBoxPremiumWidget(
                                  color: KDialogueboxColor2, package: "Custom"),
                            ],
                          ));
                    } else {
                      if (timerCtrl.timerOnNow.value == false) {
                        timerCtrl.currentindex.value = index;
                        timerCtrl.currentSubject.value = subjectId;
                        timerCtrl.timerOnNow.value = true;

                        timerCtrl.startTimer(
                            int.parse(counter) * 60, dashCtrl.testTiles[index]);
                      } else {
                        Get.snackbar(
                            "Message", "Please Complete Pending Exersice",
                            colorText: kBlack, backgroundColor: kWhite);
                      }
                    }
                  },
                  child: SubjectTestListTileWidget(
                      index: index,
                      testName: testName,
                      color: color,
                      locked: locked,
                      subjectId: subjectId,
                      counter: counter,
                      exerciseCount: exerciseCount,
                      tryLeftCount: tryLeftCount),
                ),
              );
            },
          )
        : Container(
            width: screenWidth,
            height: screenHeight,
            alignment: Alignment.topCenter,
            child: CupertinoActivityIndicator(
              radius: 20.r,
              color: kBlack,
            )));
  }
}
