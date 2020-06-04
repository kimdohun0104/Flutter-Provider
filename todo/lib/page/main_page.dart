import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        child: _buildTodoList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_todo');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _buildAppBar(BuildContext context) => AppBar(
        title: Text('Todo'),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.history, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/trashcan');
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6)),
                  constraints: BoxConstraints(minWidth: 14, minHeight: 14),
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )
        ],
      );

  _buildTodoList() => ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.lightBlue[200]),
                child: Text(
                  'Hello',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ));
        },
        itemCount: 4,
      );
}
