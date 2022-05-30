import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormElements {
  final dynamic _controller;
  final Function _validator;
  // final BuildContext _context;

  FormElements({required context, required controller, required validator})
      : _controller = controller,
        _validator = validator;
  // _context = context,

  Widget textFormField({required String labelText}) {
    return TextFormField(
      controller: _controller,
      validator: (value) => _validator(value),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        // labelText: AppLocalizations.of(_context)!.accountFieldPassword,
        labelText: labelText,
      ),
    );
  }
}
