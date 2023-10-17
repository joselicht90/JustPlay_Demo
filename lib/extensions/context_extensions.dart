import 'package:flutter/material.dart';
import 'package:just_play_demo/utils/ui_error_handler.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  void showError({String? error}) {
    UiErrorHanlder.handleErrors(error ?? 'An error has ocurred', this);
  }
}
