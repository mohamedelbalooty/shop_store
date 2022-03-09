import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_components.dart';

class BuildProductByCategoryLoading extends StatelessWidget {
  const BuildProductByCategoryLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: symmetricHorizontalPadding1(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 180.h,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.w),
      itemCount: 8,
      itemBuilder: (_, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RectangleShimmerLoadingUtil(
              height: 120.h,
              width: infinityWidth,
              raduis: 5.0,
            ),
            verticalSpace2(),
            const RectangleShimmerLoadingUtil(
              height: 5.0,
              width: 100.0,
              raduis: 0.0,
            ),
            verticalSpace2(),
            const RectangleShimmerLoadingUtil(
              height: 5.0,
              width: 80.0,
              raduis: 0.0,
            ),
          ],
        );
      },
    );
  }
}
