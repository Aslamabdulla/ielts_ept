// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/common_widgets/result_background_clipper/result_screen_bg_clipper.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:ielts/view/result_screen/widgets/expandable_card_result.dart';

import '../common/common.dart';

class ResultPageScreen extends StatelessWidget {
  final String testId;
  const ResultPageScreen({
    Key? key,
    required this.testId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = Get.width;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: kBlack,
          title: Text(
            "RESULT",
            style: kTextAppBarResult,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            //
          ],
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: ResultBgClipper(),
              child: Container(
                height: 200.0.h,
                width: Get.width,
                decoration:
                    const BoxDecoration(gradient: kLinearGradientResult),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: FutureBuilder(
                    future: exerciseCtrl.getResults(testId),
                    builder: (context, snapshot) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SlideFadeTransition(
                            curve: Curves.elasticOut,
                            delayStart: const Duration(milliseconds: 500),
                            animationDuration:
                                const Duration(milliseconds: 1200),
                            offset: 2.5,
                            direction: Direction.horizontal,
                            child: Text("CHECK YOUR RESULT HERE",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                          kHeight20,
                          const MyCustomWidget(
                            points: "",
                          )
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {
            int temp = exerciseCtrl.exerciseData.length;
            int index = exerciseCtrl.currentExerciseIndex.value;
            if (exerciseCtrl.isQuitted.value) {
              Get.close(2);
              exerciseCtrl.currentExerciseIndex.value = 0;
              exerciseCtrl.isQuitted.value = false;
            }
            if (temp - 1 > index) {
              exerciseCtrl.nextExercise();
              Get.back();
            } else {
              Get.close(2);

              timerCtrl.timerCancel();
              exerciseCtrl.currentExerciseIndex.value = 0;
            }
          },
          child: Container(
            height: w / 2.75,
            width: w / 1.5,
            child: Animator<double>(
              duration: const Duration(milliseconds: 2000),
              cycles: 0,
              curve: Curves.easeInOut,
              tween: Tween<double>(begin: 0.0, end: 10.0),
              builder: (context, animatorState, child) => Column(
                children: [
                  SizedBox(
                    height: animatorState.value * 5,
                  ),
                  Container(
                    height: w / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          colors: [
                            tealishBlue,
                            // lavenderBlue,
                            turquiseBlue,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.1, 1]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(.15),
                          blurRadius: 20,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Obx(
                        () => Text(
                          exerciseCtrl.isQuitted.value
                              ? "NEXT QUESTION"
                              : "FINISH TEST",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum Direction { vertical, horizontal }

class SlideFadeTransition extends StatefulWidget {
  final Widget child;

  final double offset;

  final Curve curve;

  final Direction direction;

  final Duration delayStart;

  final Duration animationDuration;

  SlideFadeTransition({
    required this.child,
    this.offset = 1.0,
    this.curve = Curves.easeIn,
    this.direction = Direction.vertical,
    this.delayStart = const Duration(seconds: 0),
    this.animationDuration = const Duration(milliseconds: 800),
  });

  @override
  _SlideFadeTransitionState createState() => _SlideFadeTransitionState();
}

class _SlideFadeTransitionState extends State<SlideFadeTransition>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animationSlide;

  late AnimationController _animationController;

  late Animation<double> _animationFade;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    if (widget.direction == Direction.vertical) {
      _animationSlide = Tween<Offset>(
              begin: Offset(0, widget.offset), end: const Offset(0, 0))
          .animate(CurvedAnimation(
        curve: widget.curve,
        parent: _animationController,
      ));
    } else {
      _animationSlide = Tween<Offset>(
              begin: Offset(widget.offset, 0), end: const Offset(0, 0))
          .animate(CurvedAnimation(
        curve: widget.curve,
        parent: _animationController,
      ));
    }

    _animationFade =
        Tween<double>(begin: -1.0, end: 1.0).animate(CurvedAnimation(
      curve: widget.curve,
      parent: _animationController,
    ));

    Timer(widget.delayStart, () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationFade,
      child: SlideTransition(
        position: _animationSlide,
        child: widget.child,
      ),
    );
  }
}
