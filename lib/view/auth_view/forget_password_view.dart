import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/auth_controller.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/validation_strings.dart';
import '../app_components.dart';
import 'components.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final _controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BuildBackgroundUtil(),
            Container(
              height: infinityHeight,
              width: infinityWidth,
              color: blackColor.withOpacity(0.2),
              child: SingleChildScrollView(
                child: Form(
                  key: _globalKey,
                  child: Padding(
                    padding: symmetricHorizontalPadding2(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                height: 45.r,
                                width: 45.r,
                                margin: padding2(),
                                decoration: BoxDecoration(
                                  color: whiteColor.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.close,
                                  color: mainLightColor,
                                  size: 30.sp,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isPortrait ? 55.h : 20.h),
                        const BuildLogoUtil(),
                        verticalSpace3(),
                        Text(
                          'recover_password'.tr,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: whiteColor,
                            height: 2.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace3(),
                        BuildUnderlinedTextFormField(
                          hint: 'email'.tr,
                          controller: _email,
                          validate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'email_verify'.tr;
                            } else if (!RegExp(validationEmail)
                                .hasMatch(value)) {
                              return 'valid_email_verify'.tr;
                            }
                            return null;
                          },
                        ),
                        verticalSpace5(),
                        GetBuilder<AuthController>(builder: (_) {
                          return BuildElevatedButtonUtil(
                            child: !_controller.isLoading
                                ? TextUtil(
                                    text: 'send'.tr.toUpperCase(),
                                    fontSize: 20.sp,
                                    color: whiteColor,
                                    fontWeight: FontWeight.bold,
                                  )
                                : const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        whiteColor),
                                  ),
                            color: mainLightColor,
                            radius: 0.0,
                            size: Size(infinityWidth, 50.h),
                            onClick: () async {
                              if (_globalKey.currentState!.validate()) {
                                await _controller.forgetPassword(
                                    email: _email.text.trim());
                                FocusScope.of(context).unfocus();
                              }
                            },
                          );
                        }),
                        verticalSpace3(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }
}
