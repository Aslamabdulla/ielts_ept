import 'package:get/get.dart';
import 'package:ielts/controller/audio_controller/audio_controller.dart';
import 'package:ielts/controller/choice_controller.dart';
import 'package:ielts/controller/exercise_controller/exercise_controller.dart';
import 'package:ielts/controller/internet_check_controller/internet_controller.dart';
import 'package:ielts/controller/registration_controller/registration_controller.dart';

import 'package:ielts/controller/timer_controller/timer_controller.dart';

import '../controller/dashboard_controller/dashboard_controller.dart';

ChoiceController choiceCtrl = Get.put<ChoiceController>(ChoiceController());
RegistrationController regCtrl =
    Get.put<RegistrationController>(RegistrationController());
DashBoardController dashCtrl =
    Get.put<DashBoardController>(DashBoardController(), permanent: true);
AudioController audioContrl = Get.put<AudioController>(AudioController());
TimerController timerCtrl =
    Get.put<TimerController>(TimerController(), permanent: true);
ExerciseController exerciseCtrl =
    Get.put<ExerciseController>(ExerciseController(), permanent: true);

// Logger logger = Logger();
class InternetCheckerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<InterNetCheckController>(InterNetCheckController(),
        permanent: true);
  }
}
