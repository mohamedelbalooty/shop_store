import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/utils/routes/routes.dart';
import 'utils/colors.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
        theme: ThemeData(
          primaryColor: mainLightColor,
          primarySwatch: Colors.pink,
          fontFamily: 'Cairo',
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
      ),
    );
  }
}
