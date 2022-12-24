import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/constants.dart';
import 'package:progress_indicator/progress_indicator.dart';

Container audioPlayerWidget() {
  return Container(
    width: 353.w,
    height: 80.h,
    padding: const EdgeInsets.only(left: 10, right: 10, top: 16).r,
    decoration:
        BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(8)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  print("hello");

                  // audioContrl.player.play();
                  audioContrl.playAudio();

                  audioContrl.isPlaying.value = !audioContrl.isPlaying.value;
                },
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: kGreen,
                  child: Icon(
                    Icons.play_arrow,
                    color: kWhite,
                    size: 20.sp,
                  ),
                ),
              ),
              kWidth10,
              Container(
                  width: 260.w,
                  // height: 5.h,
                  child: BarProgress(
                    color: kGreen,
                    stroke: 6.r,
                    percentage: 100,
                    textStyle: const TextStyle(fontSize: 0),
                  ))
            ],
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                "000",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w800),
              ),
            )),
      ],
    ),
  );
}
