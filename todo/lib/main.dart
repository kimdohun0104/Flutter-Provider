import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/page/add_todo_page.dart';
import 'package:todo/page/main_page.dart';
import 'package:todo/page/trashcan_page.dart';
import 'package:todo/state/todo_state.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoState())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.purple,
        ),
        title: 'Todo App',
        routes: {
          '/': (BuildContext context) => MainPage(),
          '/add_todo': (BuildContext context) => AddTodoPage(),
          '/trashcan': (BuildContext context) => TrashcanPage()
        },
      ),
    );
  }
}
