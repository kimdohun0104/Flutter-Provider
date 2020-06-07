import 'dart:async';

import 'package:provider_massive/locator.dart';
import 'package:provider_massive/models/user.dart';
import 'package:provider_massive/services/api.dart';

class AutheniticationService {
  Api _api = locator<Api>();
  
  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    var fetchUser = await _api.getUserProfile(userId);

    var hasUser = fetchUser != null;
    if (hasUser) {
      userController.add(fetchUser);
    }

    return hasUser;
  }
}