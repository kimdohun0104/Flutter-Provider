import 'package:flutter/material.dart';
import 'package:olive_you/ui/theme/colors.dart';

class CommonTextField extends StatefulWidget {
  final String label;

  CommonTextField({this.label});

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState(label: label);
}

class _CommonTextFieldState extends State<CommonTextField> {
  final String label;

  _CommonTextFieldState({this.label});

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'GodoM',
      ),
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.only(left: 20, top: 18, bottom: 18, right: 20),
        labelText: label,
        labelStyle: TextStyle(
            color: _focusNode.hasFocus ? colorPrimaryLight : colorGray600),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: colorGray500)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: colorPrimaryLight),
        ),
      ),
    );
  }
}
