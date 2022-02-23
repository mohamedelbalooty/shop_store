import 'package:get_storage/get_storage.dart';

class StorageHelper {
  static GetStorage? storage = GetStorage();

  static Future<bool> initStorage() async {
    return await GetStorage.init();
  }

  static Future<void> setStringData(
      {required String key, required String value}) async {
    return await storage?.write(key, value);
  }

  static String getStringData({required String key}) {
    return storage?.read(key);
  }

  static Future<void> setBoolData(
      {required String key, required bool value}) async {
    return await storage?.write(key, value);
  }

  static bool getBoolData({required String key}) {
    return storage?.read(key) ?? false;
  }
}