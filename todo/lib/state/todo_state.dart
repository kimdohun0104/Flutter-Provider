import 'package:flutter/cupertino.dart';
import 'package:todo/db/database.dart';
import 'package:todo/model/todo_model.dart';

class TodoState with ChangeNotifier {
  List<TodoModel> _todos = List<TodoModel>();
  List<TodoModel> get todos => _todos;

  Future addTodo(String content, String dueDate) async {
    TodoModel newModel = TodoModel(id: 0, content: content, dueDate: dueDate);

    await insertTodo(newModel);
    _todos.add(newModel);
    notifyListeners();
  }
}
