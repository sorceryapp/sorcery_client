import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/auth_controller.dart';
import 'package:sorcery_desktop_v3/src/utils/async_value_ui.dart';

class VerifyAccountResendForm extends ConsumerStatefulWidget {
  const VerifyAccountResendForm({Key? key}) : super(key: key);

  @override
  ConsumerState<VerifyAccountResendForm> createState() =>
      _VerifyAccountResendFormState();
}

class _VerifyAccountResendFormState
    extends ConsumerState<VerifyAccountResendForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  String get _email => _emailTextController.text;
  String get _password => _passwordTextController.text;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  _validator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  _submit() async {
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(authControllerProvider.notifier);
      final success = await controller.verifyAccountResend(
        email: _email,
        password: _password,
      );

      if (success) {
        if (!mounted) return;
        context.go('/verifyAccount');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      authControllerProvider.select((state) => state.value),
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _emailTextController,
            validator: (value) => _validator(value),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          TextFormField(
            controller: _passwordTextController,
            validator: (value) => _validator(value),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: () => _submit(),
            child: const Text('Resend Verify Account Token'),
          ),
        ],
      ),
    );
  }
}
