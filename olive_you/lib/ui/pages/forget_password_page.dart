import 'package:flutter/material.dart';
import 'package:olive_you/ui/common/common_app_bar.dart';
import 'package:olive_you/ui/common/common_button.dart';
import 'package:olive_you/ui/common/common_text_field.dart';

class ForgetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(titleText: '비밀번호 찾기'),
      body: Container(
        padding: EdgeInsets.only(left: 36, right: 36, top: 30),
        child: Column(
          children: <Widget>[
            CommonTextField(label: '이메일'),
            SizedBox(height: 40),
            CommonButton(text: '비밀번호 재설정')
          ],
        ),
      ),
    );
  }

}