import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/model/category.dart';
import 'package:shop_store/utils/colors.dart';
import '../../app_components.dart';

class BuildCategoryItem extends StatelessWidget {
  final Category category;
  final Function() onClick;

  const BuildCategoryItem(
      {Key? key, required this.category, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 150.h,
        width: infinityWidth,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(
            color: Get.isDarkMode ? mainDarkColor : mainLightColor,
            width: 2.5,
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: BuildNetworkImageUtil(
                image: category.image,
                width: infinityWidth,
              ),
            ),
            Container(
              height: 30.h,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              ),
              child: TextUtil(
                text: category.name,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: Get.isDarkMode ? secondDarkColor : secondLightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
