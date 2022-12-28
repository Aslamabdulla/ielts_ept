import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ielts/view/common/common.dart';

import 'package:ielts/view/common/common_widgets/scrol_behaviour/scroll_behaviour.dart';

import 'package:ielts/view/dashboard_screen/bg_cirle_clipper.dart/bg_circle_clipper.dart';

class HomeScreenSample extends StatelessWidget {
  const HomeScreenSample({super.key});

  @override
  Widget build(BuildContext context) {
    var width = Get.width;
    return Scaffold(
      // bottomNavigationBar: BottomNavBar(),
      extendBodyBehindAppBar: true,

      body: ScrollConfiguration(
        behavior: NoShadoBehavior(),
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              BgCircleFirstClipper(width: width),
              BGCircleSecondClipper(width: width),
              SafeArea(
                child: ListView(
                  shrinkWrap: true,

                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenHeight,
                      width: screenWidth,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
