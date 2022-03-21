import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/home_controller.dart';
import 'package:shop_store/view/app_components.dart';
import 'package:shop_store/view/category_view/products_by_category_view.dart';
import '../components.dart';
import 'components.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({Key? key}) : super(key: key);
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    getLocalCategories();
    return Material(
      color: context.theme.backgroundColor,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 2.h, bottom: 5.h),
        itemCount: getLocalCategories().length,
        itemBuilder: (_, index) {
          return BuildCategoryItem(
            category: getLocalCategories()[index],
            onClick: () {
              _homeController.getProductsByCategory(
                  categoryKey: _homeController.categories[index]);
              Get.to(
                  ProductsByCategoryView(categoryName: getLocalCategories()[index].name));
            },
          );
        },
        separatorBuilder: (_, index) => verticalSpace3(),
      ),
    );
  }
}
