import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonCallbacks {
  final BuildContext _context;

  ButtonCallbacks({
    required context,
  }) : _context = context;

  // Function submit({
  //   required GlobalKey<FormState> formKey,
  //   required Function getFormData,
  //   required Function controllerAction,
  //   required String redirectPath,
  // }) {
  //   return () async {
  //     if (formKey.currentState!.validate()) {
  //       final formData = getFormData();
  //       final success = await controllerAction(formData: formData);

  //       if (success) {
  //         // if (!mounted) return;
  //         _context.go(redirectPath);
  //       }
  //     }
  //   };
  // }

  Function submit({
    required GlobalKey<FormState> formKey,
    required Function getFormData,
    required Function controllerAction,
    required String redirectPath,
  }) {
    return () async {
      if (formKey.currentState!.validate()) {
        final formData = {
          'name': 'Berry Winkle',
          'language_id': 1,
          'framework_id': 1,
          'type_id': 1,
        };
        final app = await controllerAction(formData: formData);
        print('App: $app');
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
