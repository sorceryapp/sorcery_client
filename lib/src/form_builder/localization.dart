import 'package:sorcery_desktop_v3/localization/l10n.dart';

class Localization {
  String getText({required String localizationKey}) {
    switch (localizationKey) {
      case 'accountFieldFirstName':
        return SorceryLocalizations.current.accountFieldFirstName;
      case 'accountFieldLastName':
        return SorceryLocalizations.current.accountFieldLastName;
      case 'accountFieldEmailAddress':
        return SorceryLocalizations.current.accountFieldEmailAddress;
      case 'accountFieldPassword':
        return SorceryLocalizations.current.accountFieldPassword;
      case 'accountFieldConfirmPassword':
        return SorceryLocalizations.current.accountFieldConfirmPassword;
      case 'accountButtonResetPassword':
        return SorceryLocalizations.current.accountButtonResetPassword;
      case 'accountFieldVerifyToken':
        return SorceryLocalizations.current.accountFieldVerifyToken;
      case 'accountButtonSignUp':
        return SorceryLocalizations.current.accountButtonSignUp;
      case 'accountButtonSignIn':
        return SorceryLocalizations.current.accountButtonSignIn;
      case 'accountButtonResendVerifyAccountEmail':
        return SorceryLocalizations
            .current.accountButtonResendVerifyAccountEmail;
      case 'accountButtonVerifyAccount':
        return SorceryLocalizations.current.accountButtonVerifyAccount;
      case 'accountButtonCancel':
        return SorceryLocalizations.current.accountButtonCancel;
      case 'resendVerifyAccountTextLink':
        return SorceryLocalizations.current.resendVerifyAccountTextLink;
      case 'appInputName':
        return SorceryLocalizations.current.appInputName;
      case 'appRadioFramework':
        return SorceryLocalizations.current.appRadioFramework;
      case 'appRadioType':
        return SorceryLocalizations.current.appRadioType;
      case 'appButtonCreateNewAppSubmit':
        return SorceryLocalizations.current.appButtonCreateNewAppSubmit;
      case 'appButtonCreateNewAppCancel':
        return SorceryLocalizations.current.appButtonCreateNewAppCancel;
      case 'appButtonNewApp':
        return SorceryLocalizations.current.appButtonNewApp;
    }

    throw ('Error in Localization#getText');
  }
}
