// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(value) => "This field value must be equal to ${value}.";

  static String m1(max) => "Value must be less than or equal to ${max}";

  static String m2(maxLength) =>
      "Value must have a length less than or equal to ${maxLength}";

  static String m3(min) => "Value must be greater than or equal to ${min}.";

  static String m4(minLength) =>
      "Value must have a length greater than or equal to ${minLength}";

  static String m5(value) => "This field value must not be equal to ${value}.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountButtonCancel": MessageLookupByLibrary.simpleMessage("cancel"),
        "accountButtonLogout": MessageLookupByLibrary.simpleMessage("logout"),
        "accountButtonResendVerifyAccountEmail":
            MessageLookupByLibrary.simpleMessage("resend"),
        "accountButtonResetPassword":
            MessageLookupByLibrary.simpleMessage("reset"),
        "accountButtonSignIn": MessageLookupByLibrary.simpleMessage("sign in"),
        "accountButtonSignUp": MessageLookupByLibrary.simpleMessage("sign up"),
        "accountButtonVerifyAccount":
            MessageLookupByLibrary.simpleMessage("verify"),
        "accountFieldConfirmPassword":
            MessageLookupByLibrary.simpleMessage("confirm password"),
        "accountFieldEmailAddress":
            MessageLookupByLibrary.simpleMessage("email"),
        "accountFieldFirstName": MessageLookupByLibrary.simpleMessage("first"),
        "accountFieldLastName": MessageLookupByLibrary.simpleMessage("last"),
        "accountFieldPassword":
            MessageLookupByLibrary.simpleMessage("password"),
        "accountFieldVerifyToken":
            MessageLookupByLibrary.simpleMessage("token"),
        "appButtonCreateNewAppCancel":
            MessageLookupByLibrary.simpleMessage("cancel"),
        "appButtonCreateNewAppSubmit":
            MessageLookupByLibrary.simpleMessage("create app"),
        "appButtonNewApp": MessageLookupByLibrary.simpleMessage("New App"),
        "appInputName": MessageLookupByLibrary.simpleMessage("name"),
        "appRadioFramework": MessageLookupByLibrary.simpleMessage("framework"),
        "appRadioType": MessageLookupByLibrary.simpleMessage("type"),
        "creditCardErrorText": MessageLookupByLibrary.simpleMessage(
            "This field requires a valid credit card number."),
        "dateStringErrorText": MessageLookupByLibrary.simpleMessage(
            "This field requires a valid date string."),
        "emailErrorText": MessageLookupByLibrary.simpleMessage(
            "This field requires a valid email address."),
        "equalErrorText": m0,
        "homePageTitleAuthenticated":
            MessageLookupByLibrary.simpleMessage("hello"),
        "homePageTitleUnauthenticated":
            MessageLookupByLibrary.simpleMessage("welcome to"),
        "integerErrorText": MessageLookupByLibrary.simpleMessage(
            "This field requires a valid integer."),
        "ipErrorText": MessageLookupByLibrary.simpleMessage(
            "This field requires a valid IP."),
        "matchErrorText": MessageLookupByLibrary.simpleMessage(
            "Value does not match pattern."),
        "maxErrorText": m1,
        "maxLengthErrorText": m2,
        "minErrorText": m3,
        "minLengthErrorText": m4,
        "notEqualErrorText": m5,
        "numericErrorText":
            MessageLookupByLibrary.simpleMessage("Value must be numeric."),
        "passwordsDoNotMatchErrorText": MessageLookupByLibrary.simpleMessage(
            "Password and Confirm Password must match."),
        "requiredErrorText":
            MessageLookupByLibrary.simpleMessage("This field cannot be empty."),
        "resendVerifyAccountPageTitle":
            MessageLookupByLibrary.simpleMessage("resend verify account email"),
        "resendVerifyAccountTextLink": MessageLookupByLibrary.simpleMessage(
            "request a new verification email"),
        "resetPasswordPageTitle":
            MessageLookupByLibrary.simpleMessage("reset your password"),
        "signInPageTitle": MessageLookupByLibrary.simpleMessage("sign in"),
        "signUpPageTitle": MessageLookupByLibrary.simpleMessage("sign up"),
        "urlErrorText": MessageLookupByLibrary.simpleMessage(
            "This field requires a valid URL address."),
        "verifyAccountPageBody": MessageLookupByLibrary.simpleMessage(
            "We just sent you an email with a verification token. Grab the token, then paste it in the field below:"),
        "verifyAccountPageTitle":
            MessageLookupByLibrary.simpleMessage("please verify your account"),
        "verifyAccountTextLink":
            MessageLookupByLibrary.simpleMessage("please verify your account")
      };
}
