import 'package:get/get.dart';
import 'package:ielts/main.dart';

class ChoiceController extends GetxController {
  RxBool isCoiceSelected = false.obs;
  setChoice(String value) {
    prefs.setString("choice", value);
  }
}
