import 'package:flutter/material.dart';
import 'package:flutter_tdd_example/ui/main/component/github_list_item.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Main'), centerTitle: true),
        body: ListView.builder(
          itemBuilder: (context, index) => GithubListItem(),
          itemCount: 315,
        ));
  }
}
