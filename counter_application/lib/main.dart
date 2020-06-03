import 'package:extraordinary_life/count_page.dart';
import 'package:extraordinary_life/count_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'count_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CountViewModel()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Extraordinary',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity),
            home: CountPage()));
  }
}
