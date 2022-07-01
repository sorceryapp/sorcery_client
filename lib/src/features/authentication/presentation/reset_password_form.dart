import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:sorcery_desktop_v3/localization/l10n.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/auth_controller.dart';

class ResetPasswordForm extends ConsumerStatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends ConsumerState<ResetPasswordForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Column(
        // children: <Widget>[
        //   FormBuilder(
        //     key: _formKey,
        //     autovalidateMode: AutovalidateMode.disabled,
        //     child: SizedBox(
        //       width: 350,
        //       child: Column(
        //         children: [
        //           FormBuilderTextField(
        //             name: 'email',
        //             decoration: InputDecoration(
        //               labelText:
        //                   SorceryLocalizations.current.accountFieldEmailAddress,
        //             ),
        //             validator: FormBuilderValidators.compose([
        //               FormBuilderValidators.required(),
        //               FormBuilderValidators.email(),
        //             ]),
        //             keyboardType: TextInputType.number,
        //           ),
        //           FormBuilderTextField(
        //             name: 'password',
        //             decoration: InputDecoration(
        //               labelText:
        //                   SorceryLocalizations.current.accountFieldPassword,
        //             ),
        //             obscureText: true,
        //             validator: FormBuilderValidators.compose([
        //               FormBuilderValidators.required(),
        //               FormBuilderValidators.minLength(8),
        //             ]),
        //             keyboardType: TextInputType.number,
        //           ),
        //           FormBuilderTextField(
        //             name: 'confirmPassword',
        //             decoration: InputDecoration(
        //               labelText: SorceryLocalizations
        //                   .current.accountFieldConfirmPassword,
        //             ),
        //             obscureText: true,
        //             validator: FormBuilderValidators.compose([
        //               FormBuilderValidators.required(),
        //               (valueCandidate) {
        //                 if (valueCandidate !=
        //                     _formKey.currentState!.value['password']) {
        //                   return SorceryLocalizations
        //                       .current.passwordsDoNotMatchErrorText;
        //                 }

        //                 return null;
        //               }
        //             ]),
        //             keyboardType: TextInputType.number,
        //           ),
        //           Row(
        //             children: <Widget>[
        //               Expanded(
        //                 child: MaterialButton(
        //                   color: Theme.of(context).colorScheme.secondary,
        //                   child: Text(
        //                     SorceryLocalizations.current.accountButtonSignUp,
        //                     style: const TextStyle(color: Colors.white),
        //                   ),
        //                   onPressed: () {
        //                     _formKey.currentState!.save();
        //                     if (_formKey.currentState!.validate()) _submit();
        //                   },
        //                 ),
        //               ),
        //               const SizedBox(width: 20),
        //               Expanded(
        //                 child: MaterialButton(
        //                   color: Theme.of(context).colorScheme.secondary,
        //                   child: Text(
        //                     SorceryLocalizations.current.accountButtonCancel,
        //                     style: const TextStyle(color: Colors.white),
        //                   ),
        //                   onPressed: () => _cancel(),
        //                 ),
        //               ),
        //             ],
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ],
        );
  }

  // _submit() async {
  //   if (_formKey.currentState!.validate()) {
  //     final controller =
  //         ref.watch(authControllerStateNotifierProvider.notifier);
  //     final success = await controller.signUpWithEmailAndPassword(
  //       formData: _formKey.currentState!.value,
  //     );

  //     if (success) {
  //       if (!mounted) return;
  //       context.go('/verifyAccount');
  //     }
  //   }
  // }

  // _cancel() {
  //   if (!mounted) return;
  //   context.go('/');
  // }
}
