// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  final String id;
  final dynamic groupValues;
  final List<dynamic> options;
  const RadioGroup({
    Key? key,
    required this.id,
    required this.options,
    required this.groupValues,
  }) : super(key: key);

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (final option in widget.options) {
      widgets.add(
        _makeRadioButton(
            title: option['name'],
            value: option['value'],
            onChanged: (newValue) =>
                setState(() => widget.groupValues[widget.id] = newValue)),
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
      groupValue: widget.groupValues[widget.id],
      value: value,
      onChanged: onChanged,
    );
  }
}
