import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonCallbacks {
  final BuildContext _context;

  ButtonCallbacks({
    required context,
  }) : _context = context;

  Function submit(
      {required String redirectPath,
      required GlobalKey<FormState> formKey,
      required Function controllerAction,
      required Map<dynamic, dynamic> payload}) {
    return () async {
      if (formKey.currentState!.validate()) {
        final success = await controllerAction(payload);

        if (success) {
          // if (!mounted) return;
          _context.go(redirectPath);
        }
      }
    };
  }

  Function cancel({required String redirectPath}) {
    return () {
      // if (!mounted) return;
      _context.go(redirectPath);
    };
  }
}
