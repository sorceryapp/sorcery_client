import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignInForm extends StatefulWidget {
  SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderTextField(
          name: 'Email',
          decoration: const InputDecoration(
            labelText:
                'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
          ),
          // onChanged: _onChanged,
          // valueTransformer: (text) => num.tryParse(text),
          validator: FormBuilderValidators.required(),
          keyboardType: TextInputType.number,
        ),
        FormBuilderTextField(
          name: 'Password',
          decoration: const InputDecoration(
            labelText:
                'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
          ),
          // onChanged: _onChanged,
          // valueTransformer: (text) => num.tryParse(text),
          validator: FormBuilderValidators.required(),
          keyboardType: TextInputType.number,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                color: Theme.of(context).colorScheme.secondary,
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    print(_formKey.currentState!.value);
                  } else {
                    print("validation failed");
                  }
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: MaterialButton(
                color: Theme.of(context).colorScheme.secondary,
                child: const Text(
                  "Reset",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _formKey.currentState!.reset();
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
