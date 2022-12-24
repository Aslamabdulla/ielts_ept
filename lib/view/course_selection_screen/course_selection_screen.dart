import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common_widgets/background_onboarding/background_onboarding.dart';
import 'package:ielts/view/common/common_widgets/button_widget/button_widget.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/course_selection_screen/widgets/choice.dart';
import 'package:ielts/view/registration_screen/registration_screen.dart';

import '../common/common_widgets/background_clipper/background_clipper.dart';
import '../common/common.dart';

class CourseSelectionScreen extends StatelessWidget {
  const CourseSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundClipperWidget(),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Spacer(),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 100.h,
                    width: 100.w,
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      FittedBox(
                        child: Text(
                          "Are you looking for ?",
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                              color: kBlack),
                        ),
                      ),
                      kHeight15,
                      choiceWidget(),
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  buttonWidget(
                    "Continue",
                    216,
                    () {
                      if (choiceCtrl.isCoiceSelected.value) {
                        Get.offAll(() => const RegistrationScreen(),
                            transition: Transition.fadeIn,
                            duration: const Duration(milliseconds: 400));
                      } else {
                        Get.snackbar("Error", "Please select a category",
                            colorText: kRed);
                      }
                    },
                  ),
                  const Spacer(
                    flex: 3,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
