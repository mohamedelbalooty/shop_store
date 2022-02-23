import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/layout_controller.dart';
import '../../app_components.dart';
import 'components.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = Get.find<LayoutController>();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace1(),
            BuildSearchWidget(controller: _searchController),
            verticalSpace1(),
            const BuildHomeCategoryTitle(),
            verticalSpace1(),
            SizedBox(
              height: ScreenUtil().setHeight(100),
              width: infinityWidth,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, index) => BuildHomeCategoryWidget(
                    margin: index == 0
                        ? EdgeInsetsDirectional.only(start: 15.w)
                        : EdgeInsets.zero),
                separatorBuilder: (_, index) => horizontalSpace3(),
              ),
            ),
            verticalSpace1(),
            const BuildHomeTitleWidget(text: 'Sales'),
            verticalSpace1(),
            BuildBannerWidget(controller: _controller),
            verticalSpace2(),
            BuildBannerIndicators(controller: _controller),
            verticalSpace1(),
            const BuildHomeTitleWidget(text: 'Products'),
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
                return const BuildProductItemWidget();
              },
            ),
            verticalSpace1(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
