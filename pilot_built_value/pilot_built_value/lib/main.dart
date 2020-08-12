import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pilot_json_serialization/user_model.dart';

void main() {
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Github')),
        body: FutureBuilder<List<UserModel>>(
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return _buildUserList(snapshot.data);
            else
              return _buildLoading();
          },
          future: getUsers(),
        ));
  }

  _buildUserList(List<UserModel> users) => ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 24, top: 8, bottom: 8, right: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(users[index].avatarUrl),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(width: 24),
                Text(
                  users[index].login,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                )
              ],
            ),
          );
        },
        itemCount: users.length,
      );

  _buildLoading() => Center(
        child: CircularProgressIndicator(),
      );

  Future<List<UserModel>> getUsers() async {
    final response = await http.get('https://api.github.com/users');
    final list = jsonDecode(response.body) as List;
    return list.map((e) => UserModel.fromJson(e)).toList();
  }
}
