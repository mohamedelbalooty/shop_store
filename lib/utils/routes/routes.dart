import 'package:get/get.dart';
import 'package:shop_store/logic/binding/auth_binding.dart';
import 'package:shop_store/logic/binding/favourite_binding.dart';
import 'package:shop_store/logic/binding/home_binding.dart';
import 'package:shop_store/logic/binding/layout_binding.dart';
import 'package:shop_store/view/auth_view/forget_password_view.dart';
import 'package:shop_store/view/auth_view/login_view.dart';
import 'package:shop_store/view/auth_view/signup_view.dart';
import 'package:shop_store/view/auth_view/verification_view.dart';
import 'package:shop_store/view/cart_view/cart_view.dart';
import 'package:shop_store/view/layout_view/layout_view.dart';
import 'package:shop_store/view/welcome_view/welcome_view.dart';

class Routes {
  // static const String initialRoute = RoutesPath.welcomeView;
  static const String initialRoute = RoutesPath.homeView;

  static List<GetPage> routes = [
    GetPage(name: RoutesPath.welcomeView, page: () => const WelcomeView()),
    GetPage(
      name: RoutesPath.loginView,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutesPath.signupView,
      page: () => const SignUpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutesPath.forgetPasswordView,
      page: () => const ForgetPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutesPath.verificationView,
      page: () => const VerificationView(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: RoutesPath.homeView,
        page: () => const LayoutView(),
        bindings: [
          AuthBinding(),
          LayoutBinding(),
          HomeBinding(),
          FavouriteBinding(),
        ]),
    GetPage(
      name: RoutesPath.cartView,
      page: () => const CartView(),
    ),
    // GetPage(name: RoutesPath.loginView, page: () => const LoginView()),
    // GetPage(name: RoutesPath.loginView, page: () => const LoginView()),
  ];
}

class RoutesPath {
  static const String welcomeView = "/welcomeView";
  static const String loginView = "/loginView";
  static const String signupView = "/signupView";
  static const String forgetPasswordView = '/forgetPasswordView';
  static const String verificationView = '/verificationView';
  static const String homeView = '/homeView';
  static const String cartView = '/cartView';
// static const String verificationView = '/verificationView';
// static const String verificationView = '/verificationView';
// static const String verificationView = '/verificationView';
// static const String verificationView = '/verificationView';

}
