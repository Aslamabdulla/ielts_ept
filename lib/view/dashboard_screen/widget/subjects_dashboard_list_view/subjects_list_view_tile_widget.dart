import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/dashboard_model/dash_board_model.dart';

import 'package:ielts/view/common/constants.dart';

import 'list_view_builder_home_screen.dart';

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
                  radius: 20.sp,
                  color: kBlack,
                );
              } else if (snapshot.data == null) {
                return const Center(
                    child: Text("Please check your connection"));
              } else {
                return ListViewSubjectsWidgetBuilder(
                  snapshot: snapshot,
                );
              }
            }),
      ),
    );
  }
}
