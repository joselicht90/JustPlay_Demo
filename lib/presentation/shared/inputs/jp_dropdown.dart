import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';

class JPDropdownField<T> extends StatelessWidget {
  final String name;
  final FocusNode? focusNode;
  final String? label;
  final AutovalidateMode? autovalidateMode;
  final String? Function(T?)? validator;
  final T? initialValue;
  final bool enabled;
  final String? hintText;
  final List<DropdownMenuItem<T>> items;
  final Function(T?)? onChanged;

  const JPDropdownField({
    Key? key,
    required this.name,
    this.focusNode,
    this.label,
    this.autovalidateMode,
    this.validator,
    this.initialValue,
    this.hintText,
    this.enabled = true,
    this.items = const [],
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<T>(
      name: name,
      focusNode: focusNode,
      initialValue: initialValue,
      enabled: enabled,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelStyle: const TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      items: items,
      style: context.textTheme.titleMedium,
      autovalidateMode: autovalidateMode,
      validator: validator,
    );
  }
}
