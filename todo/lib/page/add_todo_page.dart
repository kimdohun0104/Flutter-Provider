import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              child: Text('Add'),
              textColor: Colors.white,
            )
          ],
        ));
  }
}
