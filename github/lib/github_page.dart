import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github/user_model.dart';
import 'package:github/user_view_model.dart';
import 'package:provider/provider.dart';

class GithubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User')),
      body: FutureProvider(
          catchError: (context, e) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(e.toString())));
          },
          create: (_) async => UserViewModel().getGithubUsers(),
          child: Scaffold(
            body: Consumer<List<UserModel>>(
              builder: (_, model, __) {
                return model == null
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemBuilder: (_, index) {
                          return Text(model[index].login);
                        },
                        itemCount: model.length);
              },
            ),
          )),
    );
  }
}
