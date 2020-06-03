class UserModel {
  final String login;
  final String avatarUrl;

  UserModel({this.login, this.avatarUrl});

  factory UserModel.fromJson(Map<String, dynamic> from) {
    return UserModel(login: from['login'], avatarUrl: from['avatar_url']);
  }
}
