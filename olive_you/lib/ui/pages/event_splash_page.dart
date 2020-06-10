import 'dart:async';

import 'package:flutter/material.dart';

class EventSplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EventSplashPageState();
}

class EventSplashPageState extends State<EventSplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Image.asset('assets/events/event_spring.jpg',
                fit: BoxFit.fill)));
  }

  @override
  void initState() {
    splash();
    super.initState();
  }

  Future<Timer> splash() async {
    return Timer(Duration(milliseconds: 1300), navigateToLogin);
  }

  void navigateToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
