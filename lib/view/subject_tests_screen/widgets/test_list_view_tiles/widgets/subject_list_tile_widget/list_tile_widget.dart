import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/subject_tests_screen/widgets/test_list_view_tiles/widgets/timer_count_and_try_left.dart';

class SubjectTestListTileWidget extends StatelessWidget {
  const SubjectTestListTileWidget({
    Key? key,
    required this.testName,
    required this.color,
    required this.locked,
    required this.subjectId,
    required this.counter,
    required this.exerciseCount,
    required this.tryLeftCount,
    required this.index,
  }) : super(key: key);

  final String testName;
  final Color color;
  final bool locked;
  final String subjectId;
  final String counter;
  final String? exerciseCount;
  final String? tryLeftCount;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20).r,
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
                Text(
                  testName,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: color,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  locked ? Icons.lock : Icons.lock_open,
                  size: 20.sp,
                )
              ],
            ),
          ),
          const Divider(),
          TimerAndTryLeftWidget(
              index: index,
              subjectId: subjectId,
              counter: counter,
              exerciseCount: exerciseCount,
              tryLeftCount: tryLeftCount),
          kHeight10,
        ],
      ),
    );
  }
}
