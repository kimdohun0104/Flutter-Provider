import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_massive/models/comment.dart';
import 'package:provider_massive/models/post.dart';
import 'package:provider_massive/models/user.dart';

class Api {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  var client = new http.Client();

  Future<User> getUserProfile(int userId) async {
    var response = await client.get('$endpoint/users/$userId');

    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    var response = await client.get('$endpoint/posts?userId=$userId');

    var parsed = json.decode(response.body) as List<dynamic>;

    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    final response = await client.get('$endpoint/comments?postId=$postId');
    Iterable iterable = jsonDecode(response.body);
    return iterable.map((e) => Comment.fromJson(e));
  }
}