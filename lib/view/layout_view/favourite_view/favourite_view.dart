import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/favourite_controller.dart';
import '../../app_components.dart';
import '../components.dart';

class FavouriteView extends StatelessWidget {
  FavouriteView({Key? key}) : super(key: key);
  final _favouriteController = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Material(
      color: context.theme.backgroundColor,
      child: Obx(() {
        if (_favouriteController.favouriteProducts.isEmpty) {
          return BuildEmptyUtil(
            image: 'assets/images/empty_favourite.svg',
            message: 'empty_product'.tr,
            height: 220.h,
            width: 220.w,
          );
        }
        return GridView.builder(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 2.h, bottom: 5.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isPortrait ? 2 : 3,
              mainAxisExtent: 250.h,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.w),
          itemCount: _favouriteController.favouriteProducts.length,
          itemBuilder: (_, index) {
            return BuildProductItemUtil(
              product: _favouriteController.favouriteProducts[index],
              products: _favouriteController.favouriteProducts,
            );
          },
        );
      }),
    );
  }
}
