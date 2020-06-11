import 'package:flutter/material.dart';
import 'package:olive_you/ui/theme/colors.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CommonButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 256,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(
            color: colorGray[400],
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: colorGray[700],
            fontFamily: 'GodoM',
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
