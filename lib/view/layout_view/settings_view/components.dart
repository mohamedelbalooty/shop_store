import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_store/logic/controller/setting_controller.dart';
import 'package:shop_store/logic/controller/theme_controller.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/utils/icon_broken.dart';
import '../../app_components.dart';

class BuildInfoWidget extends StatelessWidget {
  const BuildInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.backgroundColor,
      child: Row(
        children: [
          Container(
            height: 100.w,
            width: 100.w,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                  'https://www.wepal.net/ar/uploads/2732018-073911PM-1.jpg',
                ),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                  color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                  width: 2.0),
              shape: BoxShape.circle,
            ),
          ),
          horizontalSpace2(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtil(
                text: 'mohamed elbalooty gamal'
                    .split(' ')
                    .map((e) => e.capitalize)
                    .join(' '),
                fontSize: 20.sp,
                color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                fontWeight: FontWeight.bold,
              ),
              TextUtil(
                text: 'mohamedelbalooty123@gmail.com',
                fontSize: 14.sp,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                textOverflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BuildSettingItemWidget extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final Widget widget;

  const BuildSettingItemWidget({
    Key? key,
    required this.color,
    required this.text,
    required this.icon,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.backgroundColor,
      child: SizedBox(
        height: 50.h,
        child: Row(
          children: [
            Container(
              height: 35.w,
              width: 35.w,
              decoration: BoxDecoration(
                color: color,
                border: Border.all(color: whiteColor),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 24.0,
                  color: whiteColor,
                ),
              ),
            ),
            horizontalSpace2(),
            TextUtil(
              text: text,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? secondLightColor : secondDarkColor,
            ),
            const Spacer(),
            widget
          ],
        ),
      ),
    );
  }
}

List<Widget> settingItems(BuildContext context) => [
      BuildSettingItemWidget(
        color: const Color(0xFF5F6A6A),
        icon: Icons.brightness_2_outlined,
        text: 'dark_mode'.tr,
        widget: GetBuilder<SettingController>(builder: (context) {
          final _settingController = Get.find<SettingController>();
          return Switch(
            value: _settingController.switchValue,
            activeColor: mainDarkColor,
            onChanged: (bool value) {
              ThemeController().changeTheme();
              _settingController.onChangeTheme(value);
            },
          );
        }),
      ),
  BuildSettingItemWidget(
        color: const Color(0xFF2874A6),
        icon: Icons.language,
        text: 'language'.tr,
        widget: const BuildLanguageWidget(),
      ),
      GestureDetector(
        onTap: () {},
        child: BuildSettingItemWidget(
          color: const Color(0xFF6C3483),
          icon: Icons.help_outline,
          text: 'privacy_policy'.tr,
          widget: Icon(
            Icons.arrow_forward_ios,
            size: 24.0,
            color: Get.isDarkMode ? mainDarkColor : mainLightColor,
          ),
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: BuildSettingItemWidget(
          color: Colors.redAccent,
          icon: Icons.logout,
          text: 'logout'.tr,
          widget: Icon(
            Icons.arrow_forward_ios,
            size: 24.0,
            color: Get.isDarkMode ? mainDarkColor : mainLightColor,
          ),
        ),
      ),
    ];

class BuildLanguageWidget extends StatefulWidget {
  const BuildLanguageWidget({Key? key}) : super(key: key);

  @override
  _BuildLanguageWidgetState createState() => _BuildLanguageWidgetState();
}

class _BuildLanguageWidgetState extends State<BuildLanguageWidget> {
  final List<String> langOptions = ['العربية 🇪🇬', 'English 🇺🇸'];

  final List<String> entries = ['ar', 'en'];

  String currentLang = 'العربية 🇪🇬';
  String lang = '';
  final _settingController = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.backgroundColor,
      child: GetBuilder<SettingController>(
        builder: (context) {
          return Container(
            height: 35.h,
            width: 100.w,
            padding: const EdgeInsetsDirectional.only(end: 5.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
              border: Border.all(
                  color: Get.isDarkMode ? mainDarkColor : mainLightColor,
                  width: 1.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildPopUpMenuButtonUtil(
                  entries: langOptions,
                  icon: Icon(
                    IconBroken.Arrow___Down_2,
                    color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                    size: 18.0,
                  ),
                  onSelected: (String value) {
                    setState(() {
                      if(value == 'العربية 🇪🇬'){
                        lang = 'ar';
                      }else{
                        lang = 'en';
                      }
                      currentLang = value;
                    });
                    _settingController.onChangeLanguage(lang);
                  },
                ),
                TextUtil(
                  text: currentLang,
                  fontSize: 14.sp,
                  color: Get.isDarkMode ? secondLightColor : secondDarkColor,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
