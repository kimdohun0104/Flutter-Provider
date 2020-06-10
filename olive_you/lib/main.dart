import 'package:flutter/material.dart';
import 'package:olive_you/ui/pages/email_login_page.dart';
import 'package:olive_you/ui/pages/event_splash_page.dart';
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
      },
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}
