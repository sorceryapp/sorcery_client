import 'package:flutter/material.dart';

class FormButtons {
  Widget primary(
      {required Function callback, required String text, required int flex}) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: () => callback(),
        child: Text(text),
      ),
    );
  }

  Widget secondary(
      {required Function callback, required String text, required int flex}) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: () => callback(),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey[400],
        ),
        child: Text(text),
      ),
    );
  }
}
