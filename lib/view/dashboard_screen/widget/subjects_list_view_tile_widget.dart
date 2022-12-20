import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:progress_indicator/progress_indicator.dart';

class SubjectListViewTileWidget extends StatelessWidget {
  const SubjectListViewTileWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.h,
      width: width,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: subjectsTileColor[index],
              ),
              margin: index == 0
                  ? const EdgeInsets.only(left: 20, right: 5).r
                  : const EdgeInsets.only(left: 5, right: 5).r,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: 50.h,
              width: 170.w,
              child: Column(
                // mainAxisAlignment:
                // MainAxisAlignment.spaceBetween,
                children: [
                  kHeight10,
                  Row(
                    children: [
                      kWidth10,
                      FittedBox(
                        child: Text(
                          dashCtrl.dashboardData?.data.subjects[index].subject
                                  .name ??
                              "",
                          maxLines: 1,
                          style: textStyleSubjectsTile,
                        ),
                      ),
                      const Spacer(),
                      FittedBox(
                        child: Text(
                          "${dashCtrl.dashboardData?.data.subjects[index].userTestsCount ?? 0}/${dashCtrl.dashboardData?.data.subjects[index].testsCount}",
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
                          "60%",
                          maxLines: 1,
                          style: textStyleSubjectsTile,
                        ),
                      ),
                      kHeight5,
                      SizedBox(
                        height: 10.h,
                        width: 140.w,
                        child: BarProgress(
                          percentage: 50,
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
              ),
            );
          },
          itemCount: dashCtrl.dashboardData?.data.subjects.length ?? 0),
    );
  }
}
