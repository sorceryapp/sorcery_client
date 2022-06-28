// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class SorceryLocalizations {
  SorceryLocalizations();

  static SorceryLocalizations? _current;

  static SorceryLocalizations get current {
    assert(_current != null,
        'No instance of SorceryLocalizations was loaded. Try to initialize the SorceryLocalizations delegate before accessing SorceryLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<SorceryLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = SorceryLocalizations();
      SorceryLocalizations._current = instance;

      return instance;
    });
  }

  static SorceryLocalizations of(BuildContext context) {
    final instance = SorceryLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of SorceryLocalizations present in the widget tree. Did you add SorceryLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static SorceryLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<SorceryLocalizations>(
        context, SorceryLocalizations);
  }

  /// `welcome to`
  String get homePageTitleUnauthenticated {
    return Intl.message(
      'welcome to',
      name: 'homePageTitleUnauthenticated',
      desc: 'welcome unauthenticated users to Sorcery',
      args: [],
    );
  }

  /// `hello`
  String get homePageTitleAuthenticated {
    return Intl.message(
      'hello',
      name: 'homePageTitleAuthenticated',
      desc: 'welcome authenticated users to Sorcery',
      args: [],
    );
  }

  /// `sign in`
  String get signInPageTitle {
    return Intl.message(
      'sign in',
      name: 'signInPageTitle',
      desc: 'sign in page title',
      args: [],
    );
  }

  /// `sign up`
  String get signUpPageTitle {
    return Intl.message(
      'sign up',
      name: 'signUpPageTitle',
      desc: 'sign up page title',
      args: [],
    );
  }

  /// `please verify your account`
  String get verifyAccountPageTitle {
    return Intl.message(
      'please verify your account',
      name: 'verifyAccountPageTitle',
      desc: 'verify account page title',
      args: [],
    );
  }

  /// `We just sent you an email with a verification token. Grab the token, then paste it in the field below:`
  String get verifyAccountPageBody {
    return Intl.message(
      'We just sent you an email with a verification token. Grab the token, then paste it in the field below:',
      name: 'verifyAccountPageBody',
      desc: 'verify account page body',
      args: [],
    );
  }

  /// `resend verify account email`
  String get resendVerifyAccountPageTitle {
    return Intl.message(
      'resend verify account email',
      name: 'resendVerifyAccountPageTitle',
      desc: 'resend verify account page title',
      args: [],
    );
  }

  /// `request a new verification email`
  String get resendVerifyAccountTextLink {
    return Intl.message(
      'request a new verification email',
      name: 'resendVerifyAccountTextLink',
      desc: 'text for the request a new verification email link',
      args: [],
    );
  }

  /// `please verify your account`
  String get verifyAccountTextLink {
    return Intl.message(
      'please verify your account',
      name: 'verifyAccountTextLink',
      desc: 'text for the verify your account link',
      args: [],
    );
  }

  /// `reset your password`
  String get resetPasswordPageTitle {
    return Intl.message(
      'reset your password',
      name: 'resetPasswordPageTitle',
      desc: 'reset password page title',
      args: [],
    );
  }

  /// `first`
  String get accountFieldFirstName {
    return Intl.message(
      'first',
      name: 'accountFieldFirstName',
      desc: 'field name for first name',
      args: [],
    );
  }

  /// `last`
  String get accountFieldLastName {
    return Intl.message(
      'last',
      name: 'accountFieldLastName',
      desc: 'field name for last name',
      args: [],
    );
  }

  /// `email`
  String get accountFieldEmailAddress {
    return Intl.message(
      'email',
      name: 'accountFieldEmailAddress',
      desc: 'field name for email address',
      args: [],
    );
  }

  /// `password`
  String get accountFieldPassword {
    return Intl.message(
      'password',
      name: 'accountFieldPassword',
      desc: 'field name for password',
      args: [],
    );
  }

  /// `confirm password`
  String get accountFieldConfirmPassword {
    return Intl.message(
      'confirm password',
      name: 'accountFieldConfirmPassword',
      desc: 'field name for confirm password',
      args: [],
    );
  }

  /// `token`
  String get accountFieldVerifyToken {
    return Intl.message(
      'token',
      name: 'accountFieldVerifyToken',
      desc: 'field name for token',
      args: [],
    );
  }

  /// `sign in`
  String get accountButtonSignIn {
    return Intl.message(
      'sign in',
      name: 'accountButtonSignIn',
      desc: 'text for the sign in button',
      args: [],
    );
  }

  /// `sign up`
  String get accountButtonSignUp {
    return Intl.message(
      'sign up',
      name: 'accountButtonSignUp',
      desc: 'text for the sign up button',
      args: [],
    );
  }

  /// `logout`
  String get accountButtonLogout {
    return Intl.message(
      'logout',
      name: 'accountButtonLogout',
      desc: 'text for the logout button',
      args: [],
    );
  }

  /// `cancel`
  String get accountButtonCancel {
    return Intl.message(
      'cancel',
      name: 'accountButtonCancel',
      desc: 'text for the cancel button',
      args: [],
    );
  }

  /// `verify`
  String get accountButtonVerifyAccount {
    return Intl.message(
      'verify',
      name: 'accountButtonVerifyAccount',
      desc: 'text for the verify account button',
      args: [],
    );
  }

  /// `resend`
  String get accountButtonResendVerifyAccountEmail {
    return Intl.message(
      'resend',
      name: 'accountButtonResendVerifyAccountEmail',
      desc: 'text for the resend verify account email button',
      args: [],
    );
  }

  /// `reset`
  String get accountButtonResetPassword {
    return Intl.message(
      'reset',
      name: 'accountButtonResetPassword',
      desc: 'text for the reset password button',
      args: [],
    );
  }

  /// `This field cannot be empty.`
  String get requiredErrorText {
    return Intl.message(
      'This field cannot be empty.',
      name: 'requiredErrorText',
      desc: 'Error text for confirm password field',
      args: [],
    );
  }

  /// `Value must be greater than or equal to {min}.`
  String minErrorText(Object min) {
    return Intl.message(
      'Value must be greater than or equal to $min.',
      name: 'minErrorText',
      desc: 'Error text for required field',
      args: [min],
    );
  }

  /// `Value must have a length greater than or equal to {minLength}`
  String minLengthErrorText(Object minLength) {
    return Intl.message(
      'Value must have a length greater than or equal to $minLength',
      name: 'minLengthErrorText',
      desc: 'Error text for required field',
      args: [minLength],
    );
  }

  /// `Value must be less than or equal to {max}`
  String maxErrorText(Object max) {
    return Intl.message(
      'Value must be less than or equal to $max',
      name: 'maxErrorText',
      desc: 'Error text for required field',
      args: [max],
    );
  }

  /// `Value must have a length less than or equal to {maxLength}`
  String maxLengthErrorText(Object maxLength) {
    return Intl.message(
      'Value must have a length less than or equal to $maxLength',
      name: 'maxLengthErrorText',
      desc: 'Error text for required field',
      args: [maxLength],
    );
  }

  /// `This field requires a valid email address.`
  String get emailErrorText {
    return Intl.message(
      'This field requires a valid email address.',
      name: 'emailErrorText',
      desc: 'Error text for email field',
      args: [],
    );
  }

  /// `This field requires a valid integer.`
  String get integerErrorText {
    return Intl.message(
      'This field requires a valid integer.',
      name: 'integerErrorText',
      desc: 'Error text for integer validator',
      args: [],
    );
  }

  /// `This field value must be equal to {value}.`
  String equalErrorText(Object value) {
    return Intl.message(
      'This field value must be equal to $value.',
      name: 'equalErrorText',
      desc: 'Error text for equal validator',
      args: [value],
    );
  }

  /// `This field value must not be equal to {value}.`
  String notEqualErrorText(Object value) {
    return Intl.message(
      'This field value must not be equal to $value.',
      name: 'notEqualErrorText',
      desc: 'Error text for not-equal validator',
      args: [value],
    );
  }

  /// `This field requires a valid URL address.`
  String get urlErrorText {
    return Intl.message(
      'This field requires a valid URL address.',
      name: 'urlErrorText',
      desc: 'Error text for URL field',
      args: [],
    );
  }

  /// `Value does not match pattern.`
  String get matchErrorText {
    return Intl.message(
      'Value does not match pattern.',
      name: 'matchErrorText',
      desc: 'Error text for pattern field',
      args: [],
    );
  }

  /// `Value must be numeric.`
  String get numericErrorText {
    return Intl.message(
      'Value must be numeric.',
      name: 'numericErrorText',
      desc: 'Error text for numeric field',
      args: [],
    );
  }

  /// `This field requires a valid credit card number.`
  String get creditCardErrorText {
    return Intl.message(
      'This field requires a valid credit card number.',
      name: 'creditCardErrorText',
      desc: 'Error text for credit card field',
      args: [],
    );
  }

  /// `This field requires a valid IP.`
  String get ipErrorText {
    return Intl.message(
      'This field requires a valid IP.',
      name: 'ipErrorText',
      desc: 'Error text for IP address field',
      args: [],
    );
  }

  /// `This field requires a valid date string.`
  String get dateStringErrorText {
    return Intl.message(
      'This field requires a valid date string.',
      name: 'dateStringErrorText',
      desc: 'Error text for date string field',
      args: [],
    );
  }

  /// `Password and Confirm Password must match.`
  String get passwordsDoNotMatchErrorText {
    return Intl.message(
      'Password and Confirm Password must match.',
      name: 'passwordsDoNotMatchErrorText',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get appInputName {
    return Intl.message(
      'name',
      name: 'appInputName',
      desc: 'Input field for app name',
      args: [],
    );
  }

  /// `framework`
  String get appRadioFramework {
    return Intl.message(
      'framework',
      name: 'appRadioFramework',
      desc: '',
      args: [],
    );
  }

  /// `type`
  String get appRadioType {
    return Intl.message(
      'type',
      name: 'appRadioType',
      desc: '',
      args: [],
    );
  }

  /// `create app`
  String get appButtonCreateNewAppSubmit {
    return Intl.message(
      'create app',
      name: 'appButtonCreateNewAppSubmit',
      desc: 'Button text for create new app submit',
      args: [],
    );
  }

  /// `cancel`
  String get appButtonCreateNewAppCancel {
    return Intl.message(
      'cancel',
      name: 'appButtonCreateNewAppCancel',
      desc: 'Button text for create new app submit',
      args: [],
    );
  }

  /// `New App`
  String get appButtonNewApp {
    return Intl.message(
      'New App',
      name: 'appButtonNewApp',
      desc: 'Button text to go to the create app screen',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<SorceryLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'bn'),
      Locale.fromSubtags(languageCode: 'ca'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'et'),
      Locale.fromSubtags(languageCode: 'fa'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'hu'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'lo'),
      Locale.fromSubtags(languageCode: 'messages'),
      Locale.fromSubtags(languageCode: 'nl'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ro'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'sk'),
      Locale.fromSubtags(languageCode: 'sl'),
      Locale.fromSubtags(languageCode: 'sw'),
      Locale.fromSubtags(languageCode: 'uk'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<SorceryLocalizations> load(Locale locale) =>
      SorceryLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
