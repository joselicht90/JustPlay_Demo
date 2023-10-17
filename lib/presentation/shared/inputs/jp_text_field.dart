import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:just_play_demo/extensions/context_extensions.dart';

class JPFormTextField extends StatelessWidget {
  final String name;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final int? maxLines;
  final bool obscureText;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final String? initialValue;
  final int? maxLength;
  final bool enabled;
  final int? minLines;

  const JPFormTextField({
    Key? key,
    required this.name,
    this.controller,
    this.focusNode,
    this.label,
    this.maxLines,
    this.obscureText = false,
    this.keyboardType,
    this.autovalidateMode,
    this.validator,
    this.initialValue,
    this.maxLength,
    this.enabled = true,
    this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      initialValue: initialValue,
      maxLength: maxLength,
      enabled: enabled,
      minLines: minLines,
      decoration: InputDecoration(
        labelText: label,
      ),
      style: context.textTheme.titleMedium,
      autovalidateMode: autovalidateMode,
      validator: validator,
    );
  }
}
