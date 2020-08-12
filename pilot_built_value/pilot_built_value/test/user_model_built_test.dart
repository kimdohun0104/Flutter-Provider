import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:pilot_json_serialization/user_model.dart';

void main() {
  test('UserModelFromGithubApi', () async {
    final response = await http.get('https://api.github.com/users');
    final list = jsonDecode(response.body) as List;
    final results = list.map((e) => UserModel.fromJson(e)).toList();
    expect(results[0].login, 'mojombo');
  });
}
