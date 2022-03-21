import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/cart_controller.dart';
import 'package:shop_store/logic/controller/favourite_controller.dart';
import 'package:shop_store/logic/controller/layout_controller.dart';
import 'package:shop_store/model/category.dart';
import 'package:shop_store/model/product.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';
import 'package:shop_store/utils/routes/routes.dart';
import 'package:shop_store/view/product_view/product_view.dart';
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
      currentIndex: controller.selectedScreen.value,
      selectedItemColor: controller.selectedItemColor,
      unselectedItemColor: controller.unselectedItemColor,
    );
  }
}

class BuildAppBarCartButton extends StatelessWidget {
  BuildAppBarCartButton({Key? key}) : super(key: key);
  final _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.backgroundColor,
      child: Obx(
        () {
          return Badge(
            badgeColor: Get.isDarkMode ? mainDarkColor : mainLightColor,
            position: BadgePosition.topEnd(top: 0, end: 3),
            animationDuration: const Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: TextUtil(
              text: _cartController.productsQuantity.toString(),
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
            child: IconButton(
              icon: const Icon(IconBroken.Bag_2),
              color: Get.isDarkMode ? mainDarkColor : secondaryColor,
              iconSize: 32.0,
              onPressed: () => Get.toNamed(RoutesPath.cartView),
            ),
          );
        },
      ),
    );
  }
}

class BuildProductItemUtil extends StatelessWidget {
  final Product product;
  final List<Product> products;

  const BuildProductItemUtil(
      {Key? key, required this.product, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _favouriteController = Get.find<FavouriteController>();
    final _cartController = Get.find<CartController>();
    return Material(
      color: context.theme.backgroundColor,
      child: GestureDetector(
        onTap: () => Get.to(ProductView(product: product, products: products)),
        child: Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BuildNetworkImageUtil(
                image: product.image,
                height: 120.h,
                width: infinityWidth,
              ),
              verticalSpace1(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: 120.0,
                      child: Text(
                        product.title,
                        style: TextStyle(
                          color: Get.isDarkMode
                              ? secondLightColor
                              : secondDarkColor,
                          fontSize: 14.sp,
                          height: 1.5,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    horizontalSpace1(),
                    Obx(() {
                      return IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        splashColor: transparent,
                        hoverColor: transparent,
                        focusColor: transparent,
                        highlightColor: transparent,
                        icon: const Icon(
                          IconBroken.Heart,
                          size: 26.0,
                        ),
                        color: _favouriteController.isFavourite(
                                productId: product.id)
                            ? redColor
                            : secondaryColor,
                        onPressed: () {
                          _favouriteController.addToFavourite(
                              products: products, productId: product.id);
                        },
                      );
                    }),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextUtil(
                      text: '\$${product.price}',
                      fontSize: 16.sp,
                      color:
                          Get.isDarkMode ? secondLightColor : secondDarkColor,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          product.rating.rate.floor() >= 5
                              ? Icons.star
                              : Icons.star_border,
                          size: 15.0,
                          color:
                              Get.isDarkMode ? mainDarkColor : mainLightColor,
                        ),
                        Icon(
                          product.rating.rate.floor() >= 4
                              ? Icons.star
                              : Icons.star_border,
                          size: 15.0,
                          color:
                              Get.isDarkMode ? mainDarkColor : mainLightColor,
                        ),
                        Icon(
                          product.rating.rate.floor() >= 3
                              ? Icons.star
                              : Icons.star_border,
                          size: 15.0,
                          color:
                              Get.isDarkMode ? mainDarkColor : mainLightColor,
                        ),
                        Icon(
                          product.rating.rate.floor() >= 2
                              ? Icons.star
                              : Icons.star_border,
                          size: 15.0,
                          color:
                              Get.isDarkMode ? mainDarkColor : mainLightColor,
                        ),
                        Icon(
                          product.rating.rate.floor() >= 1
                              ? Icons.star
                              : Icons.star_border,
                          size: 15.0,
                          color:
                              Get.isDarkMode ? mainDarkColor : mainLightColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  _cartController.addProductToCart(product: product);
                  showSnackBar(
                    title: 'cart_details'.tr,
                    message: 'added_product_successfully'.tr,
                    position: SnackPosition.BOTTOM,
                  );
                },
                child: Container(
                  height: 50.h,
                  width: infinityWidth,
                  color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                  child: Center(
                    child: TextUtil(
                      text: 'add_to_cart'.tr,
                      fontSize: 16.sp,
                      color:
                          Get.isDarkMode ? secondDarkColor : secondLightColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Category> getLocalCategories(){
  return [
    Category(
        id: 1,
        name: 'electronic'.tr,
        image:
        'https://cff2.earth.com/uploads/2020/09/01004645/shutterstock_2850401842-960x640.jpg'),
    Category(
        id: 2,
        name: 'jewelry'.tr,
        image:
        'https://i.pinimg.com/736x/3c/65/a8/3c65a84b72e5b8d265df4b98a453faa5.jpg'),
    Category(
        id: 3,
        name: 'men_clothes'.tr,
        image:
        'https://i.pinimg.com/736x/53/b8/ab/53b8abcfc1801dd798ec1ae0e0d5c01b--wallpaper-desktop-desktop-backgrounds.jpg'),
    Category(
        id: 4,
        name: 'women_clothes'.tr,
        image:
        'https://data.whicdn.com/images/334050263/original.jpg?t=1565743455'),
  ];
}