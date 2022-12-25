import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/controller/dashboard_controller/dashboard_controller.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';

class TimerAndTryLeftWidget extends StatelessWidget {
  const TimerAndTryLeftWidget({
    Key? key,
    required this.subjectId,
    required this.counter,
    required this.exerciseCount,
    required this.tryLeftCount,
    required this.index,
  }) : super(key: key);

  final String subjectId;
  final String counter;
  final String? exerciseCount;
  final String? tryLeftCount;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 14).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Row(
              children: [
                const Icon(Icons.timer_outlined),
                kWidth3,
                timerCtrl.currentindex.value == index &&
                        timerCtrl.currentSubject.value == subjectId
                    ? SizedBox(
                        width: 60.w,
                        child: Text(
                          timerCtrl.time.value == '00.00'
                              ? "-$counter:00"
                              : timerCtrl.time.value,
                          style: kTextStyleTest,
                        ),
                      )
                    : SizedBox(
                        width: 60.w,
                        child: Text(
                          "-$counter:00",
                          style: kTextStyleTest,
                        ),
                      ),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Text(
              exerciseCount == "1"
                  ? "$exerciseCount Question"
                  : "$exerciseCount Questions",
              style: kTextStyleTest),
          const Spacer(
            flex: 3,
          ),
          GetBuilder<DashBoardController>(
              init: DashBoardController(),
              id: "trycount",
              builder: (dashCtrol) {
                int tries = int.parse(dashCtrol.testTiles[index]?.tries ?? "4");
                if (tries <= 0) {
                  tries = 0;
                }
                return Text("${dashCtrol.testTiles[index]?.tries} Try left",
                    style: kTextStyleTest);
              }),
        ],
      ),
    );
  }
}
