import 'package:flutter/material.dart';

class FormButtons {
  Widget primary({required Function callback, required String text}) {
    return ElevatedButton(
      onPressed: () => callback(),
      child: Text(text),
    );
  }

  Widget secondary({required Function callback, required String text}) {
    return ElevatedButton(
      onPressed: () => callback(),
      child: Text(text),
    );
  }
}
