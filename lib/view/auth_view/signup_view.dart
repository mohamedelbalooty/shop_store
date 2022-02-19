import 'package:flutter/material.dart';
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
          alignment: Alignment.bottomCenter,
          children: [
            const BuildBackgroundUtil(),
            Container(
              height: infinityHeight,
              width: infinityWidth,
              decoration: BoxDecoration(
                color: blackColor.withOpacity(0.2),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _globalKey,
                  child: Padding(
                    padding: symmetricHorizontalPadding1(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: isPortrait ? 100 : 20),
                        const BuildLogoUtil(),
                        BuildUnderlinedTextFormField(
                          textFieldKey: UniqueKey(),
                          hint: 'Username',
                          controller: _userName,
                          validate: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your name!';
                            } else if (value.toString().trim().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name!';
                            }
                            return null;
                          },
                        ),
                        verticalSpace3(),
                        BuildUnderlinedTextFormField(
                          textFieldKey: UniqueKey(),
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
                        GetBuilder<AuthController>(builder: (context) {
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
                        }),
                        BuildCheckTermsWidget(),
                        verticalSpace5(),
                        BuildElevatedButtonUtil(
                          child: TextUtil(
                            text: 'Signup',
                            color: Get.isDarkMode
                                ? secondDarkColor
                                : secondLightColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          color:
                              Get.isDarkMode ? mainDarkColor : mainLightColor,
                          radius: 0.0,
                          size: Size(infinityWidth, 50.0),
                          onClick: () {
                            if (_globalKey.currentState!.validate()) {}
                          },
                        ),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            BuildAuthQuestionWidget(
              question: 'Already have an account?',
              buttonText: 'Login'.toUpperCase(),
              onClick: () => Get.toNamed(RoutesPath.loginView),
            ),
          ],
        ),
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
