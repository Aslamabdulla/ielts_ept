import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/exercise_screen_listening/widgets/app_bar_exercise/app_bar_exercise.dart';

class ActivityIndicatorWidget extends StatelessWidget {
  const ActivityIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widgetAppBarExercise(),
        Container(
            width: screenWidth,
            height: screenHeight,
            alignment: Alignment.center,
            child: CupertinoActivityIndicator(
              radius: 20.r,
              color: kBlack,
            )),
      ],
    );
  }
}
