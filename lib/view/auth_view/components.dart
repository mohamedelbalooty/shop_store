import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/auth_controller.dart';
import 'package:shop_store/utils/colors.dart';
import '../app_components.dart';

class BuildUnderlinedTextFormField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final Widget? suffixWidget;
  final String? Function(String?) validate;

  const BuildUnderlinedTextFormField(
      {Key? key,
        required this.hint,
        required this.controller,
        required this.validate,
        this.isPassword = false, this.suffixWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validate,
      obscureText: isPassword,
      cursorColor: mainLightColor,
      style: const TextStyle(
        color: secondLightColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: mainLightColor, fontSize: 18.0),
        errorStyle: const TextStyle(
          color: secondLightColor,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixWidget,
        enabledBorder: _underlineBorder(),
        focusedBorder: _underlineBorder(),
        errorBorder: _underlineBorder(),
        focusedErrorBorder: _underlineBorder(),
      ),
    );
  }

  UnderlineInputBorder _underlineBorder() => const UnderlineInputBorder(
    borderSide: BorderSide(width: 2.0, color: mainLightColor),
  );
}

class BuildAuthQuestionWidget extends StatelessWidget {
  final String question, buttonText;
  final Function() onClick;

  const BuildAuthQuestionWidget(
      {Key? key,
        required this.question,
        required this.buttonText,
        required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppBar().preferredSize.height,
      width: infinityWidth,
      color: Get.isDarkMode ? mainDarkColor : mainLightColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          TextUtil(
            text: question,
            fontSize: 16.0,
            color: Get.isDarkMode ? secondDarkColor : secondLightColor,
            fontWeight: FontWeight.normal,
          ),
          horizontalSpace1(),
          BuildTextButtonUtil(
              text: buttonText,
              fontSize: 16.0,
              color: Get.isDarkMode ? secondDarkColor : secondLightColor,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.underline,
              onClick: onClick),
        ],
      ),
    );
  }
}

class BuildCheckTermsWidget extends StatelessWidget {
  BuildCheckTermsWidget({Key? key}) : super(key: key);
  final _controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GetBuilder<AuthController>(builder: (context) {
          return Checkbox(
            materialTapTargetSize:
            MaterialTapTargetSize.shrinkWrap,
            checkColor: Get.isDarkMode
                ? secondDarkColor
                : secondLightColor,
            fillColor: MaterialStateProperty.all(Get.isDarkMode
                ? mainDarkColor
                : mainLightColor,),
            value: _controller.isChecked,
            onChanged: (bool? value) {
              _controller.changeCheck(value!);
            },
          );
        }),
        TextUtil(
          text: 'I accept ',
          fontSize: 14.0,
          color: Get.isDarkMode
              ? secondDarkColor
              : secondLightColor,
          fontWeight: FontWeight.normal,
        ),
        BuildTextButtonUtil(
          text: 'terms & conditions',
          fontSize: 14.0,
          color: Get.isDarkMode
              ? secondDarkColor
              : secondLightColor,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.underline,
          padding: EdgeInsets.zero,
          onClick: () {},
        ),
      ],
    );
  }
}
