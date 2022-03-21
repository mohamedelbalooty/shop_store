import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/search_controller.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';
import 'package:shop_store/view/layout_view/components.dart';
import '../app_components.dart';
import 'components.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _searchController = Get.find<SearchController>();
  final TextEditingController _searchKeyController = TextEditingController();
  final List<String> _searchOptions = ['price'.tr, 'name'.tr];

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: buildAppBarUtil(title: 'search_about_products'.tr),
      body: GetBuilder<SearchController>(
        builder: (context) {
          return Column(
            children: [
              BuildSearchWidget(
                controller: _searchKeyController,
                searchIcon: _searchKeyController.text.isEmpty
                    ? Icon(
                        IconBroken.Search,
                        size: 24.0,
                        color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                      )
                    : BuildIconButtonUtil(
                        icon: Icons.clear,
                        size: 24.0,
                        color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                        onClick: () {
                          _searchKeyController.clear();
                          _searchController.onClearSearchKey();
                        },
                      ),
                searchOptions: BuildPopUpMenuButtonUtil(
                  entries: _searchOptions,
                  icon: Icon(
                    IconBroken.Arrow___Down_2,
                    size: 24.0,
                    color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                  ),
                  padding: const EdgeInsets.only(top: 5.0),
                  onSelected: (String value) {
                    _searchController.onChangeSearchOption(value);
                  },
                ),
                onChanged: (String value) {
                  if (value.isEmpty) {
                    _searchController.onClearSearchKey();
                  } else {
                    !_searchController.isSearchingByPrice
                        ? _searchController.searchQueryByName(value)
                        : _searchController.searchQueryByPrice(value);
                  }
                },
              ),
              verticalSpace1(),
              _searchController.displayedProducts.isEmpty
                  ? Expanded(
                      child: BuildEmptyUtil(
                        message: 'empty_product'.tr,
                        image: 'assets/images/empty_favourite.svg',
                      ),
                    )
                  : Expanded(
                      child: GridView.builder(
                        padding: symmetricHorizontalPadding1(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isPortrait ? 2 : 3,
                            mainAxisExtent: 250.h,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.w),
                        itemCount: _searchController.displayedProducts.length,
                        itemBuilder: (_, index) {
                          return BuildProductItemUtil(
                            products: _searchController.displayedProducts,
                            product: _searchController.displayedProducts[index],
                          );
                        },
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchKeyController.dispose();
    super.dispose();
  }
}
