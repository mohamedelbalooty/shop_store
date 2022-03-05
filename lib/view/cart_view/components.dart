import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/utils/colors.dart';
import '../app_components.dart';

class BuildCartBottomAppBar extends StatelessWidget {
  const BuildCartBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: symmetricHorizontalPadding1(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtil(
            text: 'Total order',
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? secondLightColor : secondDarkColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextUtil(
                text: 'Total purchases',
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode ? secondLightColor : secondDarkColor,
              ),
              TextUtil(
                text: '\$100.0',
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode ? secondLightColor : secondDarkColor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextUtil(
                text: 'Total products number',
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode ? secondLightColor : secondDarkColor,
              ),
              TextUtil(
                text: '5',
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode ? secondLightColor : secondDarkColor,
              ),
            ],
          ),
          verticalSpace1(),
          BuildElevatedButtonUtil(
            child: TextUtil(
              text: 'Pay now',
              color: Get.isDarkMode ? secondDarkColor : secondLightColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            color: Get.isDarkMode ? mainDarkColor : mainLightColor,
            size: Size(infinityWidth, 50.h),
            onClick: () {},
          ),
          verticalSpace2(),
        ],
      ),
    );
  }
}
