import 'package:flutter_tdd_example/error/exception/conflict_exception.dart';
import 'package:flutter_tdd_example/error/exception/internal_exception.dart';
import 'package:flutter_tdd_example/provider/base_model.dart';
import 'package:flutter_tdd_example/service/firebase_service.dart';
import 'package:flutter_tdd_example/validator.dart';

class SignUpModel extends BaseModel {
  final FirebaseService firebaseService;

  SignUpModel(this.firebaseService);

  Future signUp(String email, String password, String reType) async {
    if (!Validator.isEmailValid(email)) {
      return Future.error('message_invalid_email');
    }

    if (password != reType) {
      return Future.error('message_different_re_type');
    }

    if (!Validator.isPasswordValid(password)) {
      return Future.error('message_invalid_password');
    }

    try {
      await firebaseService.signUp(email, password);
    } on ConflictException {
      return Future.error('message_conflict_email');
    } on InternalException {
      return Future.error('message_internal_error');
    }
  }
}
