import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/utils/constants.dart';
import 'package:shop_store/utils/helper/storage_helper.dart';

class ThemeController {
  bool getThemeFromStorage() => StorageHelper.getBoolData(key: themeKey);

  ThemeMode get themeMode =>
      getThemeFromStorage() ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    if (getThemeFromStorage()) {
      Get.changeThemeMode(ThemeMode.light);
      StorageHelper.setBoolData(key: themeKey, value: false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      StorageHelper.setBoolData(key: themeKey, value: true);
    }
  }
}
