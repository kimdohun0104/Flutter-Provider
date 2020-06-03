import 'package:extraordinary_life/count_view_model.dart';
import 'package:extraordinary_life/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countViewModel = Provider.of<CountViewModel>(context);

    return Scaffold(
      appBar: _buildAppbar(context),
      floatingActionButton: _buildFab(countViewModel, context),
      body: Center(
        child: Text('count: ${countViewModel.count}'))
      );
  }

  _buildAppbar(BuildContext context) => AppBar(
    title: Text('Main')
  );

  _buildFab(CountViewModel countViewModel, BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      FloatingActionButton(
        heroTag: 'fab1',
        onPressed: () { 
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => DetailPage()));
        },
        child: Icon(Icons.details)
      ),
      SizedBox(height: 10),
      FloatingActionButton(
        heroTag: 'fab2',
        onPressed: countViewModel.increase,
        child: Icon(Icons.add)),
      SizedBox(height: 10),
      FloatingActionButton(
        heroTag: 'fab3',
        onPressed: countViewModel.decrease,
        child: Icon(Icons.remove))
    ],
  );
}
