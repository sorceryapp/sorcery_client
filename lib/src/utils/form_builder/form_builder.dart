import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/button_callbacks.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/controller_providers.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/form_elements.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/form_buttons.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/localization.dart';
import 'package:sorcery_desktop_v3/src/utils/form_builder/validations.dart';

class FormBuilder extends ConsumerStatefulWidget {
  final Map<dynamic, dynamic> blueprint;

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
  final List<Widget> formWidgets = [];

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controllerProvider = ControllerProviders(
        providerName: widget.blueprint['controllerProviderName']);
    final controllerAction = controllerProvider.getAction(
      ref: ref,
      controllerActionName: widget.blueprint['controllerActionName'],
    );
    controllerProvider.handleErrors(ref: ref, context: context);

    // Dynamically create all formField widgets
    for (final fieldProps in widget.blueprint['formFields']) {
      final name = fieldProps['name'];
      final type = fieldProps['type'];
      final labelText = Localization(context: context)
          .getText(localizationKey: fieldProps['labelText']);

      _controllers[name] = _makeController(type: type);

      final newField = _makeField(
        name: name,
        type: type,
        controller: _controllers[name],
        labelText: labelText,
      );

      formWidgets.add(newField);
    }

    // Dynamically create all buttons
    for (final buttonProps in widget.blueprint['formButtons']) {
      switch (buttonProps['name']) {
        case 'submit':
          final callback = ButtonCallbacks(context: context).submit(
            formKey: _formKey,
            getFormData: _getFormData,
            controllerAction: controllerAction,
            redirectPath: buttonProps['redirectPath'],
          );
          final text = Localization(context: context)
              .getText(localizationKey: buttonProps['text']);

          formWidgets.add(FormButtons().primary(
            callback: callback,
            text: text,
          ));
          break;
        case 'cancel':
          final callback = ButtonCallbacks(context: context).cancel(
            redirectPath: buttonProps['redirectPath'],
          );
          final text = Localization(context: context)
              .getText(localizationKey: buttonProps['text']);

          formWidgets.add(FormButtons().secondary(
            callback: callback,
            text: text,
          ));
      }
    }

    return Form(
      key: _formKey,
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: formWidgets,
        ),
      ),
    );
  }

  Map<dynamic, dynamic> _getFormData() {
    Map formData = {};

    _controllers.forEach((fieldName, controller) {
      formData[fieldName] = controller.text;
    });

    return formData;
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
      case 'firstName':
        return Validations().firstName();
      case 'lastName':
        return Validations().lastName();
      case 'email':
        return Validations().email();
      case 'password':
        return Validations().password();
      case 'confirmPassword':
        return Validations().confirmPassword();
      case 'accountVerifyToken':
        return Validations().accountVerifyToken();
    }
  }
}
