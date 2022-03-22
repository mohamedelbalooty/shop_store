import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/home_controller.dart';
import 'package:shop_store/logic/controller/layout_controller.dart';
import 'package:shop_store/model/category.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';
import 'package:shop_store/utils/routes/routes.dart';
import '../../app_components.dart';

const List<String> salesBanner = [
  'https://i.ytimg.com/vi/U5Q3Du2W9a0/maxresdefault.jpg',
  'https://i.pinimg.com/736x/11/53/c8/1153c8b37ae440316de5daed32d54c24.jpg',
  'https://i.pinimg.com/originals/3a/de/2c/3ade2c45ad91861f038700497430e99c.jpg',
  'https://i.pinimg.com/originals/ce/99/0c/ce990c0668729dc4bafeb093ecb964dc.jpg'
];

class BuildSearchBarWidget extends StatelessWidget {
  const BuildSearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.backgroundColor,
      child: Padding(
        padding: symmetricHorizontalPadding1(),
        child: InkWell(
          onTap: () => Get.toNamed(RoutesPath.searchView),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            height: 45.h,
            width: infinityWidth,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: transparent,
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              border: Border.all(
                color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                width: 1.5,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  IconBroken.Search,
                  size: 24.0,
                  color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                ),
                horizontalSpace2(),
                TextUtil(
                  text: 'search'.tr,
                  color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                Icon(
                  IconBroken.Arrow___Down_2,
                  size: 24.0,
                  color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
  BuildHomeCategoryTitle({Key? key}) : super(key: key);
  final _layoutController = Get.find<LayoutController>();

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
              text: 'categories'.tr,
              fontSize: 18.sp,
              color: Get.isDarkMode ? secondLightColor : secondDarkColor,
              fontWeight: FontWeight.bold,
            ),
            InkWell(
              onTap: () => _layoutController.onItemTapped(1),
              child: TextUtil(
                text: 'all'.tr,
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
  final Category category;
  final EdgeInsetsGeometry margin;
  final Function() onClick;

  const BuildHomeCategoryWidget(
      {Key? key, required this.margin, required this.category, required this.onClick,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: 110.w,
      margin: margin,
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(color: Get.isDarkMode ? mainDarkColor : mainLightColor),
      ),
      child: InkWell(
        onTap: onClick,
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: BuildNetworkImageUtil(
            image: category.image,
            height: 100.h,
            width: 100.w,
          ),
        ),
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
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        pauseAutoPlayOnTouch: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 1500),
        autoPlayCurve: Curves.easeIn,
      ),
    );
  }
}

class BuildHomeLoading extends StatelessWidget {
  const BuildHomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: symmetricHorizontalPadding1(),
            child:
                RectangleShimmerLoadingUtil(height: 48.h, width: infinityWidth),
          ),
          verticalSpace2(),
          Padding(
            padding: symmetricHorizontalPadding1(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                RectangleShimmerLoadingUtil(
                  height: 8.0,
                  width: 100.0,
                  raduis: 0.0,
                ),
                RectangleShimmerLoadingUtil(
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
                child: RectangleShimmerLoadingUtil(
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
                RectangleShimmerLoadingUtil(
                  height: 8.0,
                  width: 100.0,
                  raduis: 0.0,
                ),
              ],
            ),
          ),
          verticalSpace2(),
          Padding(
            padding: symmetricHorizontalPadding1(),
            child: RectangleShimmerLoadingUtil(
                height: 160.h, width: infinityWidth, raduis: 5.0),
          ),
          verticalSpace2(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleShimmerLoadingUtil(
                height: 12.r,
                width: 12.r,
              ),
              horizontalSpace1(),
              CircleShimmerLoadingUtil(
                height: 12.r,
                width: 12.r,
              ),
              horizontalSpace1(),
              CircleShimmerLoadingUtil(
                height: 12.r,
                width: 12.r,
              ),
              horizontalSpace1(),
              CircleShimmerLoadingUtil(
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
                RectangleShimmerLoadingUtil(
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
                mainAxisExtent: 180.h,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.w),
            itemCount: 4,
            itemBuilder: (_, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RectangleShimmerLoadingUtil(
                    height: 120.h,
                    width: infinityWidth,
                    raduis: 5.0,
                  ),
                  verticalSpace2(),
                  const RectangleShimmerLoadingUtil(
                    height: 5.0,
                    width: 100.0,
                    raduis: 0.0,
                  ),
                  verticalSpace2(),
                  const RectangleShimmerLoadingUtil(
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
