import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiErrorHanlder {
  static handleErrors(String? message, BuildContext context) {
    if (message != null) {
      _showError(msg: message, context: context);
    }
  }

  static Future _showError(
      {required String msg, required BuildContext context}) async {
    if (Platform.isMacOS || Platform.isIOS) {
      return showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(msg),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
          duration: const Duration(seconds: 7),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          ),
        ),
      );
    }
  }
}
