import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/home_controller.dart';
import 'package:shop_store/view/category_view/products_by_category_view.dart';
import '../../app_components.dart';
import '../components.dart';
import 'components.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final _refreshKey = GlobalKey<RefreshIndicatorState>();
  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(
        () {
          getLocalCategories();
          if (_homeController.categoryIsLoading.value ||
              _homeController.homeProductsIsLoading.value) {
            return const BuildHomeLoading();
          } else if (_homeController.categoryIsError.value ||
              _homeController.homeProductsIsError.value) {
            return BuildErrorUtil(
              height: 220.h,
              width: 220.w,
              image: _homeController.error.value.errorImage,
              message: _homeController.error.value.errorMessage,
              onClick: () async {
                await _homeController.refreshHomePage();
              },
            );
          }
          return BuildPlatformRefreshIndicatorUtil(
            refreshKey: _refreshKey,
            onRefresh: () {
              return _homeController.refreshHomePage();
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const BuildSearchBarWidget(),
                  verticalSpace1(),
                  BuildHomeCategoryTitle(),
                  verticalSpace1(),
                  SizedBox(
                    height: 100.h,
                    width: infinityWidth,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: getLocalCategories().length,
                      itemBuilder: (_, index) => BuildHomeCategoryWidget(
                        category: getLocalCategories()[index],
                        margin: index == 0
                            ? EdgeInsetsDirectional.only(start: 10.w)
                            : index == getLocalCategories().length - 1
                                ? EdgeInsetsDirectional.only(end: 10.w)
                                : EdgeInsets.zero,
                        onClick: () {
                          _homeController.getProductsByCategory(
                              categoryKey: _homeController.categories[index]);
                          Get.to(ProductsByCategoryView(
                              categoryName: getLocalCategories()[index].name));
                        },
                      ),
                      separatorBuilder: (_, index) => horizontalSpace3(),
                    ),
                  ),
                  verticalSpace1(),
                  BuildHomeTitleWidget(text: 'offers'.tr),
                  verticalSpace1(),
                  BuildBannerWidget(controller: _homeController),
                  verticalSpace2(),
                  GetBuilder<HomeController>(
                    builder: (context) {
                      return BuildIndicatorsUtil(
                        count: salesBanner.length,
                        activeIndex: _homeController.selectedBanner,
                      );
                    },
                  ),
                  verticalSpace1(),
                  BuildHomeTitleWidget(text: 'products'.tr),
                  verticalSpace1(),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: symmetricHorizontalPadding1(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isPortrait ? 2 : 3,
                        mainAxisExtent: 250.h,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.w),
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return BuildProductItemUtil(
                        products: _homeController.homeProducts,
                        product: _homeController.homeProducts[index],
                      );
                    },
                  ),
                  verticalSpace1(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
