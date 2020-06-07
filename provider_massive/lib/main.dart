import 'package:flutter/material.dart';
import 'package:provider_massive/ui/pages/home_page.dart';
import 'package:provider_massive/ui/pages/login_page.dart';
import 'package:provider_massive/ui/pages/post_page.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => LoginPage(),
        '/home': (_) => HomePage(),
        'post': (_) => PostPage()
      },
    );
  }
}