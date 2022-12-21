import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/main.dart';
import 'package:ielts/view/common/background_clipper/background_clipper.dart';
import 'package:ielts/view/common/background_onboarding/background_onboarding.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/course_selection_screen/course_selection_screen.dart';
import 'package:ielts/view/dashboard_screen/dashboard_screen.dart';
import 'package:ielts/view/navigation_router/navigation_route.dart';

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
          const BackgroundClipperWidget(),
          SafeArea(
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo.png",
                  )))
        ],
      ),
    );
  }

  splashTimer() {
    // d token = prefs.getString("token");

    Future.delayed(const Duration(seconds: 4))
        // ignore: prefer_const_constructors
        .then((value) => Get.offAll(() {
              return dashCtrl.token.value == null
                  ? const CourseSelectionScreen()
                  : NavigationBottomBarScreen();
            },
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 400)));
  }
}
