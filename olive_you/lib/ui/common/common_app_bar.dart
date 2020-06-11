import 'package:flutter/material.dart';

class CommonAppBar extends AppBar {
  final String titleText;

  CommonAppBar({this.titleText});

  @override
  Widget get title => Text(
        titleText,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'GodoB',
          fontSize: 20,
        ),
      );
}
