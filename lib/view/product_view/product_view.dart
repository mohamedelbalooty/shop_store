import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/product_controller.dart';
import 'package:shop_store/model/product.dart';
import 'components.dart';

class ProductView extends StatelessWidget {
  final Product product;
  final List<Product> products;

  ProductView({Key? key, required this.product, required this.products})
      : super(key: key);
  final _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            BuildProductAppBarWidget(
              controller: _productController,
              image: product.image,
            ),
            BuildProductDetailsWidget(
              controller: _productController,
              product: product,
              products: products,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BuildProductViewBottomAppBar(
        product: product,
      ),
    );
  }
}
