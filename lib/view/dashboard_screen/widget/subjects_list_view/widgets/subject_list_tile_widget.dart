import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:progress_indicator/progress_indicator.dart';

class SubjectsListViewTileDashboardWidget extends StatelessWidget {
  const SubjectsListViewTileDashboardWidget({
    Key? key,
    required this.percentage,
    required this.index,
  }) : super(key: key);

  final num percentage;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight10,
        Row(
          children: [
            kWidth10,
            FittedBox(
              child: Text(
                dashCtrl.dashboardData.value?.data.subjects[index].subject
                        .name ??
                    "",
                maxLines: 1,
                style: textStyleSubjectsTile,
              ),
            ),
            const Spacer(),
            FittedBox(
              child: Text(
                "${dashCtrl.dashboardData.value?.data.subjects[index].userTestsCount ?? 0}/${dashCtrl.dashboardData.value?.data.subjects[index].testsCount ?? 0}",
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
