import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/layout_controller.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/view/app_components.dart';
import 'components.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  final _controller = Get.find<LayoutController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Get.isDarkMode ? secondDarkColor : secondLightColor,
        appBar: AppBar(
          title: TextUtil(
            text: _controller.appBarTitles[_controller.selectedIndex.value],
            fontSize: 20.0,
            color: Get.isDarkMode ? secondLightColor : secondDarkColor,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Get.isDarkMode ? secondDarkColor : secondLightColor,
          actions: const [
            BuildAppBarCartButton(
              cartNum: '1',
            ),
          ],
        ),
        body: IndexedStack(
          index: _controller.selectedIndex.value,
          children: _controller.screens,
        ),
        bottomNavigationBar: BuildBottomNavBarWidget(
          controller: _controller,
        ),
      );
    });
  }
}
