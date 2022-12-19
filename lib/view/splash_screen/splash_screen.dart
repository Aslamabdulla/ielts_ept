import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ielts/view/common/background_clipper.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/course_selection_screen/course_selection_screen.dart';

import '../common/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      splashTimer();
    });
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // height: screenHeight,
            // width: screenWidth,
            decoration: boxDecorSplash("assets/images/splash_bg_2.png"),
            child: ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                decoration: boxDecorSplash("assets/images/spash_bg.png"),
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/logo.png",
              ))
        ],
      ),
    );
  }

  splashTimer() {
    Future.delayed(Duration(seconds: 4))
        .then((value) => Get.offAll(() => CouseSelectionScreen()));
  }
}
