import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/layout_controller.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';
import '../app_components.dart';

class BuildBottomNavBarItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Function() onClick;

  const BuildBottomNavBarItem(
      {Key? key,
      required this.color,
      required this.icon,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kBottomNavigationBarHeight,
      child: Material(
        color: color,
        child: InkWell(
          child: Icon(
            icon,
            size: 28.0,
          ),
          onTap: onClick,
        ),
      ),
    );
  }
}

class BuildBottomNavBarWidget extends StatelessWidget {
  final LayoutController controller;

  const BuildBottomNavBarWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 0,
      selectedLabelStyle: const TextStyle(height: 0),
      unselectedLabelStyle: const TextStyle(height: 0),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: BuildBottomNavBarItem(
              color: controller.getBgColor(0),
              icon: IconBroken.Home,
              onClick: () => controller.onItemTapped(0),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: BuildBottomNavBarItem(
              color: controller.getBgColor(1),
              icon: IconBroken.Category,
              onClick: () => controller.onItemTapped(1),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: BuildBottomNavBarItem(
              color: controller.getBgColor(2),
              icon: IconBroken.Heart,
              onClick: () => controller.onItemTapped(2),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: BuildBottomNavBarItem(
              color: controller.getBgColor(3),
              icon: IconBroken.Setting,
              onClick: () => controller.onItemTapped(3),
            ),
            label: ''),
      ],
      currentIndex: controller.selectedIndex.value,
      selectedItemColor: controller.selectedItemColor,
      unselectedItemColor: controller.unselectedItemColor,
    );
  }
}

class BuildAppBarCartButton extends StatelessWidget {
  final String cartNum;

  const BuildAppBarCartButton({Key? key, required this.cartNum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 50.0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(
              IconBroken.Bag_2,
              color: secondaryColor,
              size: 32.0,
            ),
            PositionedDirectional(
              top: 12,
              end: 26,
              child: Container(
                height: 20.0,
                width: 20.0,
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: TextUtil(
                    text: cartNum,
                    color: Get.isDarkMode ? secondDarkColor : secondLightColor,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
