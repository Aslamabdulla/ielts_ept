import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ielts/model/audio_model/audio_model.dart';
import 'package:ielts/dependency/dependency.dart';

class AudioController extends GetxController {
  RealtimePlayingInfos? currentPosition;
  RealtimePlayingInfos? duration;
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId("1");
  final String kBaseUrl = "https://qicksale.com/ept_backend/storage/";
  RxString currentUrl = "".obs;
  RxBool isPlaying = false.obs;
  RxString durationCurrent = "".obs;
  RxList<TestAudios> audios = <TestAudios>[].obs;
  var error;
  openAudio(int id) async {
    try {
      var currentAudio = audios.firstWhere((element) => element.id == id);

      if (currentAudio.audio.path != kBaseUrl) {
        await audioPlayer.open(currentAudio.audio,
            autoStart: false,
            playInBackground: PlayInBackground.enabled,
            notificationSettings: const NotificationSettings(),
            loopMode: LoopMode.single);
      }
    } on PlatformException catch (t) {
      Get.snackbar("Error", "Unable to fetch audio");
    }
  }

  playAudio() async {
    try {
      if (audioPlayer.isPlaying.value) {
        audioPlayer.pause();
      } else {
        audioPlayer.play();
      }
    } on PlatformException catch (e) {
      error = e;
    }
  }

  setAudio() async {
    try {
      audios.value = exerciseCtrl.exerciseData.map((element) {
        element?.audio ??= "";
        return TestAudios(
            id: element?.id ?? 0,
            audio: Audio.network(kBaseUrl + element!.audio!));
      }).toList();
    } catch (e) {
      var error = e;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    audioPlayer.stop();
    super.onClose();
  }
}
