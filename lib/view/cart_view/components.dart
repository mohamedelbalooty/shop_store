import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/cart_controller.dart';
import 'package:shop_store/model/product.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/view/payment_view/payment_view.dart';
import '../app_components.dart';

class BuildCartProductItem extends StatelessWidget {
  final Product product;
  final int index;

  BuildCartProductItem({Key? key, required this.product, required this.index})
      : super(key: key);
  final _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: infinityWidth,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? secondDarkColor : secondLightColor,
        boxShadow: [
          BoxShadow(
              color: Get.isDarkMode ? Colors.white12 : Colors.black12,
              blurRadius: 2,
              offset: const Offset(0.5, 0.5),
              spreadRadius: 1.5),
        ],
      ),
      child: Row(
        children: [
          BuildNetworkImageUtil(
            image: product.image,
            height: 120.h,
            width: 110.h,
          ),
          horizontalSpace2(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtil(
                  text: product.title,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                  textOverflow: TextOverflow.ellipsis,
                ),
                TextUtil(
                  text: product.category,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? whiteColor : const Color(0xFFABABAB),
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      product.rating.rate.floor() >= 1
                          ? Icons.star
                          : Icons.star_border,
                      size: 15.0,
                      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                    ),
                    Icon(
                      product.rating.rate.floor() >= 2
                          ? Icons.star
                          : Icons.star_border,
                      size: 15.0,
                      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                    ),
                    Icon(
                      product.rating.rate.floor() >= 3
                          ? Icons.star
                          : Icons.star_border,
                      size: 15.0,
                      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                    ),
                    Icon(
                      product.rating.rate.floor() >= 4
                          ? Icons.star
                          : Icons.star_border,
                      size: 15.0,
                      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                    ),
                    Icon(
                      product.rating.rate.floor() >= 5
                          ? Icons.star
                          : Icons.star_border,
                      size: 15.0,
                      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                    ),
                  ],
                ),
                verticalSpace1(),
                Row(
                  children: [
                    BuildCircleButtonUtil(
                      child: TextUtil(
                        text: '＋',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      size: Size(28.w, 28.w),
                      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                      onClick: () =>
                          _cartController.addProductToCart(product: product),
                    ),
                    horizontalSpace1(),
                    TextUtil(
                      text: _cartController.cartProducts.values
                          .toList()[index]
                          .toString(),
                      fontSize: 16.sp,
                      color: Get.isDarkMode
                          ? mainDarkColor
                          : const Color(0xFF094675),
                      fontWeight: FontWeight.bold,
                    ),
                    horizontalSpace1(),
                    BuildCircleButtonUtil(
                      child: TextUtil(
                        text: '－',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      size: Size(28.w, 28.w),
                      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                      onClick: () => _cartController
                          .minimizeProductNumberFromCart(product: product),
                    ),
                  ],
                ),
                verticalSpace1(),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: symmetricHorizontalPadding1(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextUtil(
                    text:
                        '\$${_cartController.productSubTotalPrice.toList()[index].roundToDouble()}',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  BuildElevatedButtonUtil(
                      child: TextUtil(
                        text: 'remove'.tr,
                        color:
                            Get.isDarkMode ? secondDarkColor : secondLightColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                      size: Size(infinityWidth, 30.h),
                      onClick: () => _cartController.deleteProductFromCart(
                          product: product)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildCartBottomAppBar extends StatelessWidget {
  BuildCartBottomAppBar({Key? key}) : super(key: key);
  final _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158.h,
      width: infinityWidth,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? secondDarkColor : secondLightColor,
        boxShadow: [
          BoxShadow(
              color: Get.isDarkMode ? Colors.white12 : Colors.black12,
              blurRadius: 3,
              offset: const Offset(0.0, -1.0),
              spreadRadius: 5),
        ],
      ),
      child: Padding(
        padding: symmetricHorizontalPadding1(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtil(
              text: 'total_order'.tr,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? secondLightColor : secondDarkColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtil(
                  text: 'total_price'.tr,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                ),
                TextUtil(
                  text: '\$${_cartController.totalPrice}',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtil(
                  text: 'total_product'.tr,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                ),
                TextUtil(
                  text: _cartController.productsQuantity.toString(),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                ),
              ],
            ),
            verticalSpace1(),
            BuildElevatedButtonUtil(
              child: TextUtil(
                text: 'pay_now'.tr,
                color: Get.isDarkMode ? secondDarkColor : secondLightColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              color: Get.isDarkMode ? mainDarkColor : mainLightColor,
              size: Size(infinityWidth, 50.h),
              onClick: () => Get.to(PaymentView()),
            ),
            verticalSpace2(),
          ],
        ),
      ),
    );
  }
}
