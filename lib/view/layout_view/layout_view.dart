import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/layout_controller.dart';
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
        List<String> appBarTitles = <String>[
          'home'.tr,
          'categories'.tr,
          'favourite'.tr,
          'settings'.tr
        ];
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: TextUtil(
              text: appBarTitles[_layoutController.selectedScreen.value],
              fontSize: 20.sp,
              color: Get.isDarkMode ? secondLightColor : secondaryColor,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor:
                Get.isDarkMode ? secondDarkColor : secondLightColor,
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
