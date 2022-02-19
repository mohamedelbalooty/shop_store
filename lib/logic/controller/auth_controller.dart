import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisible = false;
  bool isChecked = false;

  void changeVisible() {
    isVisible = !isVisible;
    update();
  }

  void changeCheck(bool value) {
    isChecked = value;
    update();
  }
}
