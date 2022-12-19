import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/view/common/button_widget.dart';

import '../common/background_clipper.dart';
import '../common/common.dart';

class CouseSelectionScreen extends StatelessWidget {
  const CouseSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 100.h,
                    width: 100.w,
                  ),
                  Text("Are you looking for ?"),

                  buttonWidget(
                    "Continue",
                    1,
                    () {},
                  ),
                  // Container(
                  //   width: ,
                  // ),
                  SizedBox()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
