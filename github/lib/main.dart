import 'package:flutter/material.dart';
import 'package:github/github_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Github', home: GithubPage());
  }
}
