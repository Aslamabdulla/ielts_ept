// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/subject_tests_model/test_model/test_model.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/common/scrol_behaviour/scroll_behaviour.dart';
import 'package:ielts/view/dashboard_screen/bg_cirle_clipper.dart/bg_circle_clipper.dart';
import 'package:ielts/view/subject_tests_screen/widgets/app_bar.dart';

import 'widgets/test_list_view_tiles/test_list_view.dart';

class SubjectScreen extends StatelessWidget {
  final String subjectId;
  final String name;
  const SubjectScreen({
    Key? key,
    required this.subjectId,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BgCircleFirstClipper(width: screenWidth),
            BGCircleSecondClipper(width: screenWidth),
            SafeArea(
              child: FutureBuilder<TestsModel?>(
                  future: testCtrl.fetchTests(subjectId: subjectId),
                  builder: (context, snapshot) {
                    return Column(
                      // shrinkWrap: true,

                      // physics: const NeverScrollableScrollPhysics(),
                      // primary: false,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appBar(),
                        kHeight40,
                        Container(
                          color: Colors.transparent,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            name,
                            style: centerTextSubjectScreen,
                          ),
                        ),
                        kHeight20,
                        TestsListViewTilesWidget(
                          subjectId: subjectId,
                          snapshot: snapshot,
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
