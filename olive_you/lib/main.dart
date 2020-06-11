import 'package:flutter/material.dart';
import 'package:olive_you/ui/pages/email_login_page.dart';
import 'package:olive_you/ui/pages/email_signup_page.dart';
import 'package:olive_you/ui/pages/enter_page.dart';
import 'package:olive_you/ui/pages/event_splash_page.dart';
import 'package:olive_you/ui/pages/find_location_page.dart';
import 'package:olive_you/ui/pages/forget_password_page.dart';
import 'package:olive_you/ui/pages/input_information_page.dart';
import 'package:olive_you/ui/pages/login_page.dart';

void main() {
  runApp(OliveYouApp());
}

class OliveYouApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash/event',
      routes: {
        '/splash/event': (_) => EventSplashPage(),
        '/login': (_) => LoginPage(),
        '/login/email': (_) => EmailLoginPage(),
        '/findpassword': (_) => ForgetPasswordPage(),
        '/signup/email': (_) => EmailSignupPage(),
        '/enter': (_) => EnterPage(),
        '/inputinformation': (_) => InputInformationPage(),
        '/findlocation': (_) => FindLocationPage(),
      },
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}
