import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/view/app_components.dart';
import 'components.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.backgroundColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: symmetricHorizontalPadding1(),
          child: Column(
            children: [
              BuildInfoWidget(),
              verticalSpace2(),
              Divider(
                color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                thickness: 3.0,
              ),
              verticalSpace3(),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: settingItems(context).length,
                itemBuilder: (_, index) {
                  return settingItems(context)[index];
                },
                separatorBuilder: (_, index) => verticalSpace1(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}