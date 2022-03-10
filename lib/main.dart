import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/utils/localization/localization.dart';
import 'package:shop_store/utils/routes/routes.dart';
import 'logic/controller/theme_controller.dart';
import 'utils/colors.dart';
import 'utils/helper/dio_helper.dart';
import 'utils/helper/storage_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await StorageHelper.initStorage();
  DioHelper.init();
  runApp(const ShopStore());
}

class ShopStore extends StatelessWidget {
  const ShopStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop store',
        initialRoute: Routes.initialRoute,
        getPages: Routes.routes,
        locale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        translations: AppLocalization(),
        theme: ThemeData(
          primaryColor: mainLightColor,
          primarySwatch: Colors.pink,
          backgroundColor: secondLightColor,
          fontFamily: 'Cairo',
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: secondLightColor,
          ),
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          primaryColor: mainDarkColor,
          primarySwatch: Colors.pink,
          backgroundColor: secondDarkColor,
          fontFamily: 'Cairo',
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: secondDarkColor),
          brightness: Brightness.dark,
        ),
        themeMode: ThemeController().themeMode,
      ),
    );
  }
}
