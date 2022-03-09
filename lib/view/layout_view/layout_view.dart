import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/layout_controller.dart';
import 'package:shop_store/logic/controller/theme_controller.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/view/app_components.dart';
import 'components.dart';

class LayoutView extends StatelessWidget {
  LayoutView({Key? key}) : super(key: key);
  final _layoutController = Get.find<LayoutController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: TextUtil(
              text: _layoutController.appBarTitles[_layoutController.selectedScreen.value],
              fontSize: 20.sp,
              color: Get.isDarkMode ? secondLightColor : secondaryColor,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor:
                Get.isDarkMode ? secondDarkColor : secondLightColor,
            leading: IconButton(
              icon: Icon(
                Get.isDarkMode
                    ? Icons.brightness_2_outlined
                    : Icons.brightness_2,
                color: Get.isDarkMode ? mainDarkColor : mainLightColor,
              ),
              onPressed: () => ThemeController().changeTheme(),
            ),
            actions: [
              BuildAppBarCartButton(),
            ],
          ),
          body: IndexedStack(
            index: _layoutController.selectedScreen.value,
            children: _layoutController.screens,
          ),
          bottomNavigationBar: BuildBottomNavBarWidget(
            controller: _layoutController,
          ),
        );
      },
    );
  }
}
