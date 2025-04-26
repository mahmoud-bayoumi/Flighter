import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/auth/data/models/sign_up_model.dart';

abstract class SignUpRepo {
  Future<Either<Failure, SignUpModel>> signUp(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword});
}
