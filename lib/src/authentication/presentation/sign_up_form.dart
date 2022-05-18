import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/authentication/presentation/sign_up_form_controller.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

  String get _firstName => _firstNameTextController.text;
  String get _lastName => _lastNameTextController.text;
  String get _email => _emailTextController.text;
  String get _password => _passwordTextController.text;
  String get _confirmPassword => _confirmPasswordTextController.text;

  @override
  void dispose() {
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _confirmPasswordTextController.dispose();
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
      final controller = ref.read(signUpFormControllerProvider.notifier);
      final success = await controller.submit(
        firstName: _firstName,
        lastName: _lastName,
        email: _email,
        password: _password,
        confirmPassword: _confirmPassword,
      );
      if (success) {
        // widget.onSignedIn?.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _lastNameTextController,
            validator: (value) => _validator(value),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'First',
            ),
          ),
          TextFormField(
            controller: _firstNameTextController,
            validator: (value) => _validator(value),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Last',
            ),
          ),
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
          TextFormField(
            controller: _confirmPasswordTextController,
            validator: (value) => _validator(value),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Confirm Password',
            ),
          ),
          ElevatedButton(
            onPressed: () => _submit(),
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}
