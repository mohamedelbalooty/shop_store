import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';
import 'package:shop_store/utils/routes/routes.dart';
import 'package:shop_store/view/app_components.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            backgroundColor:
                Get.isDarkMode ? secondDarkColor : secondLightColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildCircleButtonUtil(
                  child: Icon(
                    IconBroken.Arrow___Left,
                    size: 24.0,
                    color: Get.isDarkMode ? secondDarkColor : secondLightColor,
                  ),
                  size: Size(35.w, 35.w),
                  color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                  onClick: () => Get.back(),
                ),
                Badge(
                  badgeColor: Get.isDarkMode ? mainDarkColor : mainLightColor,
                  position: BadgePosition.topEnd(
                    end: 1,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: TextUtil(
                    text: '9',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  child: BuildCircleButtonUtil(
                    child: Icon(
                      IconBroken.Bag_2,
                      size: 24.0,
                      color:
                          Get.isDarkMode ? secondDarkColor : secondLightColor,
                    ),
                    size: Size(35.w, 35.w),
                    color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                    onClick: () => Get.toNamed(RoutesPath.cartView),
                  ),
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                      width: 3.0,
                    ),
                  ),
                ),
                child: const BuildNetworkImageUtil(
                  image:
                      'https://cdn.shopify.com/s/files/1/0266/6276/4597/products/300865964DARK-PINK_2_1024x1024.jpg?v=1637582857',
                ),
              ),
            ),
            // expandedHeight: 350.h,
            expandedHeight: MediaQuery.of(context).size.height * 0.6,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: symmetricHorizontalPadding2(),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextUtil(
                              text:
                                  'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
                              color: Get.isDarkMode
                                  ? secondLightColor
                                  : secondDarkColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              textOverflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextUtil(
                                  text: '4',
                                  color: Get.isDarkMode
                                      ? mainDarkColor
                                      : const Color(0xFF094675),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  // height: 1.3,
                                ),
                                horizontalSpace3(),
                                Icon(
                                  // product.rating.rate.floor() >= 5
                                  //     ? Icons.star
                                  //     : Icons.star_border,
                                  Icons.star,
                                  size: 16.0,
                                  color: Get.isDarkMode
                                      ? mainDarkColor
                                      : mainLightColor,
                                ),
                                Icon(
                                  // product.rating.rate.floor() >= 4
                                  //     ? Icons.star
                                  //     : Icons.star_border,
                                  Icons.star,
                                  size: 16.0,
                                  color: Get.isDarkMode
                                      ? mainDarkColor
                                      : mainLightColor,
                                ),
                                Icon(
                                  // product.rating.rate.floor() >= 3
                                  //     ? Icons.star
                                  //     : Icons.star_border,
                                  Icons.star,
                                  size: 16.0,
                                  color: Get.isDarkMode
                                      ? mainDarkColor
                                      : mainLightColor,
                                ),
                                Icon(
                                  // product.rating.rate.floor() >= 2
                                  //     ? Icons.star
                                  //     : Icons.star_border,
                                  Icons.star,
                                  size: 16.0,
                                  color: Get.isDarkMode
                                      ? mainDarkColor
                                      : mainLightColor,
                                ),
                                Icon(
                                  // product.rating.rate.floor() >= 1
                                  //     ? Icons.star
                                  //     : Icons.star_border,
                                  Icons.star,
                                  size: 16.0,
                                  color: Get.isDarkMode
                                      ? mainDarkColor
                                      : mainLightColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      horizontalSpace4(),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: BuildCircleButtonUtil(
                          child: Icon(
                            IconBroken.Heart,
                            size: 24.0,
                            color: Get.isDarkMode
                                ? secondDarkColor
                                : secondLightColor,
                          ),
                          size: Size(35.w, 35.w),
                          color: redColor,
                          onClick: () => Get.toNamed(RoutesPath.cartView),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace2(),
                  TextUtil(
                    text:
                        'The following animations show how app bars with different configurations behave when a user scrolls up and then down again. The following animations show how app bars with different configurations behave when a user scrolls up and then down again. The following animations show how app bars with different configurations behave when a user scrolls up and then down again.',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? secondLightColor : Colors.black54,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60.h,
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
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtil(
                    text: 'Total price',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                  ),
                  TextUtil(
                    text: '\$44.0',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                  ),
                ],
              ),
              horizontalSpace4(),
              Expanded(
                child: BuildElevatedButtonUtil(
                  child: TextUtil(
                    text: 'Pay now',
                    color: Get.isDarkMode ? secondDarkColor : secondLightColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                  size: Size(50.w, 45.h),
                  onClick: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
