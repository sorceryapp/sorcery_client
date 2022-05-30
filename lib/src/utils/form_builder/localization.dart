import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Localization {
  final BuildContext _context;
  Localization({required context}) : _context = context;

  String getText({required String localizationKey}) {
    switch (localizationKey) {
      case 'accountFieldPassword':
        return AppLocalizations.of(_context)!.accountFieldPassword;
      case 'accountFieldConfirmPassword':
        return AppLocalizations.of(_context)!.accountFieldConfirmPassword;
      case 'accountButtonResetPassword':
        return AppLocalizations.of(_context)!.accountButtonResetPassword;
      case 'accountButtonCancel':
        return AppLocalizations.of(_context)!.accountButtonCancel;
    }

    throw ('Error in Localization#getText');
  }
}
