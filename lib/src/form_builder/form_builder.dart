import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorcery_desktop_v3/localization/l10n.dart';
import 'package:sorcery_desktop_v3/src/form_builder/button_callbacks.dart';
import 'package:sorcery_desktop_v3/src/form_builder/controller_providers.dart';
import 'package:sorcery_desktop_v3/src/form_builder/form_elements.dart';
import 'package:sorcery_desktop_v3/src/form_builder/form_buttons.dart';
import 'package:sorcery_desktop_v3/src/form_builder/form_props.dart';
import 'package:sorcery_desktop_v3/src/form_builder/localization.dart';
import 'package:sorcery_desktop_v3/src/form_builder/validators/validators.dart';
import 'package:url_launcher/link.dart';

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

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> formWidgets = [];
    final formMap = widget.blueprint['body'].toList();
    final formProps = getFormProps(type: widget.blueprint['type']);
    final controllerProvider = ControllerProviders(
        providerName: widget.blueprint['controllerProviderName']);
    final controllerAction = controllerProvider.getAction(
      ref: ref,
      controllerActionName: widget.blueprint['controllerActionName'],
    );
    controllerProvider.handleErrors(ref: ref, context: context);

    formMap.forEach((element) {
      List<Widget> widgets = _makeFormWidgets(
          controllerAction: controllerAction, element: element);
      formWidgets = [...formWidgets, ...widgets];
    });

    return Form(
      key: _formKey,
      child: SizedBox(
        width: formProps['width'].toDouble(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: formWidgets,
        ),
      ),
    );
  }

  List<Widget> _makeFormWidgets({
    required controllerAction,
    required element,
  }) {
    final type = element['type'] ?? element.keys.toList().first;

    switch (type) {
      case 'input':
        final id = element['id'];
        _controllers[id] = _makeController(type: type);

        return [
          _makeFormField(
            type: type,
            controller: _controllers[id],
            element: element,
          )
        ];
      case 'button':
        return [
          _makeFormButton(
              controllerAction: controllerAction, buttonProps: element)
        ];
      case 'row':
        List<Widget> widgets = [];

        for (final element in element['row']) {
          _makeFormWidgets(
            controllerAction: controllerAction,
            element: element,
          ).forEach((widget) => widgets.add(widget));
        }

        return [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(children: <Widget>[...widgets]),
          )
        ];
      case 'spacer':
        return [Spacer(flex: element['flex'])];
      case 'link':
        return [
          Link(
            uri: Uri.parse(element['attributes']['uri']),
            builder: (context, followLink) => TextButton(
              onPressed: followLink,
              child: Text(
                Localization()
                    .getText(localizationKey: element['attributes']['target']),
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ];
      default:
        throw ('Error: unknown section name');
    }
  }

  Widget _makeFormField({
    required type,
    required controller,
    required element,
  }) {
    switch (type) {
      case 'input':
        final id = element['id'];
        final label = Localization()
            .getText(localizationKey: element['attributes']['label']);

        final validator = _getValidator(id: id);
        final obscureText = element['attributes']['obscureText'] ?? false;
        final formElements =
            FormElements(controller: controller, validator: validator);
        return formElements.input(label: label, obscureText: obscureText);
    }

    throw ('Error in _FormBuilderState#_makeFormField');
  }

  Widget _makeFormButton({required controllerAction, required buttonProps}) {
    switch (buttonProps['id']) {
      case 'submit':
        final callback = ButtonCallbacks(context: context).submit(
          formKey: _formKey,
          getFormData: _getFormData,
          controllerAction: controllerAction,
          redirectPath: buttonProps['attributes']['redirectPath'],
        );
        final text = Localization()
            .getText(localizationKey: buttonProps['attributes']['text']);

        return FormButtons().primary(
          callback: callback,
          text: text,
          flex: buttonProps['attributes']['flex'],
        );
      case 'cancel':
        final callback = ButtonCallbacks(context: context).cancel(
          redirectPath: buttonProps['attributes']['redirectPath'],
        );
        final text = Localization()
            .getText(localizationKey: buttonProps['attributes']['text']);

        return FormButtons().secondary(
          callback: callback,
          text: text,
          flex: buttonProps['attributes']['flex'],
        );
      default:
        throw ('Error: error in _FormBuilderState#_makeFormButton');
    }
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
      case 'input':
        return TextEditingController();
    }

    throw ('Error in _FormBuilderState#_makeController');
  }

  dynamic _getValidator({required id}) {
    switch (id) {
      case 'firstName':
        return FormBuilderValidators.required();
      case 'lastName':
        return FormBuilderValidators.required();
      case 'email':
        return FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
        ]);
      case 'password':
        return FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.minLength(8),
        ]);
      case 'confirmPassword':
        return FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          (valueCandidate) {
            if (valueCandidate != _controllers['password']!.text) {
              return SorceryLocalizations.current.passwordsDoNotMatchErrorText;
            }

            return null;
          }
        ]);
      case 'accountVerifyToken':
        return FormBuilderValidators.required();
    }
  }
}
