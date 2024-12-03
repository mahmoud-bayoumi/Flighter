import 'package:dartz/dartz.dart';
import 'package:flighter/features/auth/data/models/sign_in_model.dart';

import '../../../../../core/utils/failure.dart';

abstract class SignInRepo {
  Future<Either<Failure, SignInModel>> signIn(
      {required String email, required String password});
}
