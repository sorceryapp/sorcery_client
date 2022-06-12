import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/localization/l10n.dart';

class Localization {
  final BuildContext _context;
  Localization({required context}) : _context = context;

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
    }

    throw ('Error in Localization#getText');
  }
}
