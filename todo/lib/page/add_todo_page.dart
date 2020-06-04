import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/state/todo_state.dart';

class AddTodoPage extends StatelessWidget {
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TodoState todoState = Provider.of<TodoState>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Add new todo'),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Content'),
              maxLines: 5,
              controller: contentController,
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text('Select due date'),
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 360)));
              },
            ),
            SizedBox(height: 10),
            RaisedButton(
              color: Colors.blue,
              onPressed: () async {
                try {
                  await todoState.addTodo(contentController.text, '2020-08-08');
                  Navigator.pop(context);
                } catch (e) {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: Text('Add'),
              textColor: Colors.white,
            )
          ],
        ));
  }
}
