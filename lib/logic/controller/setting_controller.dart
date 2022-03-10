import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController{
  bool switchValue = false;
  void onChangeTheme(bool value){
    switchValue = value;
    update();
  }

  void onChangeLanguage(String language){
    Get.updateLocale(Locale(language));
    update();
  }
}