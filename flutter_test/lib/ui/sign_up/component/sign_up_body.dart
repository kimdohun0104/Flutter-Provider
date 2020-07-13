import 'package:flutter/material.dart';
import 'package:flutter_tdd_example/localization/translation.dart';
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
                  hintText: Translation.of(context).trans('email'),
                  controller: emailController,
                ),
                SizedBox(height: 12),
                CommonTextField(
                  hintText: Translation.of(context).trans('password'),
                  controller: passwordController,
                  obscure: true,
                ),
                SizedBox(height: 12),
                CommonTextField(
                  hintText: Translation.of(context).trans('re_type'),
                  controller: reTypeController,
                  obscure: true,
                ),
                SizedBox(height: 24),
                CommonButton(
                  text: Translation.of(context).trans('sign_up'),
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
    var pd = getProgressDialog(context, Translation.of(context).trans('waiting'));
    await pd.show();
    model
        .signUp(
          emailController.text.trim(),
          passwordController.text.trim(),
          reTypeController.text.trim(),
        )
        .then((_) => Navigator.pop(context))
        .catchError((error) => context.showSnackbar(Translation.of(context).trans(error)))
        .whenComplete(() async => await pd.hide());
  }
}
