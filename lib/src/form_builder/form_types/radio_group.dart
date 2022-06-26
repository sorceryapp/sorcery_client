import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  const RadioGroup({required this.options, Key? key}) : super(key: key);
  final List<dynamic> options;

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  int groupValue = -1;
  int get getGroupValue => groupValue;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (final option in widget.options) {
      widgets.add(
        _makeRadioButton(
            title: option['name'],
            value: option['id'],
            onChanged: (newValue) => setState(() => groupValue = newValue)),
      );
    }

    return Column(children: <Widget>[...widgets]);
  }

  Widget _makeRadioButton({
    required title,
    required value,
    required onChanged,
  }) {
    return RadioListTile(
      title: Text(title),
      groupValue: groupValue,
      value: value,
      onChanged: onChanged,
    );
  }
}
