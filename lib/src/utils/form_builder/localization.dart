import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Localization {
  final BuildContext _context;
  Localization({required context}) : _context = context;

  String getText({required String localizationKey}) {
    String text = '';

    switch (localizationKey) {
      case 'accountFieldPassword':
        text = AppLocalizations.of(_context)!.accountFieldPassword;
        break;
      case 'accountFieldConfirmPassword':
        text = AppLocalizations.of(_context)!.accountFieldConfirmPassword;
        break;
      case 'accountButtonResetPassword':
        text = AppLocalizations.of(_context)!.accountButtonResetPassword;
        break;
      case 'accountButtonCancel':
        text = AppLocalizations.of(_context)!.accountButtonCancel;
        break;
    }

    return text;
  }
}
