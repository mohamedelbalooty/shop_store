import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_store/logic/controller/cart_controller.dart';
import 'package:shop_store/logic/controller/favourite_controller.dart';
import 'package:shop_store/logic/controller/product_controller.dart';
import 'package:shop_store/model/product.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';
import 'package:shop_store/utils/routes/routes.dart';
import '../app_components.dart';

class BuildImageSlider extends StatelessWidget {
  final String image;
  final Function(int, CarouselPageChangedReason) onPageChanged;

  const BuildImageSlider({Key? key, required this.onPageChanged, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageHeight = MediaQuery.of(context).size.height * 0.55;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Get.isDarkMode ? mainDarkColor : mainLightColor,
            width: 3.0,
          ),
        ),
      ),
      child: CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (_, index, currentIndex) {
          return Image.network(
            image,
            fit: BoxFit.fill,
            height: imageHeight,
            width: infinityWidth,
          );
        },
        options: CarouselOptions(
          height: imageHeight,
          initialPage: 0,
          autoPlay: true,
          viewportFraction: 1,
          aspectRatio: 1,
          autoPlayAnimationDuration: const Duration(milliseconds: 2000),
          onPageChanged: onPageChanged,
        ),
      ),
    );
  }
}

class BuildSizeWidget extends StatefulWidget {
  const BuildSizeWidget({Key? key}) : super(key: key);

  @override
  _BuildSizeWidgetState createState() => _BuildSizeWidgetState();
}

class _BuildSizeWidgetState extends State<BuildSizeWidget> {
  String selectedSize = 'XL';
  final List<String> entries = <String>['XL', 'XXL', 'XXXL'];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextUtil(
          text: 'Sizes',
          color: Get.isDarkMode ? secondLightColor : secondDarkColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        horizontalSpace3(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextUtil(
                  text: selectedSize,
                  color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  height: 2.3,
                ),
                BuildPopUpMenuButtonUtil(
                  icon: Icon(
                    IconBroken.Arrow___Down_2,
                    color: Get.isDarkMode ? mainDarkColor : secondaryColor,
                    size: 16.0,
                  ),
                  entries: entries,
                  padding: const EdgeInsets.only(top: 5.0),
                  onSelected: (String selectedEntry) {
                    setState(() {
                      selectedSize = selectedEntry;
                    });
                  },
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(0, -5),
              child: Container(
                height: 2,
                width: 30.0,
                color: Get.isDarkMode ? mainDarkColor : mainLightColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BuildColorPickerItem extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const BuildColorPickerItem(
      {Key? key, required this.color, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: color, width: 2.0) : null,
      ),
      child: Container(
        height: 22.w,
        width: 22.w,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class BuildColorPickerWidget extends StatefulWidget {
  const BuildColorPickerWidget({Key? key}) : super(key: key);

  @override
  State<BuildColorPickerWidget> createState() => _BuildColorPickerWidgetState();
}

class _BuildColorPickerWidgetState extends State<BuildColorPickerWidget> {
  final List<Color> colors = <Color>[
    Colors.redAccent,
    Colors.brown,
    Colors.blueAccent,
    Colors.orangeAccent,
    Colors.greenAccent
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SizedBox(
        height: 22.w,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: BuildColorPickerItem(
                color: colors[index],
                isSelected: selectedIndex == index,
              ),
            );
          },
          separatorBuilder: (_, index) => SizedBox(
            width: 0.w,
          ),
        ),
      ),
    );
  }
}

class BuildProductAppBarWidget extends StatelessWidget {
  final String image;
  final ProductController controller;

  const BuildProductAppBarWidget({Key? key, required this.controller, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      automaticallyImplyLeading: false,
      backgroundColor: Get.isDarkMode ? secondDarkColor : secondLightColor,
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
          BuildCircleButtonUtil(
            child: Icon(
              IconBroken.Bag_2,
              size: 24.0,
              color: Get.isDarkMode ? secondDarkColor : secondLightColor,
            ),
            size: Size(35.w, 35.w),
            color: Get.isDarkMode ? mainDarkColor : mainLightColor,
            onClick: () => Get.toNamed(RoutesPath.cartView),
          ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: BuildImageSlider(
          image: image,
          onPageChanged: (int index, CarouselPageChangedReason reason) {
            controller.onProductImageChanged(index);
          },
        ),
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.55,
    );
  }
}

class BuildProductDetailsWidget extends StatelessWidget {
  final ProductController controller;
  final Product product;
  final List<Product> products;

  BuildProductDetailsWidget({
    Key? key,
    required this.controller,
    required this.product,
    required this.products,
  }) : super(key: key);

  final _favouriteController = Get.find<FavouriteController>();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: symmetricHorizontalPadding2(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace2(),
            GetBuilder<ProductController>(
              builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildIndicatorsUtil(
                      count: 3,
                      activeIndex: controller.selectedIndex,
                    ),
                  ],
                );
              },
            ),
            verticalSpace3(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextUtil(
                    text: product.title,
                    color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    textOverflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                horizontalSpace3(),
                Obx(() {
                  return BuildIconButtonUtil(
                    icon: IconBroken.Heart,
                    color:
                        _favouriteController.isFavourite(productId: product.id)
                            ? redColor
                            : blackColor,
                    size: 26.0,
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onClick: () {
                      _favouriteController.addToFavourite(
                          products: products, productId: product.id);
                    },
                  );
                }),
              ],
            ),
            const BuildSizeWidget(),
            Row(
              children: [
                TextUtil(
                  text: 'Colors',
                  color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                horizontalSpace3(),
                const BuildColorPickerWidget(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      product.rating.rate.floor() >= 5
                          ? Icons.star
                          : Icons.star_border,
                      size: 16.0,
                      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                    ),
                    Icon(
                      product.rating.rate.floor() >= 4
                          ? Icons.star
                          : Icons.star_border,
                      size: 16.0,
                      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                    ),
                    Icon(
                      product.rating.rate.floor() >= 3
                          ? Icons.star
                          : Icons.star_border,
                      size: 16.0,
                      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                    ),
                    Icon(
                      product.rating.rate.floor() >= 2
                          ? Icons.star
                          : Icons.star_border,
                      size: 16.0,
                      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                    ),
                    Icon(
                      product.rating.rate.floor() >= 1
                          ? Icons.star
                          : Icons.star_border,
                      size: 16.0,
                      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                    ),
                  ],
                ),
              ],
            ),
            TextUtil(
              text: 'Description',
              color: Get.isDarkMode ? secondLightColor : secondDarkColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            verticalSpace1(),
            ReadMoreText(
              product.description,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(
                color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              lessStyle: TextStyle(
                color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              style: TextStyle(
                color: Get.isDarkMode ? secondLightColor : Colors.black54,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

class BuildProductViewBottomAppBar extends StatelessWidget {
  final Product product;

  BuildProductViewBottomAppBar({Key? key, required this.product})
      : super(key: key);
  final _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: infinityWidth,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? secondDarkColor : secondLightColor,
        boxShadow: [
          BoxShadow(
            color: Get.isDarkMode ? Colors.white12 : Colors.black12,
            blurRadius: 3,
            offset: const Offset(0.0, -1.0),
            spreadRadius: 5,
          ),
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
                  text: 'Price',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                ),
                TextUtil(
                  text: '\$${product.price}',
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
                  text: 'Add to cart',
                  color: Get.isDarkMode ? secondDarkColor : secondLightColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                size: Size(50.w, 45.h),
                onClick: () {
                  _cartController.addProductToCart(product: product);
                  Get.offNamed(RoutesPath.cartView);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
