import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/auth_controller.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/view/app_components.dart';

class VerificationView extends StatefulWidget {
  final String userName;

  const VerificationView({Key? key, required this.userName}) : super(key: key);

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final _authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    _authController.emailVerify(widget.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextUtil(
          text: 'verify_about_email'.tr,
          fontSize: 20.sp,
          color: Get.isDarkMode ? secondLightColor : secondaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: SvgPicture.asset(
          'assets/images/verify.svg',
          height: 250.h,
          width: 250.w,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
