import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/home_controller.dart';
import 'package:shop_store/view/app_components.dart';
import 'package:shop_store/view/layout_view/components.dart';
import 'components.dart';

class ProductsByCategoryView extends StatelessWidget {
  final String categoryName;

  ProductsByCategoryView({Key? key, required this.categoryName})
      : super(key: key);

  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: buildAppBarUtil(title: '$categoryName products'),
      body: Obx(
        () {
          if (_homeController.productsByCategoryIsLoading.value) {
            return const BuildProductByCategoryLoading();
          }
          return GridView.builder(
            padding: symmetricHorizontalPadding1(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isPortrait ? 2 : 3,
                mainAxisExtent: 250.h,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.w),
            itemCount: _homeController.productsByCategory.length,
            itemBuilder: (_, index) {
              return BuildProductItemUtil(
                products: _homeController.productsByCategory,
                product: _homeController.productsByCategory[index],
              );
            },
          );
        },
      ),
    );
  }
}
