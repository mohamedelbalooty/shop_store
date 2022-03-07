import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/home_controller.dart';
import 'package:shop_store/model/product.dart';
import '../../app_components.dart';
import '../components.dart';
import 'components.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {
  final _refreshKey = GlobalKey<RefreshIndicatorState>();
  final TextEditingController _searchController = TextEditingController();
  final _homeController = Get.find<HomeController>();


  Map<List<Product>, dynamic> data = {
    [
      Product(
        id: 1,
        title: 'yyy',
        price: 3.0,
        description: 'xxx',
        category: 'ddd',
        image: 'rrr',
        rating: Rating(count: 3, rate: 9.0),
      ),
    ]: 1,
    [
      Product(
        id: 2,
        title: 'yyy',
        price: 4.0,
        description: 'xrxx',
        category: 'ddrd',
        image: 'rrrr',
        rating: Rating(count: 3, rate: 9.0),
      ),
    ]: 2
  };
  // var a = data.keys.map((e) => e).toList();
  // var x = data.keys.map((e) => e).toList().map((e) => e.toList().map((e) => e.runtimeType).runtimeType);
  // var y = data.values.map((e) => e).toList();
  // var r = z.map((e) => e.map((e) => Product.fromMap(e)).toList()).toList();
  Map<List<Product>, dynamic> newData = {};
  // newData[for(var i in a){return i;}] =
  // newData.addAll(a);
  // var xx = data.entries.map((e1) {
  //   print(e1.toString());
  //   return e1;
  // }).toList();
  // var b = a.map((e) => e);
  // print(x);
  // print(y);
  // print('r $r');
  // print('a $a');
  // print(b);
  // print({
  //   data.entries.map((e) => e.key.toList().map((e) => e.toMap()).toList()): data.entries.map((e) => e.value)
  // });
  Map newMap = {};
  late List z;
  late List t;
  late List zz;
  late List tt;
  Map<List<Product>, dynamic> newGetData = {};
  set(){
    z = data.entries.map((e) => e.key.map((e) => e.toMap()).toList()).toList();
    t = data.entries.map((e) => e.value).toList();
    for(var i = 0; i<z.length; i++){
      newMap.addAll({
        z[i] : t[i],
      });
    }
    print(newMap);
  }
  late var ttt;
  late var yyy;
  get(){
    ttt = newMap.entries.map((e) => e.key.map((e) => Product.fromMap(e)).toList()).toList();
    yyy = newMap.entries.map((e) => e.value).toList();
    print(ttt);
    for(int i =0; i<ttt.length ; i++){
      newGetData.addAll({
        ttt[i]: yyy[i],
      });
    }
    print('newGetData => $newGetData');
  }

  // @override
  // void initState() {
  //   super.initState();
  //   set();
  //   get();
  //   print('data => $data');
  // }

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(
        () {
          if (_homeController.categoryIsLoading.value ||
              _homeController.productsIsLoading.value) {
            return const BuildHomeLoading();
          } else if (_homeController.categoryIsError.value ||
              _homeController.productsIsError.value) {
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
                  verticalSpace1(),
                  BuildSearchWidget(controller: _searchController),
                  verticalSpace1(),
                  const BuildHomeCategoryTitle(),
                  verticalSpace1(),
                  SizedBox(
                    height: 100.h,
                    width: infinityWidth,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _homeController.categories.length,
                      itemBuilder: (_, index) => BuildHomeCategoryWidget(
                          margin: index == 0
                              ? EdgeInsetsDirectional.only(start: 10.w)
                              : EdgeInsets.zero),
                      separatorBuilder: (_, index) => horizontalSpace3(),
                    ),
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
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: symmetricHorizontalPadding1(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isPortrait ? 2 : 3,
                        mainAxisExtent: 250.h,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.w),
                    itemCount: _homeController.products.length,
                    itemBuilder: (_, index) {
                      return BuildProductItemUtil(
                        products: _homeController.products,
                        product: _homeController.products[index],
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}