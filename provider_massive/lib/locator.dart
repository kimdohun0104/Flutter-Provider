import 'package:get_it/get_it.dart';
import 'package:provider_massive/services/api.dart';
import 'package:provider_massive/services/authentication_service.dart';
import 'package:provider_massive/view_models/login_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AutheniticationService());
  locator.registerLazySingleton(() => Api());
  
  locator.registerLazySingleton(() => LoginViewModel());
}