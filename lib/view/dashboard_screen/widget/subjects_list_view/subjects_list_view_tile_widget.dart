import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/dashboard_model/dash_board_model.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/subject_tests_screen/subject_test_screen.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:shimmer/shimmer.dart';

import 'list_view_builder.dart';

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
      child: Obx(
        () => FutureBuilder<DashBoardModel?>(
            future: dashCtrl.dashBoardFetch(
                data: dashCtrl.switcherIndex4.value == 1
                    ? dashCtrl.academicData
                    : dashCtrl.generalData),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Error Occured");
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return CupertinoActivityIndicator(
                  radius: 20.r,
                  color: kBlack,
                );
              } else if (snapshot.data == null) {
                return const Center(
                    child: Text("Please check your connection"));
              }
              return const ListViewSubjectsWidgetBuilder();
            }),
      ),
    );
  }
}
