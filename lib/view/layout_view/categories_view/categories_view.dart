import 'package:flutter/material.dart';
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
    return Material(
      color: context.theme.backgroundColor,
      child: ListView.separated(
        padding: symmetricHorizontalPadding1(),
        itemCount: categories.length,
        itemBuilder: (_, index) {
          return BuildCategoryItem(
            category: categories[index],
            onClick: () {
              _homeController.getProductsByCategory(
                  categoryKey: _homeController.categories[index]);
              Get.to(
                  ProductsByCategoryView(categoryName: categories[index].name));
            },
          );
        },
        separatorBuilder: (_, index) => verticalSpace3(),
      ),
    );
  }
}
