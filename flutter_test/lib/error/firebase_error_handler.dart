import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tdd_example/error/exception/conflict_exception.dart';
import 'package:flutter_tdd_example/error/exception/internal_exception.dart';
import 'package:flutter_tdd_example/error/exception/not_found_exception.dart';
import 'package:flutter_tdd_example/error/exception/unauthorized_exception.dart';

abstract class FirebaseErrorHandler {
  void throwProperException(Exception e);
}

class FirebaseErrorHandlerImpl implements FirebaseErrorHandler {
  @override
  void throwProperException(Exception e) {
    if (e is PlatformException) {
      switch (e.code) {
        case 'ERROR_EMAIL_ALREADY_IN_USE': throw ConflictException();
      }
    } else if (e is AuthException) {
      switch (e.code) {
        case 'ERROR_WRONG_PASSWORD': throw UnauthorizedException();
        case 'ERROR_USER_NOT_FOUND': throw NotFoundException();
      }
    }
    throw InternalException();
  }
}