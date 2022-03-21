import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/cart_controller.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';
import '../app_components.dart';
import 'components.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);

  final _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: buildAppBarUtil(
        title: 'cart_items'.tr,
        actions: [
          BuildIconButtonUtil(
            icon: IconBroken.Delete,
            size: 24.0,
            color: Get.isDarkMode ? secondLightColor : secondaryColor,
            onClick: () {
              _cartController.cartProducts.isNotEmpty
                  ? Get.defaultDialog(
                      title: 'delete_cart'.tr,
                      middleText: 'sure_delete_cart'.tr,
                      titleStyle: TextStyle(
                        color:
                            Get.isDarkMode ? secondLightColor : secondDarkColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      middleTextStyle: TextStyle(
                        color:
                            Get.isDarkMode ? secondLightColor : secondDarkColor,
                        fontSize: 16.sp,
                      ),
                      confirm: BuildElevatedButtonUtil(
                        child: TextUtil(
                          text: 'yes'.tr,
                          color: Get.isDarkMode
                              ? secondDarkColor
                              : secondLightColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                        size: Size(80.w, 30.h),
                        onClick: () {
                          _cartController.deleteCart();
                          Get.back();
                        },
                      ),
                      cancel: BuildElevatedButtonUtil(
                        child: TextUtil(
                          text: 'no'.tr,
                          color: Get.isDarkMode
                              ? secondDarkColor
                              : secondLightColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                        size: Size(80.w, 30.h),
                        onClick: () {
                          Get.back();
                        },
                      ),
                    )
                  : showSnackBar(
                      title: 'cart_details'.tr,
                      message: 'no_product_cart'.tr,
                      position: SnackPosition.BOTTOM,
                    );
            },
          ),
        ],
      ),
      body: Obx(() {
        if (_cartController.cartProducts.isEmpty) {
          return BuildEmptyUtil(
            image: 'assets/images/empty_cart.svg',
            height: 220.h,
            width: 220.w,
            message: 'empty_cart'.tr,
          );
        }
        return ListView.separated(
          padding: symmetricHorizontalPadding1(),
          itemCount: _cartController.cartProducts.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: index == 4 ? 10.h : 0.0),
              child: BuildCartProductItem(
                product: _cartController.cartProducts.keys.toList()[index],
                index: index,
              ),
            );
          },
          separatorBuilder: (_, index) => verticalSpace2(),
        );
      }),
      bottomNavigationBar: Obx(
        () {
          if (_cartController.cartProducts.isEmpty) {
            return const SizedBox();
          }
          return BuildCartBottomAppBar();
        },
      ),
    );
  }
}
