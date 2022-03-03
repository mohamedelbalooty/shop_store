import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/home_controller.dart';
import 'package:shop_store/model/product.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../app_components.dart';

const List<String> salesBanner = [
  'https://i.ytimg.com/vi/U5Q3Du2W9a0/maxresdefault.jpg',
  'https://i.pinimg.com/736x/11/53/c8/1153c8b37ae440316de5daed32d54c24.jpg',
  'https://i.pinimg.com/originals/3a/de/2c/3ade2c45ad91861f038700497430e99c.jpg',
  'https://i.pinimg.com/originals/ce/99/0c/ce990c0668729dc4bafeb093ecb964dc.jpg'
];

class BuildHomeLoading extends StatelessWidget {
  const BuildHomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace3(),
          Padding(
            padding: symmetricHorizontalPadding1(),
            child: RectangleShimmerLoading(height: 45.h, width: infinityWidth),
          ),
          verticalSpace2(),
          Padding(
            padding: symmetricHorizontalPadding1(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                RectangleShimmerLoading(
                  height: 8.0,
                  width: 100.0,
                  raduis: 0.0,
                ),
                RectangleShimmerLoading(
                  height: 8.0,
                  width: 80.0,
                  raduis: 0.0,
                ),
              ],
            ),
          ),
          verticalSpace2(),
          SizedBox(
            height: 100.h,
            width: infinityWidth,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (_, index) => Padding(
                padding: index == 0
                    ? EdgeInsetsDirectional.only(start: 10.w)
                    : EdgeInsets.zero,
                child: RectangleShimmerLoading(
                  height: 100.h,
                  width: 100.w,
                ),
              ),
              separatorBuilder: (_, index) => horizontalSpace3(),
            ),
          ),
          verticalSpace2(),
          Padding(
            padding: symmetricHorizontalPadding1(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                RectangleShimmerLoading(
                  height: 8.0,
                  width: 100.0,
                  raduis: 0.0,
                ),
              ],
            ),
          ),
          verticalSpace2(),
          RectangleShimmerLoading(height: 160.h, width: 300.w, raduis: 5.0),
          verticalSpace2(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleShimmerLoading(
                height: 12.r,
                width: 12.r,
              ),horizontalSpace1(),
              CircleShimmerLoading(
                height: 12.r,
                width: 12.r,
              ),horizontalSpace1(),CircleShimmerLoading(
                height: 12.r,
                width: 12.r,
              ),horizontalSpace1(),
              CircleShimmerLoading(
                height: 12.r,
                width: 12.r,
              ),
            ],
          ),
          verticalSpace2(),
          Padding(
            padding: symmetricHorizontalPadding1(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                RectangleShimmerLoading(
                  height: 8.0,
                  width: 100.0,
                  raduis: 0.0,
                ),
              ],
            ),
          ),
          verticalSpace2(),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: symmetricHorizontalPadding1(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 200.h,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.w),
            itemCount: 4,
            itemBuilder: (_, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RectangleShimmerLoading(
                    height: 120.h,
                    width: infinityWidth,
                    raduis: 5.0,
                  ),
                  verticalSpace2(),
                  const RectangleShimmerLoading(
                    height: 5.0,
                    width: 100.0,
                    raduis: 0.0,
                  ),
                  verticalSpace2(),
                  const RectangleShimmerLoading(
                    height: 5.0,
                    width: 80.0,
                    raduis: 0.0,
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

class BuildSearchWidget extends StatelessWidget {
  final TextEditingController controller;

  const BuildSearchWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: symmetricHorizontalPadding1(),
      child: TextField(
        controller: controller,
        onChanged: (String? value) {},
        cursorColor: Get.isDarkMode ? mainDarkColor : mainLightColor,
        style: TextStyle(
          color: Get.isDarkMode ? mainDarkColor : mainLightColor,
          fontSize: 14.sp,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
          label: const Text('Search'),
          labelStyle: TextStyle(
              color: Get.isDarkMode ? mainDarkColor : mainLightColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              height: 2),
          prefixIcon: Icon(
            IconBroken.Search,
            size: 24.0,
            color: Get.isDarkMode ? mainDarkColor : mainLightColor,
          ),
          border: _border(),
          enabledBorder: _border(),
          focusedBorder: _border(),
          errorBorder: _border(),
          focusedErrorBorder: _border(),
        ),
      ),
    );
  }

  OutlineInputBorder _border() => OutlineInputBorder(
        borderSide: BorderSide(
          color: Get.isDarkMode ? mainDarkColor : mainLightColor,
          width: 1.5,
        ),
      );
}

class BuildHomeTitleWidget extends StatelessWidget {
  final String text;

  const BuildHomeTitleWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.backgroundColor,
      child: Padding(
        padding: symmetricHorizontalPadding1(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextUtil(
              text: text,
              fontSize: 18.sp,
              color: Get.isDarkMode ? secondLightColor : secondDarkColor,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}

class BuildHomeCategoryTitle extends StatelessWidget {
  const BuildHomeCategoryTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.backgroundColor,
      child: Padding(
        padding: symmetricHorizontalPadding1(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textBaseline: TextBaseline.alphabetic,
          children: [
            TextUtil(
              text: 'Categories',
              fontSize: 18.sp,
              color: Get.isDarkMode ? secondLightColor : secondDarkColor,
              fontWeight: FontWeight.bold,
            ),
            InkWell(
              onTap: () {},
              child: TextUtil(
                text: 'See all',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? secondLightColor : secondDarkColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildHomeCategoryWidget extends StatelessWidget {
  final EdgeInsetsGeometry margin;

  const BuildHomeCategoryWidget({Key? key, required this.margin})
      : super(key: key);

  final String testImage =
      'https://i0.wp.com/psdfreedownload.com/wp-content/uploads/2017/10/Free_Fashion_-Clothes_Banner_Psd_Full_Preview.jpg';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      margin: margin,
      child: BuildNetworkImageUtil(
        image: testImage,
        height: ScreenUtil().setHeight(100),
        width: ScreenUtil().setWidth(100),
      ),
    );
  }
}

class BuildBannerWidget extends StatelessWidget {
  final HomeController controller;

  const BuildBannerWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: salesBanner.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) {
        return Container(
          height: 160.h,
          width: 250.w,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            child: BuildNetworkImageUtil(
              height: ScreenUtil().setHeight(160),
              width: ScreenUtil().setWidth(250),
              image: salesBanner[index],
            ),
          ),
        );
      },
      options: CarouselOptions(
        onPageChanged: (int currentIndex, reason) {
          controller.onBannerChanged(currentIndex);
        },
        initialPage: controller.selectedBanner,
        height: ScreenUtil().setHeight(160),
        aspectRatio: 1.0,
        disableCenter: true,
        autoPlay: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        pauseAutoPlayOnTouch: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 2200),
        autoPlayCurve: Curves.easeIn,
      ),
    );
  }
}

class BuildBannerIndicators extends StatelessWidget {
  final HomeController controller;

  const BuildBannerIndicators({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (context) {
      return AnimatedSmoothIndicator(
        activeIndex: controller.selectedBanner,
        count: salesBanner.length,
        effect: SwapEffect(
          activeDotColor: Get.isDarkMode ? mainDarkColor : mainLightColor,
          dotColor: Get.isDarkMode ? whiteColor : Colors.grey.shade400,
          dotHeight: 12.r,
          dotWidth: 12.r,
        ),
      );
    });
  }
}

class BuildProductItemWidget extends StatelessWidget {
  final Product product;
  const BuildProductItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.backgroundColor,
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
              image:
                  product.image,
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
                        color:
                            Get.isDarkMode ? secondLightColor : secondDarkColor,
                        fontSize: 14.sp,
                        height: 1.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  horizontalSpace1(),
                  IconButton(
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
                    color: Get.isDarkMode ? mainDarkColor : secondaryColor,
                    onPressed: () {},
                  ),
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
                    text: '${product.price} \$',
                    fontSize: 16.sp,
                    color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        product.rating.rate.floor() >= 5 ? Icons.star : Icons.star_border,
                        size: 15.0,
                        color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                      ),
                      Icon(
                        product.rating.rate.floor() >= 4 ? Icons.star : Icons.star_border,
                        size: 15.0,
                        color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                      ),
                      Icon(
                        product.rating.rate.floor() >= 3 ? Icons.star : Icons.star_border,
                        size: 15.0,
                        color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                      ),
                      Icon(
                        product.rating.rate.floor() >= 2 ? Icons.star : Icons.star_border,
                        size: 15.0,
                        color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                      ),
                      Icon(
                        product.rating.rate.floor() >= 1 ? Icons.star : Icons.star_border,
                        size: 15.0,
                        color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50.h,
                width: infinityWidth,
                color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                child: Center(
                  child: TextUtil(
                    text: 'Add to cart',
                    fontSize: 16.sp,
                    color: Get.isDarkMode ? secondDarkColor : secondLightColor,
                    fontWeight: FontWeight.w500,
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
