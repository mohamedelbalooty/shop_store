import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/model/user_data.dart';
import 'package:shop_store/utils/constants.dart';
import 'package:shop_store/utils/helper/storage_helper.dart';

class SettingController extends GetxController {
  bool switchValue = Get.isDarkMode;

  void onChangeTheme(bool value) {
    switchValue = value;
    update();
  }
  late UserData userData;
  late String localLang;

  @override
  void onInit() {
    super.onInit();
    userData = UserData.fromJson(StorageHelper.getMapData(key: userKey)!);
    if (StorageHelper.getStringData(key: languageKey) == null) {
      localLang = 'en';
    } else {
      localLang = StorageHelper.getStringData(key: languageKey)!;
    }
  }

  void onChangeLanguage(String language) {
    Get.updateLocale(Locale(language));
    StorageHelper.setStringData(key: languageKey, value: language);
    update();
  }
}
