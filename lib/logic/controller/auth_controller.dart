import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shop_store/core/auth_errors.dart';
import 'package:shop_store/utils/helper/firebase_helper.dart';
import 'package:shop_store/utils/routes/routes.dart';
import 'package:shop_store/view/app_components.dart';

class AuthController extends GetxController {
  bool isVisible = false;
  bool isChecked = false;
  bool isLoading = false;
  String? _authError;

  void changeVisible() {
    isVisible = !isVisible;
    update();
  }

  void changeCheck(bool value) {
    isChecked = value;
    update();
  }

  Future<void> signup(
      {required String username,
      required String email,
      required String password}) async {
    if (isChecked == true) {
      try {
        isLoading = true;
        update();
        await Future.delayed(const Duration(seconds: 1));
        await FirebaseHelper.firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          FirebaseHelper.firebaseAuth.currentUser!.updateDisplayName(username);
        });
        isLoading = false;
        Get.toNamed(RoutesPath.verificationView);
        // Get.offNamedUntil(RoutesPath.homeView, (route) => false);
      } on FirebaseAuthException catch (authException) {
        _authError = authErrorHandling(exceptionCode: authException.code);
        isLoading = false;
        showSnackBar(title: 'Error', message: _authError!);
      } catch (exception) {
        _authError = exception.toString();
        isLoading = false;
        showSnackBar(title: 'Error', message: _authError!);
      }
    } else {
      showSnackBar(title: 'Checkbox Error', message: 'Checkbox Error !');
    }
    update();
  }

  Future<void> login({required String email, required String password}) async {
    isLoading = true;
    update();
    try {
      await Future.delayed(const Duration(seconds: 1));
      await FirebaseHelper.firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      isLoading = false;
      Get.offNamedUntil(RoutesPath.homeView, (route) => false);
    } on FirebaseAuthException catch (authException) {
      _authError = authErrorHandling(exceptionCode: authException.code);
      isLoading = false;
      showSnackBar(title: 'Error', message: _authError!);
    } catch (exception) {
      _authError = exception.toString();
      isLoading = false;
      showSnackBar(title: 'Error', message: _authError!);
    }
    update();
  }

  Future<void> forgetPassword({required String email}) async {
    isLoading = true;
    update();
    try {
      await Future.delayed(const Duration(seconds: 1));
      await FirebaseHelper.firebaseAuth.sendPasswordResetEmail(email: email);
      isLoading = false;
      Get.back();
    } on FirebaseAuthException catch (authException) {
      _authError = authErrorHandling(exceptionCode: authException.code);
      isLoading = false;
      showSnackBar(title: 'Error', message: _authError!);
    } catch (exception) {
      _authError = exception.toString();
      isLoading = false;
      showSnackBar(title: 'Error', message: _authError!);
    }
    update();
  }

  void emailVerification() async {}

  void googleSignIn() async {}

  void facebookSignIn() async {}
}
