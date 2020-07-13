import 'package:flutter_tdd_example/error/exception/conflict_exception.dart';
import 'package:flutter_tdd_example/error/exception/internal_exception.dart';
import 'package:flutter_tdd_example/service/firebase_service.dart';
import 'package:flutter_tdd_example/ui/sign_up/model/sign_up_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseService extends Mock implements FirebaseService {}

void main() {
  group('sign up', () {
    test('InvalidEmail', () {
      var firebaseService = MockFirebaseService();
      var model = SignUpModel(firebaseService);

      model
          .signUp('dikolight', 'password', 'password')
          .catchError((err) => expect(err.toString(), '유효하지 않은 이메일입니다'));
    });

    test('DifferentPassword', () {
      var firebaseService = MockFirebaseService();
      var model = SignUpModel(firebaseService);

      model
          .signUp('dikolight203@gmail.com', 'password', 'different_password')
          .catchError((err) => expect(err.toString(), '비밀번호 재입력이 일치하지 않습니다'));
    });

    test('InvalidPassword', () {
      var firebaseService = MockFirebaseService();
      var model = SignUpModel(firebaseService);

      model
          .signUp('dikolight203@gmail.com', 'hi', 'hi')
          .catchError((err) => expect(err.toString(), '비밀번호는 6자리를 넘겨야 합니다'));
    });

    test('ConflictEmail', () {
      var firebaseService = MockFirebaseService();
      var model = SignUpModel(firebaseService);

      when(firebaseService.signUp('dikolight203@gmail.com', 'password'))
          .thenThrow(ConflictException());

      model.signUp('dikolight203@gmail.com', 'password', 'password').catchError(
          (err) => expect(err.toString(), '이메일을 사용하는 계정이 이미 존재합니다'));
    });

    test('InternalServerError', () {
      var firebaseService = MockFirebaseService();
      var model = SignUpModel(firebaseService);

      when(firebaseService.signUp('dikolight203@gmail.com', 'password'))
          .thenThrow(InternalException());

      model
          .signUp('dikolight203@gmail.com', 'password', 'password')
          .catchError((err) => expect(err.toString(), '서버에 문제가 발생했습니다'));
    });

    test('Success', () async {
      var firebaseService = MockFirebaseService();
      var model = SignUpModel(firebaseService);

      when(firebaseService.signUp('dikolight203@gmail.com', 'password'))
          .thenAnswer((_) => Future.value());

      final result =
          await model.signUp('dikolight203@gmail.com', 'password', 'password');

      expect(result, null);
    });
  });
}
