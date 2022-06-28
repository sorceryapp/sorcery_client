class SignUpError implements Exception {
  SignUpError([this.message = 'Signup error: an unknown exception occured.']);
  final String message;

  factory SignUpError.fromCode({required int code}) {
    switch (code) {
      case 422:
        return SignUpError(
            'There was an error creating your account: Unprocessable Entity (422)');
      default:
        return SignUpError();
    }
  }
}

class VerifyAccountError implements Exception {
  VerifyAccountError(
      [this.message =
          'Unable to verify account: an unknown exception occurred.']);
  final String message;

  factory VerifyAccountError.fromCode({required int code}) {
    switch (code) {
      case 401:
        return VerifyAccountError(
            'Unable to verify account: Unauthorized (401)');
      default:
        return VerifyAccountError();
    }
  }
}

class VerifyAccountResendError implements Exception {
  VerifyAccountResendError(
      [this.message =
          'Unable to verify account: an unknown exception occurred.']);
  final String message;

  factory VerifyAccountResendError.fromCode({required int code}) {
    switch (code) {
      case 400:
        return VerifyAccountResendError(
            'An email has recently been sent to you with a link to verify your account. Please wait 30 seconds before trying again: Bad Request (400)');
      case 401:
        return VerifyAccountResendError(
            'Unable to resend verify account email: Unauthorized (401)');
      default:
        return VerifyAccountResendError();
    }
  }
}

class SignInError implements Exception {
  SignInError([this.message = 'Signin error: an unknown exception occured.']);
  final String message;

  factory SignInError.fromCode({required int code}) {
    switch (code) {
      default:
        return SignInError();
    }
  }
}

class LogoutError implements Exception {
  LogoutError([this.message = 'Logout error: an unknown exception occured.']);
  final String message;

  factory LogoutError.fromCode({required int code}) {
    switch (code) {
      case 400:
        return LogoutError('Unable to logout: Bad Request (400)');
      default:
        return LogoutError();
    }
  }
}
