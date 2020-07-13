import 'package:flutter/material.dart';

extension SnackbarExt on BuildContext {
  void showSnackbar(String message) {
    Scaffold.of(this).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
    ));
  }
}
