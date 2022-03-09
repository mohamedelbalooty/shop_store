import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';
import '../app_components.dart';

class BuildSearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final Widget searchIcon;
  final Widget searchOptions;
  final Function(String) onChanged;

  const BuildSearchWidget({
    Key? key,
    required this.controller,
    required this.searchIcon,
    required this.searchOptions,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: symmetricHorizontalPadding1(),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: Get.isDarkMode ? mainDarkColor : mainLightColor,
        style: TextStyle(
          color: Get.isDarkMode ? mainDarkColor : mainLightColor,
          fontSize: 14.sp,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
          label: const Text('Search'),
          labelStyle: TextStyle(
            color: Get.isDarkMode ? mainDarkColor : mainLightColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            height: 2.5
          ),
          prefixIcon: searchIcon,
          suffixIcon: searchOptions,
          border: _border(),
          enabledBorder: _border(),
          focusedBorder: _border(),
          errorBorder: _border(),
          focusedErrorBorder: _border(),
        ),
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
