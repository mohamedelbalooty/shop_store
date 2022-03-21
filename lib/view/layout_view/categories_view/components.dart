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
        // padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? secondDarkColor : secondLightColor,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
                color: Get.isDarkMode ? Colors.white24 : Colors.black12,
                offset: const Offset(-1, 2),
                spreadRadius: 2,
                blurRadius: 2),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150.h,
              width: 150.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(8.0),
                    bottomStart: Radius.circular(8.0)),
                image: DecorationImage(
                  image: NetworkImage(category.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Spacer(),
            TextUtil(
              text: category.name,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              height: 1.5,
              color: Get.isDarkMode ? secondLightColor : secondDarkColor,
            ),
            horizontalSpace4(),
          ],
        ),
      ),
    );
  }
}
