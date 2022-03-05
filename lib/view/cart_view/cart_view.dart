import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';
import '../app_components.dart';
import 'components.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: ListView.separated(
        padding: symmetricHorizontalPadding1(),
        itemCount: 5,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: index == 4 ? 10.h : 0.0),
            child: Container(
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
                    image:
                        'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
                    height: 120.h,
                    width: 110.h,
                  ),
                  horizontalSpace2(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtil(
                          text: 'Total products number',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode
                              ? secondLightColor
                              : secondDarkColor,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        TextUtil(
                          text: "men's clothing",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: Get.isDarkMode
                              ? whiteColor
                              : const Color(0xFFABABAB),
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              // product.rating.rate.floor() >= 5
                              //     ? Icons.star
                              //     : Icons.star_border,
                              Icons.star_border,
                              size: 15.0,
                              color: Get.isDarkMode
                                  ? mainDarkColor
                                  : mainLightColor,
                            ),
                            Icon(
                              // product.rating.rate.floor() >= 4
                              //     ? Icons.star
                              //     : Icons.star_border,
                              Icons.star,
                              size: 15.0,
                              color: Get.isDarkMode
                                  ? mainDarkColor
                                  : mainLightColor,
                            ),
                            Icon(
                              // product.rating.rate.floor() >= 3
                              //     ? Icons.star
                              //     : Icons.star_border,
                              Icons.star,
                              size: 15.0,
                              color: Get.isDarkMode
                                  ? mainDarkColor
                                  : mainLightColor,
                            ),
                            Icon(
                              // product.rating.rate.floor() >= 2
                              //     ? Icons.star
                              //     : Icons.star_border,
                              Icons.star,
                              size: 15.0,
                              color: Get.isDarkMode
                                  ? mainDarkColor
                                  : mainLightColor,
                            ),
                            Icon(
                              // product.rating.rate.floor() >= 1
                              //     ? Icons.star
                              //     : Icons.star_border,
                              Icons.star,
                              size: 15.0,
                              color: Get.isDarkMode
                                  ? mainDarkColor
                                  : mainLightColor,
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
                              color: Get.isDarkMode
                                  ? mainDarkColor
                                  : mainLightColor,
                              onClick: () {},
                            ),
                            horizontalSpace1(),
                            TextUtil(
                              text: '1',
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
                              color: Get.isDarkMode
                                  ? mainDarkColor
                                  : mainLightColor,
                              onClick: () {},
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
                            text: '\$10.0',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Get.isDarkMode
                                ? secondLightColor
                                : secondDarkColor,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          BuildElevatedButtonUtil(
                            child: TextUtil(
                              text: 'Remove',
                              color: Get.isDarkMode
                                  ? secondDarkColor
                                  : secondLightColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            color:
                                Get.isDarkMode ? mainDarkColor : mainLightColor,
                            size: Size(infinityWidth, 30.h),
                            onClick: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, index) => verticalSpace2(),
      ),
      bottomNavigationBar: Container(
        height: 158.h,
        width: infinityWidth,
        color: Get.isDarkMode ? secondDarkColor : secondLightColor,
        child: const BuildCartBottomAppBar(),
      ),
    );
  }
}
