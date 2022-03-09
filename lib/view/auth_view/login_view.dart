import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/auth_controller.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/routes/routes.dart';
import 'package:shop_store/utils/validation_strings.dart';
import '../app_components.dart';
import 'components.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
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
                          hint: 'Email',
                          controller: _email,
                          validate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your email!';
                            } else if (!RegExp(validationEmail)
                                .hasMatch(value)) {
                              return 'Enter valid email!';
                            }
                            return null;
                          },
                        ),
                        verticalSpace3(),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return BuildUnderlinedTextFormField(
                              hint: 'Password',
                              controller: _password,
                              isPassword: !_controller.isVisible,
                              suffixWidget: IconButton(
                                padding: const EdgeInsets.all(0),
                                constraints: const BoxConstraints(),
                                icon: _controller.isVisible == true
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                color: Get.isDarkMode
                                    ? mainDarkColor
                                    : mainLightColor,
                                onPressed: () => _controller.changeVisible(),
                              ),
                              validate: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your password!';
                                } else if (value.toString().trim().length < 8) {
                                  return 'Enter strong password don\'t less than 8 characters';
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BuildTextButtonUtil(
                                text: 'Forget your password!',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                padding: EdgeInsets.zero,
                                onClick: () =>
                                    Get.toNamed(RoutesPath.forgetPasswordView)),
                          ],
                        ),
                        verticalSpace5(),
                        GetBuilder<AuthController>(builder: (_) {
                          return BuildElevatedButtonUtil(
                            child: !_controller.isLoading
                                ? TextUtil(
                                    text: 'Log in'.toUpperCase(),
                                    fontSize: 20.sp,
                                    color: whiteColor,
                                    fontWeight: FontWeight.bold,
                                  )
                                : const BuildCircularLoadingUtil(),
                            color:
                                Get.isDarkMode ? mainDarkColor : mainLightColor,
                            radius: 0.0,
                            size: Size(infinityWidth, 50.h),
                            onClick: () async {
                              if (_globalKey.currentState!.validate()) {
                                await _controller.login(
                                    email: _email.text.trim(),
                                    password: _password.text);
                                FocusScope.of(context).unfocus();
                              }
                            },
                          );
                        }),
                        verticalSpace5(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextUtil(
                            text: 'OR',
                            color: Get.isDarkMode
                                ? secondDarkColor
                                : secondLightColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            height: 1.0,
                          ),
                        ),
                        verticalSpace3(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BuildImageButtonUtil(
                              image: 'assets/images/facebook.png',
                              onClick: () {},
                            ),
                            horizontalSpace5(),
                            BuildImageButtonUtil(
                              image: 'assets/images/google.png',
                              onClick: () {},
                            ),
                          ],
                        ),
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
        question: 'Don\'t have an account?',
        buttonText: 'Signup'.toUpperCase(),
        onClick: () => Get.toNamed(RoutesPath.signupView),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
}
