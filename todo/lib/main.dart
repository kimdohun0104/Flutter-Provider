import 'package:flutter/material.dart';
import 'package:todo/page/add_todo_page.dart';
import 'package:todo/page/main_page.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      title: 'Todo App',
      routes: {
        '/': (BuildContext context) => MainPage(),
        '/add_todo': (BuildContext context) => AddTodoPage()
      },
    );
  }

}