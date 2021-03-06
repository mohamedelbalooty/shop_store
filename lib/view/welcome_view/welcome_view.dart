import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/routes/routes.dart';
import '../app_components.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BuildBackgroundUtil(),
            Container(
              height: infinityHeight,
              width: infinityWidth,
              color: blackColor.withOpacity(0.2),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: isPortrait ? 200.h : 30.h),
                      Container(
                        height: 60.h,
                        width: 160.w,
                        decoration: BoxDecoration(
                          color: whiteColor.withOpacity(0.1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: Center(
                          child: TextUtil(
                            text: 'welcome'.tr,
                            fontSize: 35.sp,
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: Get.locale.toString() == 'ar'
                                ? 'Cairo'
                                : 'Redressed-Regular',
                          ),
                        ),
                      ),
                      verticalSpace2(),
                      const BuildLogoUtil(),
                      SizedBox(height: isPortrait ? 150 : 50),
                      ElevatedButton(
                        child: TextUtil(
                          text: 'get_started'.tr,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                                horizontal: 30.w, vertical: 5.h),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(mainLightColor),
                          shape:
                              MaterialStateProperty.all<BeveledRectangleBorder>(
                            BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () => Get.offNamed(RoutesPath.loginView),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtil(
                            text: 'do_not_have_account'.tr,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.normal,
                          ),
                          horizontalSpace1(),
                          BuildTextButtonUtil(
                            text: 'signup'.tr,
                            fontSize: 20.sp,
                            decoration: TextDecoration.underline,
                            onClick: () => Get.offNamed(RoutesPath.signupView),
                          ),
                        ],
                      ),
                      verticalSpace2(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
