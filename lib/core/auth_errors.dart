import 'package:get/get.dart';

String? authErrorHandling({required String? exceptionCode}) {
  switch (exceptionCode) {
    case 'invalid-email':
      return 'invalid_email'.tr;
    case 'weak-password':
      return 'weak_password'.tr;
    case 'wrong-password':
      return 'wrong_password'.tr;
    case 'email-already-in-use':
      return 'email_already_in_use'.tr;
    case 'user-not-found':
      return 'user_not_found'.tr;
    case 'network-request-failed':
      return 'network_request_failed'.tr;
    default:
      return 'something_error'.tr;
  }
}
