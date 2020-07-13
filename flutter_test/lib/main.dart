import 'package:flutter/material.dart';
import 'package:flutter_tdd_example/ui/login/login_page.dart';
import 'package:flutter_tdd_example/ui/main/main_page.dart';
import 'package:flutter_tdd_example/ui/sign_up/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TDD Sample',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (_) => LoginPage(),
        '/signup': (_) => SignUpPage(),
        '/main': (_) => MainPage()
      },
    );
  }
}
