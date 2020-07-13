import 'package:flutter_tdd_example/error/exception/bad_request_exception.dart';
import 'package:flutter_tdd_example/provider/base_model.dart';
import 'package:flutter_tdd_example/service/firebase_service.dart';

class SignUpModel extends BaseModel {
  final FirebaseService firebaseService;

  SignUpModel(this.firebaseService);

  Future signUp(String email, String password, String reType) async {
    if (password != reType) {
      throw BadRequestException('Different re-type');
    }

    await firebaseService.signUp(email, password);
  }
}
