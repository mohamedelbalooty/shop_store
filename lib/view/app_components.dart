import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:transparent_image/transparent_image.dart';

double infinityHeight = double.infinity;
double infinityWidth = double.infinity;

SizedBox verticalSpace1() => SizedBox(height: 5.h);

SizedBox verticalSpace2() => SizedBox(height: 10.h);

SizedBox verticalSpace3() => SizedBox(height: 15.h);

SizedBox verticalSpace4() => SizedBox(height: 20.h);

SizedBox verticalSpace5() => SizedBox(height: 30.h);

SizedBox horizontalSpace1() => SizedBox(width: 5.w);

SizedBox horizontalSpace2() => SizedBox(width: 10.w);

SizedBox horizontalSpace3() => SizedBox(width: 15.w);

SizedBox horizontalSpace4() => SizedBox(width: 20.w);

SizedBox horizontalSpace5() => SizedBox(width: 30.w);

EdgeInsets padding1() => const EdgeInsets.all(5);

EdgeInsets padding2() => const EdgeInsets.all(10);

EdgeInsets padding3() => const EdgeInsets.all(20);

EdgeInsets symmetricVerticalPadding1() =>
    EdgeInsets.symmetric(vertical: 10.h);

EdgeInsets symmetricVerticalPadding2() =>
    EdgeInsets.symmetric(vertical: 15.h);

EdgeInsets symmetricHorizontalPadding1() =>
    EdgeInsets.symmetric(horizontal: 10.w);

EdgeInsets symmetricHorizontalPadding2() =>
    EdgeInsets.symmetric(horizontal: 15.w);

class TextUtil extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? height;
  final Color color;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextDecoration? decoration;

  const TextUtil(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      this.fontFamily,
      this.decoration,
      this.color = whiteColor,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        height: height,
        decoration: decoration,
      ),
    );
  }
}

class BuildElevatedButtonUtil extends StatelessWidget {
  final Widget child;
  final Function() onClick;
  final Color color;
  final Size size;
  final double radius;

  const BuildElevatedButtonUtil(
      {Key? key,
      required this.child,
      required this.onClick,
      this.color = mainLightColor,
      this.size = const Size(150.0, 50.0),
      this.radius = 5.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: onClick,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(size),
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}

class BuildOutlinedButtonUtil extends StatelessWidget {
  final Widget child;
  final Function() onClick;
  final Color color;
  final Size size;
  final double radius;

  const BuildOutlinedButtonUtil(
      {Key? key,
      required this.child,
      required this.onClick,
      this.color = mainLightColor,
      this.size = const Size(150.0, 50.0),
      this.radius = 5.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: child,
      onPressed: onClick,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(size),
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}

class BuildTextButtonUtil extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? height;
  final Color color;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextDecoration? decoration;
  final EdgeInsets? padding;
  final Function() onClick;

  const BuildTextButtonUtil(
      {Key? key,
      required this.text,
      required this.onClick,
      this.color = whiteColor,
      this.fontSize = 16.0,
      this.fontWeight = FontWeight.normal,
      this.fontFamily,
      this.decoration,
      this.height,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: TextUtil(
        text: text,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        decoration: decoration,
        height: height,
      ),
      style: ButtonStyle(padding: MaterialStateProperty.all(padding)),
      onPressed: onClick,
    );
  }
}

class BuildImageButtonUtil extends StatelessWidget {
  final String image;
  final Function() onClick;

  const BuildImageButtonUtil(
      {Key? key, required this.image, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Image.asset(
        image,
        height: 35.r,
        width: 35.r,
        fit: BoxFit.fill,
      ),
    );
  }
}

class BuildBackgroundUtil extends StatelessWidget {
  const BuildBackgroundUtil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: infinityHeight,
      width: infinityWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/cover.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BuildLogoUtil extends StatelessWidget {
  const BuildLogoUtil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 200.w,
      decoration: BoxDecoration(
        color: whiteColor.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtil(
            text: 'Shop',
            fontSize: 35.sp,
            color: Get.isDarkMode ? mainDarkColor : mainLightColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Redressed-Regular',
          ),
          horizontalSpace1(),
          TextUtil(
            text: 'Store',
            fontSize: 35.sp,
            color: Get.isDarkMode ? secondDarkColor : secondLightColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Redressed-Regular',
          ),
        ],
      ),
    );
  }
}

class BuildCircularLoadingUtil extends StatelessWidget {
  const BuildCircularLoadingUtil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(
            Get.isDarkMode ? mainDarkColor : mainLightColor),
      ),
    );
  }
}

class RectangleShimmerLoading extends StatelessWidget {
  final double height, width, raduis;

  const RectangleShimmerLoading({
    Key? key,
    required this.height,
    required this.width,
    this.raduis = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(raduis)),
        ),
      ),
    );
  }
}

class CircleShimmerLoading extends StatelessWidget {
  final double height, width;

  const CircleShimmerLoading(
      {Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

SnackbarController showSnackBar(
    {required String title, required String message, SnackPosition? position}) {
  return Get.snackbar(
    title,
    message,
    snackPosition: position,
    backgroundColor: mainLightColor,
    borderRadius: 5.0,
    padding: symmetricHorizontalPadding1(),
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 2),
    colorText: Get.isDarkMode ? secondDarkColor : secondLightColor,
  );
}

class BuildNetworkImageUtil extends StatelessWidget {
  final String image;
  final double? height, width;

  const BuildNetworkImageUtil(
      {Key? key,
      required this.image,
        this.height,
       this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
      height: height,
      width: width,
      image: image,
      fit: BoxFit.fill,
      placeholder: kTransparentImage,
    );
  }
}
