import 'package:flutter/material.dart';
import 'package:flutter_tdd_example/localization/translation.dart';
import 'package:flutter_tdd_example/ui/component/common_button.dart';
import 'package:flutter_tdd_example/ui/component/common_text_field.dart';
import 'package:flutter_tdd_example/ui/login/model/login_model.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginModel>(
      builder: (context, model, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                CommonTextField(
                  hintText: Translation.of(context).trans('email'),
                ),
                SizedBox(height: 12),
                CommonTextField(
                  hintText: Translation.of(context).trans('password'),
                ),
                SizedBox(height: 24),
                CommonButton(
                  text: Translation.of(context).trans('login'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/main');
                  },
                ),
                SizedBox(height: 12),
                _buildSignUpNavigation(context),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildSignUpNavigation(BuildContext context) => GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/signup');
    },
    child: Text(
      Translation.of(context).trans('do_not_have_account'),
      style: TextStyle(fontSize: 16, color: Colors.lightBlue),
    ),
  );
}
