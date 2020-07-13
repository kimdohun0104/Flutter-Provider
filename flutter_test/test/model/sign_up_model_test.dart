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
          .catchError((err) => expect(err, 'message_invalid_email'));
    });

    test('DifferentPassword', () {
      var firebaseService = MockFirebaseService();
      var model = SignUpModel(firebaseService);

      model
          .signUp('dikolight203@gmail.com', 'password', 'different_password')
          .catchError((err) => expect(err, 'message_different_re_type'));
    });

    test('InvalidPassword', () {
      var firebaseService = MockFirebaseService();
      var model = SignUpModel(firebaseService);

      model
          .signUp('dikolight203@gmail.com', 'hi', 'hi')
          .catchError((err) => expect(err, 'message_invalid_password'));
    });

    test('ConflictEmail', () {
      var firebaseService = MockFirebaseService();
      var model = SignUpModel(firebaseService);

      when(firebaseService.signUp('dikolight203@gmail.com', 'password'))
          .thenThrow(ConflictException());

      model.signUp('dikolight203@gmail.com', 'password', 'password').catchError(
          (err) => expect(err, 'message_conflict_email'));
    });

    test('InternalServerError', () {
      var firebaseService = MockFirebaseService();
      var model = SignUpModel(firebaseService);

      when(firebaseService.signUp('dikolight203@gmail.com', 'password'))
          .thenThrow(InternalException());

      model
          .signUp('dikolight203@gmail.com', 'password', 'password')
          .catchError((err) => expect(err, 'message_internal_error'));
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
