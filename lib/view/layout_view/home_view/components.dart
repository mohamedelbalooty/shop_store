import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';

class BuildSearchWidget extends StatelessWidget {
  final TextEditingController controller;

  const BuildSearchWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (String? value) {},
      cursorColor: Get.isDarkMode ? mainDarkColor : mainLightColor,
      style: TextStyle(
        color: Get.isDarkMode ? mainDarkColor : mainLightColor,
        fontSize: 14.sp,
      ),
      decoration: InputDecoration(
        contentPadding:
        const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        label: const Text('Search'),
        labelStyle: TextStyle(
            color: Get.isDarkMode ? mainDarkColor : mainLightColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            height: 2),
        prefixIcon: Icon(
          IconBroken.Search,
          size: 24.sp,
          color: Get.isDarkMode ? mainDarkColor : mainLightColor,
        ),
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(),
      ),
    );
  }

  OutlineInputBorder _border() => OutlineInputBorder(
    borderSide: BorderSide(
      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
      width: 1.5,
    ),
  );
}
