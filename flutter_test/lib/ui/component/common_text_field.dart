import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscure;

  CommonTextField({this.hintText, this.controller, this.obscure: false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.only(left: 12),
      ),
      obscureText: obscure,
      controller: controller,
    );
  }
}
