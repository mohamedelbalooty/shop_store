import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_store/core/auth_errors.dart';
import 'package:shop_store/logic/binding/auth_binding.dart';
import 'package:shop_store/model/user_data.dart';
import 'package:shop_store/utils/constants.dart';
import 'package:shop_store/utils/helper/firebase_helper.dart';
import 'package:shop_store/utils/helper/storage_helper.dart';
import 'package:shop_store/utils/routes/routes.dart';
import 'package:shop_store/view/app_components.dart';
import 'package:shop_store/view/auth_view/verification_view.dart';

class AuthController extends GetxController {
  bool isVisible = false;
  bool isChecked = false;
  bool isLoading = false;
  bool? isVerified;
  String? _authError;

  void changeVisible() {
    isVisible = !isVisible;
    update();
  }

  void changeCheck(bool value) {
    isChecked = value;
    update();
  }

  Timer? timer;
  late User emailAccount;
  late GoogleSignInAccount googleAccount;
  late FacebookUserProfile facebookAccount;
  late String facebookAccountImage;
  late String facebookAccountEmail;

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
          isVerified = FirebaseHelper.firebaseAuth.currentUser!.emailVerified;
          if (isVerified!) {
            FirebaseHelper.firebaseAuth.currentUser!
                .updateDisplayName(username);
            emailAccount = FirebaseHelper.firebaseAuth.currentUser!;
            StorageHelper.setBoolData(key: loginKey, value: true);
            StorageHelper.setMapData(
              key: userKey,
              value: UserData(
                id: emailAccount.uid,
                email: emailAccount.email,
                name: emailAccount.displayName,
                image: emailAccount.photoURL ?? emptyImage,
              ).toJson(),
            );
            Get.offNamedUntil(RoutesPath.homeView, (route) => false);
          } else {
            Get.off(
              VerificationView(userName: username),
              binding: AuthBinding(),
            );
          }
          update();
        });
        isLoading = false;
      } on FirebaseAuthException catch (authException) {
        _authError = authErrorHandling(exceptionCode: authException.code);
        isLoading = false;
        showSnackBar(title: 'error'.tr, message: _authError!);
      } catch (exception) {
        _authError = exception.toString();
        isLoading = false;
        showSnackBar(title: 'error'.tr, message: _authError!);
      }
    } else {
      showSnackBar(title: 'check_box_error'.tr, message: 'checkable_error'.tr);
    }
    update();
  }

  Future<void> emailVerify(String username) async {
    FirebaseHelper.firebaseAuth.currentUser!
        .sendEmailVerification()
        .then((value) {
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        checkEmailVerification(username);
      });
    });
  }

  Future<void> checkEmailVerification(String username) async {
    FirebaseHelper.firebaseAuth.currentUser!.reload();
    isVerified = FirebaseHelper.firebaseAuth.currentUser!.emailVerified;
    if (isVerified!) {
      FirebaseHelper.firebaseAuth.currentUser!.updateDisplayName(username);
      emailAccount = FirebaseHelper.firebaseAuth.currentUser!;
      StorageHelper.setBoolData(key: loginKey, value: true);
      StorageHelper.setStringData(key: loginTypeKey, value: 'email');
      StorageHelper.setMapData(
        key: userKey,
        value: UserData(
          id: emailAccount.uid,
          email: emailAccount.email,
          name: username,
          image: emailAccount.photoURL ?? emptyImage,
        ).toJson(),
      );
      Get.offNamedUntil(RoutesPath.homeView, (route) => false);
      timer!.cancel();
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
      emailAccount = FirebaseHelper.firebaseAuth.currentUser!;
      StorageHelper.setBoolData(key: loginKey, value: true);
      StorageHelper.setStringData(key: loginTypeKey, value: 'email');
      StorageHelper.setMapData(
        key: userKey,
        value: UserData(
          id: emailAccount.uid,
          email: emailAccount.email,
          name: emailAccount.displayName,
          image: emailAccount.photoURL ?? emptyImage,
        ).toJson(),
      );
      isLoading = false;
      Get.offNamedUntil(RoutesPath.homeView, (route) => false);
    } on FirebaseAuthException catch (authException) {
      _authError = authErrorHandling(exceptionCode: authException.code);
      isLoading = false;
      showSnackBar(title: 'error'.tr, message: _authError!);
    } catch (exception) {
      _authError = exception.toString();
      isLoading = false;
      showSnackBar(title: 'error'.tr, message: _authError!);
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
      showSnackBar(title: 'error'.tr, message: _authError!);
    } catch (exception) {
      _authError = exception.toString();
      isLoading = false;
      showSnackBar(title: 'error'.tr, message: _authError!);
    }
    update();
  }

  Future<void> googleSignIn() async {
    showLoading();
    try {
      googleAccount = (await FirebaseHelper.googleSignIn.signIn())!;
      GoogleSignInAuthentication googleAuthentication =
          await googleAccount.authentication;
      AuthCredential googleCredential = GoogleAuthProvider.credential(
          accessToken: googleAuthentication.accessToken,
          idToken: googleAuthentication.idToken);
      await FirebaseHelper.firebaseAuth.signInWithCredential(googleCredential);
      StorageHelper.setBoolData(key: loginKey, value: true);
      StorageHelper.setStringData(key: loginTypeKey, value: 'google');
      StorageHelper.setMapData(
        key: userKey,
        value: UserData(
          id: googleAccount.id,
          email: googleAccount.email,
          name: googleAccount.displayName,
          image: googleAccount.photoUrl,
        ).toJson(),
      );
      Get.back();
      Get.offNamedUntil(RoutesPath.homeView, (route) => false);
    } catch (googleException) {
      _authError = googleException.toString();
      Get.back();
      showSnackBar(title: 'error'.tr, message: _authError!);
    }
    update();
  }

  Future<void> facebookSignIn() async {
    showLoading();
    try {
      FacebookLoginResult facebookResult =
          await FirebaseHelper.facebookLogin.logIn(permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ]);
      facebookAccount = (await FirebaseHelper.facebookLogin.getUserProfile())!;
      facebookAccountEmail =
          (await FirebaseHelper.facebookLogin.getUserEmail())!;
      facebookAccountImage =
          (await FirebaseHelper.facebookLogin.getProfileImageUrl(width: 200))!;
      AuthCredential facebookCredential =
          FacebookAuthProvider.credential(facebookResult.accessToken!.token);
      await FirebaseHelper.firebaseAuth
          .signInWithCredential(facebookCredential);
      StorageHelper.setBoolData(key: loginKey, value: true);
      StorageHelper.setStringData(key: loginTypeKey, value: 'facebook');
      StorageHelper.setMapData(
        key: userKey,
        value: UserData(
          id: facebookAccount.userId,
          email: facebookAccountEmail,
          name: facebookAccount.name,
          image: facebookAccountImage,
        ).toJson(),
      );
      Get.back();
      Get.offNamedUntil(RoutesPath.homeView, (route) => false);
    } catch (facebookException) {
      _authError = facebookException.toString();
      Get.back();
      showSnackBar(title: 'error'.tr, message: _authError!);
    }
    update();
  }

  Future<void> emailLogout() async{
    await FirebaseHelper.firebaseAuth.signOut();
    await StorageHelper.removeData(key: loginKey);
    await StorageHelper.removeData(key: userKey);
    await StorageHelper.removeData(key: themeKey);
    Get.offNamedUntil(RoutesPath.welcomeView, (route) => false);
  }

  Future<void> googleSignOut()async{
    await FirebaseHelper.googleSignIn.signOut();
    await StorageHelper.removeData(key: loginKey);
    await StorageHelper.removeData(key: userKey);
    await StorageHelper.removeData(key: themeKey);
    Get.offNamedUntil(RoutesPath.welcomeView, (route) => false);
  }

  Future<void> facebookSignOut() async{
    await FirebaseHelper.facebookLogin.logOut();
    await StorageHelper.removeData(key: loginKey);
    await StorageHelper.removeData(key: userKey);
    await StorageHelper.removeData(key: themeKey);
    Get.offNamedUntil(RoutesPath.welcomeView, (route) => false);
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
