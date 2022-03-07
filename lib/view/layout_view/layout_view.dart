import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/cart_controller.dart';
import 'package:shop_store/logic/controller/layout_controller.dart';
import 'package:shop_store/logic/controller/theme_controller.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';
import 'package:shop_store/utils/routes/routes.dart';
import 'package:shop_store/view/app_components.dart';
import 'components.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({Key? key}) : super(key: key);

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  final _controller = Get.find<LayoutController>();
  final _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: TextUtil(
            text: _controller.appBarTitles[_controller.selectedScreen.value],
            fontSize: 20.sp,
            color: Get.isDarkMode ? secondLightColor : secondaryColor,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Get.isDarkMode ? secondDarkColor : secondLightColor,
          leading: IconButton(
            icon: Icon(Get.isDarkMode ? Icons.brightness_2_outlined : Icons.brightness_2, color: Get.isDarkMode ? mainDarkColor : mainLightColor,),
            onPressed: (){
              ThemeController().changeTheme();
            },
          ),
          actions: [
            BuildAppBarCartButton(),
            // Obx((){
            //   return Badge(
            //     badgeContent: TextUtil(text: _cartController.productsQuantity.toString(), fontSize: 13.sp, fontWeight: FontWeight.bold,),
            //     badgeColor: Get.isDarkMode ? mainDarkColor : mainLightColor,
            //     position: BadgePosition.topEnd(top: 0, end: 3),
            //     animationDuration: const Duration(milliseconds: 300),
            //     animationType: BadgeAnimationType.scale,
            //     child: IconButton(
            //       icon: const Icon(IconBroken.Bag_2),
            //       color: Get.isDarkMode ? mainDarkColor : secondaryColor,
            //       iconSize: 32.0,
            //       onPressed: (){
            //         Get.toNamed(RoutesPath.cartView);
            //       },
            //     ),
            //   );
            // }),
          ],
        ),
        body: IndexedStack(
          index: _controller.selectedScreen.value,
          children: _controller.screens,
        ),
        bottomNavigationBar: BuildBottomNavBarWidget(
          controller: _controller,
        ),
      );
    });
  }
}
