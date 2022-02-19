import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/routes/routes.dart';
import '../app_components.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

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
              decoration: BoxDecoration(
                color: blackColor.withOpacity(0.2),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: isPortrait ? 200 : 30),
                    Container(
                      height: 60.0,
                      width: 160.0,
                      decoration: BoxDecoration(
                        color: whiteColor.withOpacity(0.1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: const Center(
                        child: TextUtil(
                          text: 'Wellcome',
                          fontSize: 35.0,
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Redressed-Regular',
                        ),
                      ),
                    ),
                    verticalSpace2(),
                    const BuildLogoUtil(),
                    SizedBox(height: isPortrait ? 150 : 50),
                    ElevatedButton(
                      child: const TextUtil(
                        text: 'Get Started',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 5.0)),
                        backgroundColor: MaterialStateProperty.all(mainLightColor),
                        shape:
                            MaterialStateProperty.all<BeveledRectangleBorder>(
                          BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () => Get.toNamed(RoutesPath.loginView),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextUtil(
                          text: 'Don\'t have an account?',
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                        ),
                        horizontalSpace1(),
                        BuildTextButtonUtil(
                          text: 'SignUp',
                          fontSize: 20.0,
                          decoration: TextDecoration.underline,
                          onClick: () => Get.offNamed(RoutesPath.signupView),
                        ),
                      ],
                    ),
                    verticalSpace2(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
