// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ielts/controller/dashboard_controller/dashboard_controller.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/dashboard_model/dash_board_model.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/subject_tests_screen/tests_screen_root.dart';

import 'widgets/subject_list_tile_widget.dart';

class ListViewSubjectsWidgetBuilder extends StatelessWidget {
  AsyncSnapshot<DashBoardModel?> snapshot;
  ListViewSubjectsWidgetBuilder({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
        id: "dashCtrlr",
        init: DashBoardController(),
        builder: (dashCtrol) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0 || index == 3) {
                      snapshot.data?.data.subjects[index].subjectId;
                      dashCtrol.isLoading.value = true;
                      dashCtrol.fetchTests(
                          subjectId:
                              snapshot.data?.data.subjects[index].subjectId ??
                                  "1");
                      Get.to(
                        () => SubjectScreen(
                          index: index,
                          color: subjectsTileColor[index],
                          name: snapshot
                                  .data?.data.subjects[index].subject.name ??
                              "",
                          subjectId:
                              snapshot.data?.data.subjects[index].subjectId ??
                                  "",
                        ),
                        transition: Transition.fadeIn,
                        duration: const Duration(milliseconds: 400),
                      );
                    } else {}
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
                          snapshot: snapshot,
                          dashCtrol: dashCtrol,
                          index: index),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data?.data.subjects.length ?? 0);
        });
  }
}
