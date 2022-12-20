import 'package:get/get.dart';
import 'package:ielts/controller/choice_controller.dart';
import 'package:ielts/controller/registration_controller/registration_controller.dart';

import '../controller/dashboard_controller/dashboard_controller.dart';

ChoiceController choiceCtrl = Get.put(ChoiceController());
RegistrationController regCtrl = Get.put(RegistrationController());
DashBoardController dashCtrl = Get.put(DashBoardController(), permanent: true);
// Logger logger = Logger();
