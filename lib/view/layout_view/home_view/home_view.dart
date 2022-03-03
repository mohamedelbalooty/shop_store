import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/home_controller.dart';
import '../../app_components.dart';
import 'components.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();
  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(
        () {
          print(_homeController.categoryIsLoading.value);
          print(_homeController.productsIsLoading.value);
          if (_homeController.categoryIsLoading.value ||
              _homeController.productsIsLoading.value) {
            return const BuildHomeLoading();
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace1(),
                  BuildSearchWidget(controller: _searchController),
                  verticalSpace1(),
                  const BuildHomeCategoryTitle(),
                  verticalSpace1(),
                  SizedBox(
                    height: 100.h,
                    width: infinityWidth,
                    child: !_homeController.categoryIsError.value
                        ? ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: _homeController.categories.length,
                            itemBuilder: (_, index) => BuildHomeCategoryWidget(
                                margin: index == 0
                                    ? EdgeInsetsDirectional.only(start: 10.w)
                                    : EdgeInsets.zero),
                            separatorBuilder: (_, index) => horizontalSpace3(),
                          )
                        : const Center(
                            child: Text(
                            'ERROR',
                            style: TextStyle(color: Colors.red),
                          )),
                  ),
                  verticalSpace1(),
                  const BuildHomeTitleWidget(text: 'Sales'),
                  verticalSpace1(),
                  BuildBannerWidget(controller: _homeController),
                  verticalSpace2(),
                  BuildBannerIndicators(controller: _homeController),
                  verticalSpace1(),
                  const BuildHomeTitleWidget(text: 'Products'),
                  verticalSpace1(),
                  !_homeController.productsIsError.value
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: symmetricHorizontalPadding1(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: isPortrait ? 2 : 3,
                                  mainAxisExtent: 250.h,
                                  crossAxisSpacing: 10.w,
                                  mainAxisSpacing: 10.w),
                          itemCount: _homeController.products.length,
                          itemBuilder: (_, index) {
                            return BuildProductItemWidget(product: _homeController.products[index],);
                          },
                        )
                      : const Center(
                          child: Text(
                          'ERROR',
                          style: TextStyle(color: Colors.red),
                        )),
                  verticalSpace1(),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
