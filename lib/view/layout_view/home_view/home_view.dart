import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../app_components.dart';
import 'components.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> salesBanner = [
    'https://i.ytimg.com/vi/U5Q3Du2W9a0/maxresdefault.jpg',
    'https://i.pinimg.com/736x/11/53/c8/1153c8b37ae440316de5daed32d54c24.jpg',
    'https://i.pinimg.com/originals/3a/de/2c/3ade2c45ad91861f038700497430e99c.jpg',
    'https://i.pinimg.com/originals/ce/99/0c/ce990c0668729dc4bafeb093ecb964dc.jpg'
  ];

  final String testImage =
      'https://i0.wp.com/psdfreedownload.com/wp-content/uploads/2017/10/Free_Fashion_-Clothes_Banner_Psd_Full_Preview.jpg';

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace1(),
          Padding(
            padding: symmetricHorizontalPadding1(),
            child: BuildSearchWidget(
              controller: _searchController,
            ),
          ),
          verticalSpace1(),
          Padding(
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
          verticalSpace1(),
          SizedBox(
            height: ScreenUtil().setHeight(100),
            width: infinityWidth,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (_, index) {
                return Container(
                  height: ScreenUtil().setHeight(100),
                  width: ScreenUtil().setWidth(100),
                  margin: index == 0
                      ? const EdgeInsetsDirectional.only(start: 15.0)
                      : EdgeInsets.zero,
                  child: BuildNetworkImageUtil(
                    image: testImage,
                    height: ScreenUtil().setHeight(100),
                    width: ScreenUtil().setWidth(100),
                  ),
                );
              },
              separatorBuilder: (_, index) => horizontalSpace3(),
            ),
          ),
          verticalSpace1(),
          Padding(
            padding: symmetricHorizontalPadding1(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextUtil(
                  text: 'Sales',
                  fontSize: 18.sp,
                  color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          verticalSpace1(),
          CarouselSlider.builder(
            itemCount: salesBanner.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) {
              return Container(
                height: ScreenUtil().setHeight(160),
                width: ScreenUtil().setWidth(250),
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
              onPageChanged: (int currentIndex, reason) {},
              initialPage: 0,
              height: ScreenUtil().setHeight(160),
              disableCenter: true,
              aspectRatio: 1.0,
              autoPlay: false,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 2200),
              pauseAutoPlayOnTouch: true,
              autoPlayCurve: Curves.easeIn,
            ),
          ),
          verticalSpace2(),
          AnimatedSmoothIndicator(
            activeIndex: 2,
            count: salesBanner.length,
            effect: SwapEffect(
              activeDotColor: Get.isDarkMode ? mainDarkColor : mainLightColor,
              dotColor: Colors.grey.shade400,
              dotHeight: 12.r,
              dotWidth: 12.r,
            ),
          ),
          verticalSpace1(),
          Padding(
            padding: symmetricHorizontalPadding1(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextUtil(
                  text: 'Products',
                  fontSize: 18.sp,
                  color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          verticalSpace1(),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: symmetricHorizontalPadding1(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isPortrait ? 2 : 3,
                mainAxisExtent: ScreenUtil().setHeight(250),
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.w),
            itemCount: 8,
            itemBuilder: (_, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? secondDarkColor : secondLightColor,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        offset: Offset(0.5, 0.5),
                        spreadRadius: 1.5),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BuildNetworkImageUtil(
                      image:
                          'https://cf.shopee.com.my/file/c8f8ef9c37b2895eb0e3ef78f5dc5544',
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
                            width: 110.w,
                            child: Text(
                              'Shoes from natural skin in body',
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
                            color:
                                Get.isDarkMode ? mainDarkColor : secondaryColor,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextUtil(
                            text: '105 SE',
                            fontSize: 16.sp,
                            color: Get.isDarkMode
                                ? secondLightColor
                                : secondDarkColor,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_border,
                                size: 15.0,
                                color: Get.isDarkMode
                                    ? mainDarkColor
                                    : mainLightColor,
                              ),
                              Icon(
                                Icons.star,
                                size: 15.0,
                                color: Get.isDarkMode
                                    ? mainDarkColor
                                    : mainLightColor,
                              ),
                              Icon(
                                Icons.star,
                                size: 15.0,
                                color: Get.isDarkMode
                                    ? mainDarkColor
                                    : mainLightColor,
                              ),
                              Icon(
                                Icons.star,
                                size: 15.0,
                                color: Get.isDarkMode
                                    ? mainDarkColor
                                    : mainLightColor,
                              ),
                              Icon(
                                Icons.star,
                                size: 15.0,
                                color: Get.isDarkMode
                                    ? mainDarkColor
                                    : mainLightColor,
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
                            color: Get.isDarkMode
                                ? secondDarkColor
                                : secondLightColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
