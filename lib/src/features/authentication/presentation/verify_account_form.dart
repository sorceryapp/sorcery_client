import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/auth_controller.dart';
import 'package:sorcery_desktop_v3/src/utils/async_value_ui.dart';

class VerifyAccountForm extends ConsumerStatefulWidget {
  const VerifyAccountForm({Key? key}) : super(key: key);

  @override
  ConsumerState<VerifyAccountForm> createState() => _VerifyAccountFormState();
}

class _VerifyAccountFormState extends ConsumerState<VerifyAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final _tokenTextController = TextEditingController();

  String get _token => _tokenTextController.text;

  @override
  void dispose() {
    _tokenTextController.dispose();
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
      final success = await controller.verify(
        token: _token,
      );

      if (success) {
        if (!mounted) return;
        context.go('/');
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
            controller: _tokenTextController,
            validator: (value) => _validator(value),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Token',
            ),
          ),
          ElevatedButton(
            onPressed: () => _submit(),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
