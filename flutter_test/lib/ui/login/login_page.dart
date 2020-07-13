import 'package:flutter/material.dart';
import 'package:flutter_tdd_example/localization/translation.dart';
import 'package:flutter_tdd_example/ui/login/component/login_body.dart';
import 'package:flutter_tdd_example/ui/login/model/login_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginModel(),
      child: Scaffold(
          appBar: AppBar(
              title: Text(Translation.of(context).trans('login')),
              centerTitle: true),
          body: LoginBody()),
    );
  }
}
