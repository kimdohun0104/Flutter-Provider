import 'package:flutter/material.dart';
import 'package:provider_massive/base/base_view.dart';
import 'package:provider_massive/enums/view_state.dart';
import 'package:provider_massive/view_models/login_view_model.dart';

class LoginPage extends StatelessWidget {
  final _loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.yellow,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildLoginHeader(),
              LoginInputTextField(_loginController),
              model.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : _buildLoginButton(model, context)
            ],
          ),
        ),
      ),
    );
  }

  _buildLoginHeader() => Text(
        'Login',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      );

  _buildLoginButton(LoginViewModel loginViewModel, BuildContext context) =>
      FlatButton(
        child: Text('Login'),
        onPressed: () async {
          var loginSuccess = await loginViewModel.login(_loginController.text);
          if (loginSuccess) {
            Navigator.pushNamed(context, '/home');
          }
        },
        color: Colors.white,
      );
}

class LoginInputTextField extends StatefulWidget {
  final _loginController;

  LoginInputTextField(this._loginController);

  @override
  State<StatefulWidget> createState() =>
      LoginInputTextFieldState(_loginController);
}

class LoginInputTextFieldState extends State<LoginInputTextField> {
  final _loginController;

  LoginInputTextFieldState(this._loginController);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _loginController,
            decoration:
                InputDecoration(hintText: 'Enter a number between 1-10'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }
}
