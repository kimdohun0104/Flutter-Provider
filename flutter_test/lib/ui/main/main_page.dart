import 'package:flutter/material.dart';
import 'package:flutter_tdd_example/localization/translation.dart';
import 'package:flutter_tdd_example/ui/main/component/github_list_item.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(Translation.of(context).trans('main')),
            centerTitle: true),
        body: ListView.builder(
          itemBuilder: (context, index) => GithubListItem(),
          itemCount: 315,
        ));
  }
}
