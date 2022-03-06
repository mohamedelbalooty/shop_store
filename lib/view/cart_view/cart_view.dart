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
      appBar: AppBar(
        title: TextUtil(
          text: 'Cart items',
          fontSize: 20.sp,
          color: Get.isDarkMode ? secondLightColor : secondaryColor,
          fontWeight: FontWeight.bold,
        ),
        leading: BuildIconButtonUtil(
          icon: IconBroken.Arrow___Left,
          size: 24.0,
          color: Get.isDarkMode ? secondLightColor : secondaryColor,
          onClick: () => Get.back(),
        ),
        actions: [
          BuildIconButtonUtil(
            icon: IconBroken.Delete,
            size: 24.0,
            color: Get.isDarkMode ? secondLightColor : secondaryColor,
            onClick: () {
              Get.defaultDialog(
                title: 'Delete cart products',
                middleText: 'Are you sure you need to clear cart ?',
                titleStyle: TextStyle(
                  color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                middleTextStyle: TextStyle(
                  color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                  fontSize: 16.sp,
                ),
                confirm: BuildElevatedButtonUtil(
                  child: TextUtil(
                    text: 'Yes',
                    color: Get.isDarkMode ? secondDarkColor : secondLightColor,
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
                    text: 'No',
                    color: Get.isDarkMode ? secondDarkColor : secondLightColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                  size: Size(80.w, 30.h),
                  onClick: () {
                    Get.back();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Obx((){
        if(_cartController.cartProducts.isEmpty){
          return BuildEmptyUtil(
            image: 'assets/images/empty_cart.svg',
            height: 220.h,
            width: 220.w,
            message: 'Your cart is empty',
          );
        }
        return ListView.separated(
          padding: symmetricHorizontalPadding1(),
          itemCount: _cartController.cartProducts.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: index == 4 ? 10.h : 0.0),
              child: BuildCartProductItem(product: _cartController.cartProducts.keys.toList()[index], index: index,),
            );
          },
          separatorBuilder: (_, index) => verticalSpace2(),
        );
      }),
      bottomNavigationBar: Obx((){
        if(_cartController.cartProducts.isEmpty){
          return const SizedBox();
        }
        return BuildCartBottomAppBar();
      }),
    );
  }
}

