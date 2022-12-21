// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/subject_tests_model/test_model/test_model.dart';
import 'package:ielts/view/common/constants.dart';

import '../../../common/common.dart';

class TestsListViewTilesWidget extends StatelessWidget {
  AsyncSnapshot<TestsModel?> snapshot;
  TestsListViewTilesWidget({
    Key? key,
    required this.snapshot,
    required this.subjectId,
  }) : super(key: key);

  final String subjectId;

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasError) {
      return const Center(
        child: Text("Error Occured"),
      );
    } else if (snapshot.connectionState == ConnectionState.waiting) {
      return Container(
          width: screenWidth,
          height: screenHeight,
          alignment: Alignment.topCenter,
          child: CupertinoActivityIndicator(
            radius: 20.r,
            color: kBlack,
          ));
    } else if (snapshot.data == null) {
      return const Center(
        child: Text("CHECK YOUR CONNECTION"),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: snapshot.data?.data.tests.length ?? 0,
      itemBuilder: (context, index) {
        String? exerciseCount = testCtrl.testTiles[index]?.data.exercisesCount;
        var counter = testCtrl.testTiles[index]?.locked ?? true
            ? testCtrl.testTiles[index]?.data.duration
            : timerCtrl.time.value;
        return Container(
          margin: EdgeInsets.only(left: 25.w, right: 25, bottom: 20),
          decoration: kSubjectTesttile,
          height: 88.h,
          width: 333.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              kHeight10,
              Padding(
                padding: const EdgeInsets.only(left: 9.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(testCtrl.testTiles[index]?.data.name ?? "Test"),
                    Icon(testCtrl.testTiles[index]?.locked ?? true
                        ? Icons.lock
                        : Icons.lock_open)
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 9, right: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.timer_outlined),
                        Text("$counter:00")
                      ],
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Text("${exerciseCount ?? 0} Questions"),
                    const Spacer(
                      flex: 3,
                    ),
                    Text(
                        "${testCtrl.testTiles[index]?.data.userTest} Try left"),
                  ],
                ),
              ),
              kHeight10,
            ],
          ),
        );
      },
    );
  }
}
