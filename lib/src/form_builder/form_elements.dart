import 'package:flutter/material.dart';

class FormElements {
  final dynamic _controller;
  final Function _validator;

  FormElements({required controller, required validator})
      : _controller = controller,
        _validator = validator;

  Widget textFormField({required String labelText}) {
    return TextFormField(
      controller: _controller,
      validator: (value) => _validator(value),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
