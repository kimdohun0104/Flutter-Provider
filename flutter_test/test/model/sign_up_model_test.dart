import 'package:flutter_tdd_example/error/exception/bad_request_exception.dart';
import 'package:flutter_tdd_example/error/exception/internal_exception.dart';
import 'package:flutter_tdd_example/service/firebase_service.dart';
import 'package:flutter_tdd_example/ui/sign_up/model/sign_up_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

/// 테스트 코드는 다음과 같은 형식으로 작성됩니다
/// MethodName_StateUnderTest_ExpectedBehavior
/// 1. isAdult_AgeLessThan18_False
/// 2. withdrawMoney_InvalidAccount_ExceptionThrown
/// 3. admitStudent_MissingMandatoryFields_FailToAdmit

class MockFirebaseService extends Mock implements FirebaseService {}

void main() {
  group('sign up', () {
    test('signUp_DifferentPasswordRetype_ExceptionThrown', () {
      var firebaseService = MockFirebaseService();
      var model = SignUpModel(firebaseService);

      expect(
        () async => await model.signUp(
            'dikolight203@gmail.com', 'password', 'different_password'),
        throwsA(isInstanceOf<BadRequestException>()),
      );

      verifyZeroInteractions(firebaseService);
    });

    test('signUp_InternalServerError_ExceptionThrown', () {
      var firebaseService = MockFirebaseService();
      var model = SignUpModel(firebaseService);

      when(firebaseService.signUp('dikolight203@gmail.com', 'password'))
          .thenThrow(InternalException());

      expect(
        () async => await model.signUp(
            'dikolight203@gmail.com', 'password', 'password'),
        throwsA(isInstanceOf<InternalException>()),
      );
    });

    test('signUp_SuccessSignUp_ReturnFuture', () async {
      var firebaseService = MockFirebaseService();
      var model = SignUpModel(firebaseService);

      when(firebaseService.signUp('dikolight203@gmail.com', 'password'))
          .thenAnswer((_) => Future.value());

      var result =
          await model.signUp('dikolight203@gmail.com', 'password', 'password');

      expect(result, null);
    });
  });
}
