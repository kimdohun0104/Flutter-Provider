import 'package:flutter/material.dart';
import 'package:olive_you/ui/theme/colors.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logos/logo_olives.png'),
            SizedBox(height: 10),
            _buildWelcomeText(),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(left: 80, right: 80),
              child: Column(children: <Widget>[
                LoginSelectionButton(
                  backgroundColor: colorGoogleRed,
                  iconAssetPath: 'assets/icons/ic_google_plus_square.png',
                  text: 'Google로 로그인',
                  borderColor: Colors.transparent,
                  textColor: Colors.white,
                ),
                SizedBox(height: 16),
                LoginSelectionButton(
                  backgroundColor: colorFacebookBlue,
                  iconAssetPath: 'assets/icons/ic_facebook_square.png',
                  text: 'Facebook으로 로그인',
                  borderColor: Colors.transparent,
                  textColor: Colors.white,
                ),
                SizedBox(height: 10),
                _buildOrLine(),
                SizedBox(height: 10),
                LoginSelectionButton(
                  backgroundColor: Colors.white,
                  iconAssetPath: 'assets/icons/ic_email.png',
                  text: '이메일로 로그인',
                  borderColor: colorGray400,
                  textColor: colorGray700,
                  onPressed: () { Navigator.pushNamed(context, '/login/email'); },
                ),
                SizedBox(height: 16),
                LoginSelectionButton(
                  backgroundColor: Colors.white,
                  iconAssetPath: 'assets/icons/ic_person_add.png',
                  text: '이메일로 회원가입',
                  borderColor: colorGray400,
                  textColor: colorGray700,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  _buildWelcomeText() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Olive',
            style: TextStyle(
              fontSize: 20,
              color: colorOliveGreen,
              fontFamily: 'GodoB',
            ),
          ),
          Text(
            'U',
            style: TextStyle(
              fontSize: 20,
              color: colorOliveBlue,
              fontFamily: 'GodoB',
            ),
          ),
          Text(
            '에 오신 것을 환영합니다',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'GodoM',
            ),
          )
        ],
      );

  _buildOrLine() => Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: colorGray400,
              height: 1,
            ),
            flex: 1,
          ),
          SizedBox(width: 6),
          Text(
            '또는',
            style: TextStyle(
              color: colorGray400,
              fontSize: 12,
            ),
          ),
          SizedBox(width: 6),
          Expanded(
            child: Container(
              color: colorGray400,
              height: 1,
            ),
            flex: 1,
          ),
        ],
      );
}

class LoginSelectionButton extends StatelessWidget {
  final Color backgroundColor;
  final String iconAssetPath;
  final String text;
  final Color borderColor;
  final Color textColor;
  final Function onPressed;

  LoginSelectionButton(
      {this.backgroundColor,
      this.iconAssetPath,
      this.text,
      this.borderColor,
      this.textColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.only(left: 14, top: 12, bottom: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
        ),
        child: Row(
          children: <Widget>[
            Image.asset(iconAssetPath),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
