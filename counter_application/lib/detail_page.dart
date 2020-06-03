import 'package:extraordinary_life/count_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<CountViewModel>(context);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Text(mainViewModel.count.toString()),
      ));
  }

  _buildAppBar(BuildContext context) => AppBar(
    title: Text('Detail'),
  );
}