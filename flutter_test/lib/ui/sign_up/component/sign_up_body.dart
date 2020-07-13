import 'package:flutter/material.dart';
import 'package:flutter_tdd_example/error/exception/bad_request_exception.dart';
import 'package:flutter_tdd_example/error/exception/conflict_exception.dart';
import 'package:flutter_tdd_example/ui/component/common_button.dart';
import 'package:flutter_tdd_example/ui/component/common_text_field.dart';
import 'package:flutter_tdd_example/ui/component/progress_dialog.dart';
import 'package:flutter_tdd_example/ui/sign_up/model/sign_up_model.dart';
import 'package:flutter_tdd_example/ui/util/view_ext.dart';
import 'package:provider/provider.dart';

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reTypeController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    reTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpModel>(
      builder: (context, model, __) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                CommonTextField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                SizedBox(height: 12),
                CommonTextField(
                  hintText: 'Password',
                  controller: passwordController,
                  obscure: true,
                ),
                SizedBox(height: 12),
                CommonTextField(
                  hintText: 'Re-type',
                  controller: reTypeController,
                  obscure: true,
                ),
                SizedBox(height: 24),
                CommonButton(
                  text: 'Sign up',
                  onPressed: () => _onClickSignUp(model, context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onClickSignUp(SignUpModel model, BuildContext context) async {
    var pd = getProgressDialog(context, '회원가입 중...');
    await pd.show();
    model
        .signUp(
          emailController.text.trim(),
          passwordController.text.trim(),
          reTypeController.text.trim(),
        )
        .then((_) => Navigator.pop(context))
        .catchError((error) => {
              if (error is BadRequestException)
                _handleBadRequestException(context, error)
              else if (error is ConflictException)
                context.showSnackbar('이미 존재하는 이메일입니다')
              else
                context.showSnackbar('서버에 문제가 발생했습니다')
            })
        .whenComplete(() async => await pd.hide());
  }

  _handleBadRequestException(
    BuildContext context,
    BadRequestException exception,
  ) {
    String message;
    if (exception.message == 'Invalid email')
      message = '이메일이 유효하지 않습니다';
    else if (exception.message == 'Different re-type')
      message = '비밀번호 재입력이 일치하지 않습니다';
    else if (exception.message == 'Weak password') message = '비밀번호가 안전하지 않습니다';
    context.showSnackbar(message);
  }
}
