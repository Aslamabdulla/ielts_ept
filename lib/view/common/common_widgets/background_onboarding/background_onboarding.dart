import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielts/view/common/common_widgets/background_clipper/background_clipper.dart';
import 'package:ielts/view/common/common.dart';

class BackgroundClipperWidget extends StatelessWidget {
  const BackgroundClipperWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorSplash("assets/images/splash_bg_2.png"),
      child: ClipPath(
        clipper: BackgroundClipper(),
        child: Container(
          decoration: boxDecorSplash("assets/images/spash_bg.png"),
          child: Center(
            child: Container(
              height: screenHeight,
              width: screenWidth,
            ),
          ),
        ),
      ),
    );
  }
}
