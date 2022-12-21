import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/common/scrol_behaviour/scroll_behaviour.dart';

import 'package:ielts/view/dashboard_screen/bg_cirle_clipper.dart/bg_circle_clipper.dart';
import 'package:ielts/view/listening_screen/widgets/app_bar.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ScrollConfiguration(
        behavior: NoShadoBehavior(),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              BgCircleFirstClipper(width: screenWidth),
              BGCircleSecondClipper(width: screenWidth),
              Center(
                child: SafeArea(
                  child: ListView(
                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appBar(),
                      kHeight40,
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "Listening",
                          style: centerTextSubjectScreen,
                        ),
                      ),
                      kHeight20,
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 25.w, right: 25, bottom: 20),
                            decoration: kSubjectTesttile,
                            height: 78.h,
                            width: 333.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 9.0, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [Text("Test 1"), Icon(Icons.abc)],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 9, right: 14),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.abc),
                                          Text("Test 1"),
                                        ],
                                      ),
                                      Text("Test 1"),
                                      Text("Test 1"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
