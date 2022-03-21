import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/auth_controller.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/routes/routes.dart';
import 'package:shop_store/utils/validation_strings.dart';
import '../app_components.dart';
import 'components.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
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
                        SizedBox(height: isPortrait ? 100.h : 20.h),
                        const BuildLogoUtil(),
                        BuildUnderlinedTextFormField(
                          hint: 'username'.tr,
                          controller: _userName,
                          validate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'username_verify'.tr;
                            } else if (value.toString().trim().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'valid_username_verify'.tr;
                            }
                            return null;
                          },
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
                        verticalSpace3(),
                        GetBuilder<AuthController>(builder: (_) {
                          return BuildUnderlinedTextFormField(
                            hint: 'password'.tr,
                            controller: _password,
                            isPassword: !_controller.isVisible,
                            suffixWidget: IconButton(
                              padding: const EdgeInsets.all(0),
                              constraints: const BoxConstraints(),
                              icon: _controller.isVisible == true
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              color: mainLightColor,
                              onPressed: () => _controller.changeVisible(),
                            ),
                            validate: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'password_verify'.tr;
                              } else if (value.toString().trim().length < 8) {
                                return 'valid_password_verify'.tr;
                              }
                              return null;
                            },
                          );
                        }),
                        BuildCheckTermsWidget(),
                        verticalSpace5(),
                        GetBuilder<AuthController>(builder: (_) {
                          return BuildElevatedButtonUtil(
                            child: !_controller.isLoading
                                ? TextUtil(
                                    text: 'signup'.tr.toUpperCase(),
                                    color: whiteColor,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  )
                                : const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(whiteColor),),
                            color: mainLightColor,
                            radius: 0.0,
                            size: Size(infinityWidth, 50.h),
                            onClick: () async {
                              if (_globalKey.currentState!.validate()) {
                                await _controller.signup(
                                    username: _userName.text.trim(),
                                    email: _email.text.trim(),
                                    password: _password.text);
                                FocusScope.of(context).unfocus();
                              }
                            },
                          );
                        }),
                        SizedBox(height: 50.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BuildAuthQuestionWidget(
        question: 'do_have_account'.tr,
        buttonText: 'login'.tr.toUpperCase(),
        onClick: () => Get.toNamed(RoutesPath.loginView),
      ),
    );
  }

  @override
  void dispose() {
    _userName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
