import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:github/user_model.dart';

import 'package:http/http.dart' as http;

class UserViewModel extends ChangeNotifier {
  List<UserModel> users;

  Future<List<UserModel>> getGithubUsers() async {
    final response = await http.get('https://api.github.com/users');
    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body);
      return json.map((model) => UserModel.fromJson(model)).toList();
    } else {
      throw Exception('Faild to load users');
    }
  }
}
