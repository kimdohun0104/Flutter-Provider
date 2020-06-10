import 'package:flutter/material.dart';
import 'package:olive_you/ui/common/common_button.dart';
import 'package:olive_you/ui/common/common_text_field.dart';
import 'package:olive_you/ui/theme/colors.dart';

class EmailLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 36, right: 36, top: 30),
        child: Column(
          children: <Widget>[
            CommonTextField(label: '이메일'),
            SizedBox(height: 26),
            CommonTextField(label: '비밀번호'),
            SizedBox(height: 40),
            CommonButton(text: '로그인'),
            SizedBox(height: 20),
            Text(
              '비밀번호를 잊으셨나요?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: colorPrimaryLight,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        '로그인',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'GodoB',
        ),
      ),
    );
  }
}
