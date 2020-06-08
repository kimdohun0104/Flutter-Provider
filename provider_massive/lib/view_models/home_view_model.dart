import 'package:provider_massive/base/base_view_model.dart';
import 'package:provider_massive/enums/view_state.dart';
import 'package:provider_massive/locator.dart';
import 'package:provider_massive/models/post.dart';
import 'package:provider_massive/services/api.dart';

class HomeViewModel extends BaseViewModel {
  Api _api = locator<Api>();

  List<Post> posts;
  
  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  } 
}