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
      return Future.error('유효하지 않은 이메일입니다');
    }

    if (password != reType) {
      return Future.error('비밀번호 재입력이 일치하지 않습니다');
    }

    if (!Validator.isPasswordValid(password)) {
      return Future.error('비밀번호는 6자리를 넘겨야 합니다');
    }

    try {
      await firebaseService.signUp(email, password);
    } on ConflictException {
      return Future.error('이메일을 사용하는 계정이 이미 존재합니다');
    } on InternalException {
      return Future.error('서버에 문제가 발생했습니다');
    }
  }
}
