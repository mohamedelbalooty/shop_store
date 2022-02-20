String? authErrorHandling({required String? exceptionCode}) {
  switch (exceptionCode) {
    case 'invalid-email':
      return 'This email is invalid !';
    case 'weak-password':
      return 'This password is weak !';
    case 'wrong-password':
      return 'Wrong password !';
    case 'email-already-in-use':
      return 'This email already in use !';
    case 'user-not-found':
      return 'User not found';
    case 'network-request-failed':
      return 'Check your network connection';
    default:
      return 'Something went wrong !';
  }
}
