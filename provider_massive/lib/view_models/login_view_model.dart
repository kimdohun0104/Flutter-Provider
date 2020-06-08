import 'package:provider_massive/base/base_view_model.dart';
import 'package:provider_massive/enums/view_state.dart';
import 'package:provider_massive/locator.dart';
import 'package:provider_massive/services/authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  final AutheniticationService _autheniticationService =
      locator<AutheniticationService>();

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    
    var userId = int.tryParse(userIdText);
    var success = await _autheniticationService.login(userId);
    setState(ViewState.Idle);
    return success;
  }
}
