import 'package:flutter/material.dart';
import 'package:olive_you/ui/common/common_app_bar.dart';
import 'package:olive_you/ui/common/common_button.dart';
import 'package:olive_you/ui/common/common_text_field.dart';

class EmailSignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(titleText: '회원가입'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 36, right: 36, top: 30),
          child: Column(
            children: <Widget>[
              CommonTextField(label: '이메일'),
              SizedBox(height: 26),
              CommonTextField(label: '비밀번호'),
              SizedBox(height: 26),
              CommonTextField(label: '비밀번호 확인'),
              SizedBox(height: 40),
              CommonButton(text: '회원가입'),
            ],
          ),
        ),
      ),
    );
  }
}
