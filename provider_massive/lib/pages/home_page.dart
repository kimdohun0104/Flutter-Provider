import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_massive/base/base_view.dart';
import 'package:provider_massive/enums/view_state.dart';
import 'package:provider_massive/models/post.dart';
import 'package:provider_massive/models/user.dart';
import 'package:provider_massive/view_models/home_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {
        model.getPosts(Provider.of<User>(context).id);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.yellow,
        body: model.state == ViewState.Idle
            ? Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('Welcome ${Provider.of<User>(context).name}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('Here are all your posts'),
                  ),
                  Expanded(child: getPostsUi(model.posts)),
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => PostListItem(
            post: posts[index],
            onTap: () {
              print(posts[index].title);
              Navigator.pushNamed(context, '/post', arguments: posts[index]);
            },
          ));
}

class PostListItem extends StatelessWidget {
  final Post post;
  final Function onTap;
  const PostListItem({this.post, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3.0,
                  offset: Offset(0.0, 2.0),
                  color: Color.fromARGB(80, 0, 0, 0))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              post.title,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),
            ),
            Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis)
          ],
        ),
      ),
    );
  }
}
