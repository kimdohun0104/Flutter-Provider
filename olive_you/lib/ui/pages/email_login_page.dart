import 'package:flutter/material.dart';
import 'package:olive_you/ui/common/common_app_bar.dart';
import 'package:olive_you/ui/common/common_button.dart';
import 'package:olive_you/ui/common/common_text_field.dart';
import 'package:olive_you/ui/theme/colors.dart';

class EmailLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(titleText: '로그인'),
      body: Container(
        padding: EdgeInsets.only(left: 36, right: 36, top: 30),
        child: Column(
          children: <Widget>[
            CommonTextField(label: '이메일'),
            SizedBox(height: 26),
            CommonTextField(label: '비밀번호'),
            SizedBox(height: 40),
            CommonButton(
              text: '로그인',
              onPressed: () {
                Navigator.pushNamed(context, '/enter');
              },
            ),
            SizedBox(height: 20),
            _buildForgetPassword(context)
          ],
        ),
      ),
    );
  }

  _buildForgetPassword(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/findpassword');
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            '비밀번호를 잊으셨나요?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colorPrimaryLight,
              fontSize: 14,
            ),
          ),
        ),
      );
}
