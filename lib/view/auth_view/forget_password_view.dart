import 'package:flutter/material.dart';
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
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          // alignment: Alignment.bottomCenter,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                height: 45.0,
                                width: 45.0,
                                margin: padding2(),
                                decoration: BoxDecoration(
                                  color: whiteColor.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                    child: Icon(
                                      Icons.close,
                                      color: mainLightColor,
                                      size: 30.0,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isPortrait ? 30 : 20),
                        const BuildLogoUtil(),
                        verticalSpace3(),
                        const Text(
                          'If you want to recover your account, then please provide your email id below.',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: whiteColor,
                            height: 2.0,
                          ),
                          textAlign: TextAlign.center,
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
                        verticalSpace5(),
                        BuildElevatedButtonUtil(
                          child: TextUtil(
                            text: 'Recover',
                            fontSize: 20.0,
                            color: Get.isDarkMode
                                ? secondDarkColor
                                : secondLightColor,
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
