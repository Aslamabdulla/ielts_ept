import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/model/get_result_model/get_result_model.dart';
import 'package:ielts/view/common/common.dart';
import 'package:ielts/view/exercise_screen_listening/widgets/error_widget/error_widget.dart';

class MyCustomWidget extends StatefulWidget {
  final String points;
  const MyCustomWidget({super.key, required this.points});

  @override
  MyCustomWidgetState createState() => MyCustomWidgetState();
}

class MyCustomWidgetState extends State<MyCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return const AnimCard(
      Color(0xffFF6594),
      '',
      '',
      '',
    );
  }
}

class AnimCard extends StatefulWidget {
  final Color color;
  final String num;
  final String numEng;
  final String content;

  const AnimCard(this.color, this.num, this.numEng, this.content);

  @override
  AnimCardState createState() => AnimCardState();
}

class AnimCardState extends State<AnimCard> {
  var padding = 150.0;
  var bottomPadding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPadding(
            padding: EdgeInsets.only(top: padding, bottom: bottomPadding),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            child: Container(
              child: CardItem(
                widget.color,
                widget.num,
                widget.numEng,
                widget.content,
                () {
                  setState(() {
                    padding = padding == 0 ? 150.0 : 0.0;
                    bottomPadding = bottomPadding == 0 ? 150 : 0.0;
                  });
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 200).r,
              height: 180.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2), blurRadius: 30)
                ],
                color: Colors.grey.shade200.withOpacity(1.0),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Center(
                  child: Icon(Icons.history_edu,
                      color: const Color(0xffFF6594).withOpacity(1.0),
                      size: 70)),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final Color color;
  final String num;
  final String numEng;
  final String content;
  final onTap;

  const CardItem(this.color, this.num, this.numEng, this.content, this.onTap,
      {super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.h),
        height: 220.h,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color(0xffFF6594).withOpacity(0.2),
                blurRadius: 25),
          ],
          color: color.withOpacity(1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(30.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0.r),
          child: FutureBuilder<GetResultModel?>(
              future: exerciseCtrl.getResults(exerciseCtrl
                      .exerciseData[exerciseCtrl.currentExerciseIndex.value]
                      ?.testId ??
                  ""),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Unable to Load");
                } else {
                  if (exerciseCtrl.exerciseData.isEmpty) {
                    return ErrorWidgetNetwork(image: "assets/images/404.gif");
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'TAP TO VIEW RESULT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      snapshot.data?.data?.result?.scoredPoints == null
                          ? Text("0", style: kMailBoxStyle)
                          : Text(
                              "YOUR SCORE IS ${snapshot.data?.data?.result?.scoredPoints ??= "0"} / ${snapshot.data?.data?.result?.points ??= "0"}",
                              style: kMailBoxStyle),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
