// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/view/common/common.dart';
import 'package:progress_indicator/progress_indicator.dart';

import 'package:ielts/dependency/dependency.dart';
import 'package:ielts/view/common/constants.dart';

class AudioPlayer extends StatelessWidget {
  const AudioPlayer({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      audioContrl.openAudio(id);
    });
    return Container(
      width: 353.w,
      height: 80.h,
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ).r,
      decoration:
          BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    audioContrl.playAudio();

                    audioContrl.isPlaying.value = !audioContrl.isPlaying.value;
                  },
                  child: PlayerBuilder.isPlaying(
                      player: audioContrl.audioPlayer,
                      builder: (context, isPlaying) {
                        return Container(
                            height: 35.h,
                            width: 35.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: kGreen,
                            ),
                            // radius: 20.r,

                            child: Center(
                              child: isPlaying
                                  ? Icon(
                                      Icons.pause_outlined,
                                      color: kWhite,
                                      size: 25.sp,
                                    )
                                  : Icon(
                                      Icons.play_arrow,
                                      color: kWhite,
                                      size: 25.sp,
                                    ),
                            ));
                      }),
                ),
                kWidth10,
                audioContrl.audioPlayer.builderRealtimePlayingInfos(
                    builder: (context, infos) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 20.h),
                          width: 280.w,
                          child: ProgressBar(
                            baseBarColor: kGreen.withOpacity(.2),
                            barHeight: 7.h,
                            thumbRadius: 5.r,
                            progressBarColor: kGreen,
                            thumbColor: Colors.transparent,
                            thumbCanPaintOutsideBar: false,
                            progress: infos.currentPosition,
                            buffered: const Duration(),
                            total: infos.duration,
                            timeLabelType: TimeLabelType.remainingTime,
                            timeLabelLocation: TimeLabelLocation.none,
                            timeLabelTextStyle: TextStyle(color: Colors.black),
                            onSeek: (to) {
                              audioContrl.audioPlayer.seek(to);
                            },
                          )),
                      kHeight5,
                      StreamBuilder<RealtimePlayingInfos>(
                          stream: audioContrl.audioPlayer.realtimePlayingInfos,
                          builder: (context, snapshot) {
                            Duration? position = snapshot.data?.duration;
                            Duration duration = infos.currentPosition;
                            num? positionInSeconds =
                                position?.inSeconds ?? 1 / 1000;
                            double durationInSeconds =
                                duration.inMilliseconds / 1000;
                            num remainingDurationInSeconds =
                                durationInSeconds - positionInSeconds;
                            Duration remainingDuration = Duration(
                                seconds: remainingDurationInSeconds.toInt());

                            int minutes = remainingDuration.inMinutes;
                            int seconds =
                                remainingDuration.inSeconds - (minutes * 60);
                            String formattedDuration =
                                "${minutes.toString().padLeft(2, "0")}:${seconds.toString().replaceAll(RegExp(r'-'), "").padLeft(2, "0")}";
                            return Row(
                              children: [
                                Icon(
                                  Icons.timer_outlined,
                                  size: 15.sp,
                                ),
                                Text(
                                  formattedDuration,
                                  style: audioTextStyle,
                                ),
                              ],
                            );
                            // return Text(
                            //  ""
                            //   style: TextStyle(
                            //       fontSize: 10.sp, fontWeight: FontWeight.w800),
                            // );
                          }),
                    ],
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
