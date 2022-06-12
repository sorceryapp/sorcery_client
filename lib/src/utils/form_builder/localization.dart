import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Localization {
  final BuildContext _context;
  Localization({required context}) : _context = context;

  String getText({required String localizationKey}) {
    switch (localizationKey) {
      case 'accountFieldFirstName':
        return AppLocalizations.of(_context)!.accountFieldFirstName;
      case 'accountFieldLastName':
        return AppLocalizations.of(_context)!.accountFieldLastName;
      case 'accountFieldEmailAddress':
        return AppLocalizations.of(_context)!.accountFieldEmailAddress;
      case 'accountFieldPassword':
        return AppLocalizations.of(_context)!.accountFieldPassword;
      case 'accountFieldConfirmPassword':
        return AppLocalizations.of(_context)!.accountFieldConfirmPassword;
      case 'accountButtonResetPassword':
        return AppLocalizations.of(_context)!.accountButtonResetPassword;
      case 'accountFieldVerifyToken':
        return AppLocalizations.of(_context)!.accountFieldVerifyToken;
      case 'accountButtonSignUp':
        return AppLocalizations.of(_context)!.accountButtonSignUp;
      case 'accountButtonSignIn':
        return AppLocalizations.of(_context)!.accountButtonSignIn;
      case 'accountButtonResendVerifyAccountEmail':
        return AppLocalizations.of(_context)!
            .accountButtonResendVerifyAccountEmail;
      case 'accountButtonVerifyAccount':
        return AppLocalizations.of(_context)!.accountButtonVerifyAccount;
      case 'accountButtonCancel':
        return AppLocalizations.of(_context)!.accountButtonCancel;
    }

    throw ('Error in Localization#getText');
  }
}
