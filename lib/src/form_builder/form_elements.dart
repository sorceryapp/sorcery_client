import 'package:flutter/material.dart';

class FormElements {
  final dynamic _controller;
  final Function _validator;

  FormElements({required controller, required validator})
      : _controller = controller,
        _validator = validator;

  Widget input({required String label}) {
    return TextFormField(
      controller: _controller,
      validator: (value) => _validator(value),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: label,
      ),
    );
  }
}
