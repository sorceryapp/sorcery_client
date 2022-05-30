import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/features/authentication/presentation/auth_controller.dart';
import 'package:sorcery_desktop_v3/src/utils/async_value_ui.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/button_callbacks.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/form_elements.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/form_buttons.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/localization.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/validations.dart';

class FormBuilder extends ConsumerStatefulWidget {
  final Map blueprint;

  const FormBuilder({
    Key? key,
    required this.blueprint,
  }) : super(key: key);

  @override
  ConsumerState<FormBuilder> createState() => _FormBuilderState();
}

class _FormBuilderState extends ConsumerState<FormBuilder> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      authControllerProvider.select((state) => state.value),
      (_, state) => state.showAlertDialogOnError(context),
    );

    // Each controller holds the value for a field
    final Map<String, dynamic> formControllers = {};

    // Render formFieldWidgets below
    final List<Widget> formFieldWidgets = [];

    // Dynamically create all formField widgets
    for (final fieldProps in widget.blueprint['formFields']) {
      formControllers[fieldProps['name']] =
          _makeController(type: fieldProps['type']);
      final newField = _makeField(
        name: fieldProps['name'],
        type: fieldProps['type'],
        controller: formControllers[fieldProps['name']],
        labelText: Localization(context: context)
            .getText(localizationKey: fieldProps['labelText']),
      );
      formFieldWidgets.add(newField);
    }

    // Dynamically create all buttons
    for (final buttonProps in widget.blueprint['formButtons']) {
      switch (buttonProps['name']) {
        case 'submit':
          final controllerAction = ref
              .read(authControllerProvider.notifier)
              .signInWithEmailAndPassword;
          final payload = _makePayload(controllers: formControllers);
          final callback = ButtonCallbacks(context: context).submit(
            redirectPath: buttonProps['redirectPath'],
            formKey: _formKey,
            controllerAction: controllerAction,
            payload: payload,
          );

          // Add new button to Widgets array
          formFieldWidgets.add(FormButtons().primary(
            callback: callback,
            text: Localization(context: context)
                .getText(localizationKey: buttonProps['text']),
          ));
          break;
        case 'cancel':
          final callback = ButtonCallbacks(context: context).cancel(
            redirectPath: buttonProps['redirectPath'],
          );

          // Add new button to Widgets array
          formFieldWidgets.add(FormButtons().secondary(
            callback: callback,
            text: Localization(context: context)
                .getText(localizationKey: buttonProps['text']),
          ));
      }
    }

    return Form(
      key: _formKey,
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: formFieldWidgets,
        ),
      ),
    );
  }

  dynamic _makeController({required type}) {
    switch (type) {
      case 'textFormField':
        return TextEditingController();
    }

    throw ('Error in _FormBuilderState#_makeController');
  }

  Widget _makeField(
      {required type, required controller, required name, required labelText}) {
    switch (type) {
      case 'textFormField':
        final validator = _getValidator(name: name);
        final formElements =
            FormElements(controller: controller, validator: validator);
        return formElements.textFormField(labelText: labelText);
    }

    throw ('Error in _FormBuilderState#_makeField');
  }

  dynamic _getValidator({required name}) {
    switch (name) {
      case 'password':
        return Validations().password();
      case 'confirmPassword':
        return Validations().confirmPassword();
    }
  }

  Map<dynamic, dynamic> _makePayload(
      {required Map<String, dynamic> controllers}) {
    Map payload = {};

    controllers.forEach((key, value) {
      payload[key] = value.text;
    });

    return payload;
  }
}
