// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_indicator/progress_indicator.dart';

import 'package:ielts/controller/dashboard_controller/dashboard_controller.dart';

import 'package:ielts/model/dashboard_model/dash_board_model.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';

class SubjectsListViewTileDashboardWidget extends StatelessWidget {
  final DashBoardController dashCtrol;
  AsyncSnapshot<DashBoardModel?> snapshot;
  SubjectsListViewTileDashboardWidget({
    Key? key,
    required this.dashCtrol,
    required this.snapshot,
    required this.index,
  }) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    int? testCount =
        dashCtrol.dashboardData.value?.data.subjects[index].testsCount;
    num percentage = num.parse(dashCtrol
                .dashboardData.value?.data.subjects[index].userTestsCount ??
            "0") /
        testCount! *
        100;

    if (percentage.isNaN || percentage.isInfinite) {
      percentage = 0.0;
    }
    return Column(
      children: [
        kHeight10,
        Row(
          children: [
            kWidth10,
            FittedBox(
              child: Text(
                dashCtrol.dashboardData.value?.data.subjects[index].subject
                        .name ??
                    "",
                maxLines: 1,
                style: textStyleSubjectsTile,
              ),
            ),
            const Spacer(),
            FittedBox(
              child: Text(
                "${dashCtrol.dashboardData.value?.data.subjects[index].userTestsCount ?? 0}/${dashCtrol.dashboardData.value?.data.subjects[index].testsCount ?? 0}",
                maxLines: 1,
                style: textStyleSubjectsTile,
              ),
            ),
            kWidth10,
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                "${percentage.toStringAsFixed(1)}%",
                maxLines: 1,
                style: textStyleSubjectsTile,
              ),
            ),
            kHeight5,
            SizedBox(
              height: 10.h,
              width: 140.w,
              child: BarProgress(
                percentage: percentage.toDouble(),
                backColor: kWhite,
                color: subjectsTileProgressColor[index],
                showPercentage: true,
                textStyle: const TextStyle(fontSize: 0),
                stroke: 8,
                round: true,
              ),
            ),
          ],
        ),
        kHeight10
      ],
    );
  }
}
