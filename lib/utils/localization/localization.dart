import 'package:get/get.dart';
import 'package:shop_store/utils/localization/languages/ar.dart';
import 'package:shop_store/utils/localization/languages/en.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'ar': ar, 'en': en};
}
