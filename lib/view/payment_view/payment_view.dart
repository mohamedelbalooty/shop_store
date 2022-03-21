import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/payment_controller.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';
import 'package:shop_store/view/app_components.dart';

class PaymentView extends StatelessWidget {
  PaymentView({Key? key}) : super(key: key);
  final _paymentController = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: buildAppBarUtil(title: 'payment'.tr),
      body: Obx(() {
        if (_paymentController.isLoading.value) {
          return const BuildCircularLoadingUtil();
        } else if (_paymentController.isError.value) {
          return BuildErrorUtil(
              message: 'location_error'.tr,
              image: 'assets/images/server_exception.svg',
              onClick: () async {
                await _paymentController.determineCurrentAddress();
              });
        } else {
          return Padding(
            padding: symmetricHorizontalPadding1(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: infinityWidth,
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(
                        color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                        width: 2.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextUtil(
                          text: 'delivery'.tr,
                          fontSize: 18.sp,
                          color:
                              Get.isDarkMode ? mainDarkColor : mainLightColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpace1(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextUtil(
                          text: 'Mohamed Elbalooty'
                              .split(' ')
                              .map((e) => e.capitalize)
                              .join(' '),
                          fontSize: 16.sp,
                          color: Get.isDarkMode
                              ? secondDarkColor
                              : secondLightColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextUtil(
                          text: 'mohamedelblooty123@gmail.com',
                          fontSize: 16.sp,
                          color: Get.isDarkMode
                              ? secondDarkColor
                              : secondLightColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            IconBroken.Location,
                            size: 24.0,
                            color:
                                Get.isDarkMode ? mainDarkColor : mainLightColor,
                          ),
                          horizontalSpace1(),
                          Expanded(
                            child: TextUtil(
                              text: _paymentController.currentAddress.value,
                              fontSize: 14.sp,
                              color: Get.isDarkMode
                                  ? secondDarkColor
                                  : secondLightColor,
                              fontWeight: FontWeight.normal,
                              maxLines: 3,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                BuildElevatedButtonUtil(
                  child: TextUtil(
                    text: 'pay_now'.tr,
                    color: Get.isDarkMode ? secondDarkColor : secondLightColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                  size: Size(infinityWidth, 50.h),
                  onClick: () {},
                ),
                verticalSpace4(),
              ],
            ),
          );
        }
      }),
    );
  }
}
