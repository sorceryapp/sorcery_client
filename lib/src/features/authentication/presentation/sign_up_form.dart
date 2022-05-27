import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/auth_controller.dart';
import 'package:sorcery_desktop_v3/src/utils/async_value_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      final controller = ref.read(authControllerProvider.notifier);
      final success = await controller.signUpWithEmailAndPassword(
        firstName: _firstName,
        lastName: _lastName,
        email: _email,
        password: _password,
        confirmPassword: _confirmPassword,
      );

      if (success) {
        if (!mounted) return;
        context.go('/verifyAccount');
      }
    }
  }

  _cancel() {
    if (!mounted) return;
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      authControllerProvider.select((state) => state.value),
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Form(
      key: _formKey,
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _firstNameTextController,
              validator: (value) => _validator(value),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: AppLocalizations.of(context)!.accountFieldFirstName,
              ),
            ),
            TextFormField(
              controller: _lastNameTextController,
              validator: (value) => _validator(value),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: AppLocalizations.of(context)!.accountFieldLastName,
              ),
            ),
            TextFormField(
              controller: _emailTextController,
              validator: (value) => _validator(value),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText:
                    AppLocalizations.of(context)!.accountFieldEmailAddress,
              ),
            ),
            TextFormField(
              controller: _passwordTextController,
              validator: (value) => _validator(value),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: AppLocalizations.of(context)!.accountFieldPassword,
              ),
            ),
            TextFormField(
              controller: _confirmPasswordTextController,
              validator: (value) => _validator(value),
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText:
                    AppLocalizations.of(context)!.accountFieldConfirmPassword,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(children: <Widget>[
                Expanded(
                  flex: 10,
                  child: ElevatedButton(
                    onPressed: () => _submit(),
                    child:
                        Text(AppLocalizations.of(context)!.accountButtonSignIn),
                  ),
                ),
                const Spacer(flex: 2),
                Expanded(
                  flex: 10,
                  child: ElevatedButton(
                    onPressed: () => _cancel(),
                    child:
                        Text(AppLocalizations.of(context)!.accountButtonCancel),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
