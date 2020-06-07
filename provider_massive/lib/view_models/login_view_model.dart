import 'package:flutter/widgets.dart';
import 'package:provider_massive/enums/view_state.dart';
import 'package:provider_massive/locator.dart';
import 'package:provider_massive/services/authentication_service.dart';

class LoginViewModel with ChangeNotifier {
  final AutheniticationService _autheniticationService = locator<AutheniticationService>();
  
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    var userId = int.tryParse(userIdText);
    var success = await _autheniticationService.login(userId);
    setState(ViewState.Idle);
    return success;
  }
}