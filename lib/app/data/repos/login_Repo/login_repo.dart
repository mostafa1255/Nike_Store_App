import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/errors/faliure.dart';

abstract class LoginRepo {
  Future<Either<Faliures, UserCredential>> signInwithEmailandPassword({
    required String email,
    required String password,
    required BuildContext context,
  });
  Future<Either<Faliures, UserCredential>> signInwithGoogle();
}
