import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tdd_example/error/firebase_error_handler.dart';

abstract class FirebaseService {
  Future signUp(String email, String password);
}

class FirebaseServiceImpl implements FirebaseService {
  final FirebaseErrorHandler firebaseErrorHandler;

  FirebaseServiceImpl(this.firebaseErrorHandler);

  @override
  Future signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      firebaseErrorHandler.throwProperException(e);
    }
  }
}
