// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ielts/dependency/dependency.dart';

import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/subject_tests_screen/subject_test_screen.dart';

import 'widgets/subject_list_tile_widget.dart';

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
              dashCtrl.dashboardData.value?.data.subjects[index].testsCount;
          num percentage = dashCtrl
                  .dashboardData.value?.data.subjects[index].userTestsCount ??
              0.0 / testCount!;

          if (percentage.isNaN || percentage.isInfinite) {
            percentage = 0.0;
          }

          return GestureDetector(
            onTap: () {
              dashCtrl.isLoading.value = true;
              dashCtrl.fetchTests(
                  subjectId: dashCtrl.dashboardData.value?.data.subjects[index]
                          .subjectId ??
                      "1");
              Get.to(
                () => SubjectScreen(
                  color: subjectsTileColor[index],
                  name: dashCtrl.dashboardData.value?.data.subjects[index]
                          .subject.name ??
                      "",
                  subjectId: dashCtrl.dashboardData.value?.data.subjects[index]
                          .subjectId ??
                      "",
                ),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 400),
              );
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
                child: SubjectsListViewTileDashboardWidget(
                    percentage: percentage, index: index),
              ),
            ),
          );
        },
        itemCount: dashCtrl.dashboardData.value?.data.subjects.length ?? 0);
  }
}
