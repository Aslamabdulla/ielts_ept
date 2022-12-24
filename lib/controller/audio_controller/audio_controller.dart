import 'package:get/get.dart';
import 'package:ielts/dependency/dependency.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends GetxController {
  final AudioPlayer player = AudioPlayer();

  final String kBaseUrl = "https://qicksale.com/ept_backend/storage/";
  RxString currentUrl = "".obs;
  RxBool isPlaying = false.obs;
  // String url = exerciseCtrl
  //         .exerciseData[exerciseCtrl.currentExerciseIndex.value]?.audio ??
  // "";
  playAudio() async {
    if (isPlaying.value) {
      player.pause();
    } else {
      player.play();
    }
  }

  setAudio(String audioUrl) async {
    // print(audioUrl);
    player.playerStateStream.asBroadcastStream();
    currentUrl.value = kBaseUrl + audioUrl;
    print(currentUrl.value);
    // final duration = await player.setUrl(// Load a URL
    //     currentUrl.value);
    final duration =
        player.setAudioSource(AudioSource.uri(Uri.parse(currentUrl.value)));
    // player.setAudioSource(source)

    return duration;
  }

  init() async {
    setAudio(exerciseCtrl
            .exerciseData[exerciseCtrl.currentExerciseIndex.value]?.audio ??
        "");
  }
}
