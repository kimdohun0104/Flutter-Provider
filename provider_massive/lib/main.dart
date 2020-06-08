import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_massive/models/user.dart';
import 'package:provider_massive/services/authentication_service.dart';
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
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (context) =>
          locator<AutheniticationService>().userController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (_) => LoginPage(),
          '/home': (_) => HomePage(),
          '/post': (_) => PostPage()
        },
      ),
    );
  }
}
