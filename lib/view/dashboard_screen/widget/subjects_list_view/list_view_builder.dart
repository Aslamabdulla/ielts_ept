import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/subject_tests_screen/subject_test_screen.dart';
import 'package:progress_indicator/progress_indicator.dart';

class ListViewSubjectsWidgetBuilder extends StatelessWidget {
  const ListViewSubjectsWidgetBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          int? testCount =
              dashCtrl.dashboardData?.data.subjects[index].testsCount;
          num percentage =
              dashCtrl.dashboardData?.data.subjects[index].userTestsCount ??
                  0.0 / testCount!;
          if (percentage.isNaN || percentage.isInfinite) {
            percentage = 0.0;
          }

          return GestureDetector(
            onTap: () {
              Get.to(
                  () => SubjectScreen(
                        name: dashCtrl.dashboardData?.data.subjects[index]
                                .subject.name ??
                            "",
                        subjectId: dashCtrl.dashboardData?.data.subjects[index]
                                .subjectId ??
                            "",
                      ),
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 400));
            },
            child: SlideInRight(
              duration: const Duration(milliseconds: 400),
              child: Container(
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
                            "${dashCtrl.dashboardData?.data.subjects[index].userTestsCount ?? 0}/${dashCtrl.dashboardData?.data.subjects[index].testsCount ?? 0}",
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
                            "${percentage.toInt().toString()}%",
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
                ),
              ),
            ),
          );
        },
        itemCount: dashCtrl.dashboardData?.data.subjects.length ?? 0);
  }
}
