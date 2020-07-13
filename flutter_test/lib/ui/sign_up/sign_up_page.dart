import 'package:flutter/material.dart';
import 'package:flutter_tdd_example/error/firebase_error_handler.dart';
import 'package:flutter_tdd_example/service/firebase_service.dart';
import 'package:flutter_tdd_example/ui/sign_up/component/sign_up_body.dart';
import 'package:flutter_tdd_example/ui/sign_up/model/sign_up_model.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) =>
            SignUpModel(FirebaseServiceImpl(FirebaseErrorHandlerImpl())),
        child: Scaffold(
            appBar: AppBar(title: Text('Sign up'), centerTitle: true),
            body: SignUpBody()));
  }
}
