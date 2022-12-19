import 'package:flutter/material.dart';
import 'package:ielts/view/common/background_clipper.dart';
import 'package:ielts/view/common/common.dart';

class BackgroundClipperWidget extends StatelessWidget {
  const BackgroundClipperWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: screenHeight,
      // width: screenWidth,
      decoration: boxDecorSplash("assets/images/splash_bg_2.png"),
      child: ClipPath(
        clipper: BackgroundClipper(),
        child: Container(
          decoration: boxDecorSplash("assets/images/spash_bg.png"),
        ),
      ),
    );
  }
}
