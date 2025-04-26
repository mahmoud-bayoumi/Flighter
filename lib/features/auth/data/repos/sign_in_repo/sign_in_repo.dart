import 'package:dartz/dartz.dart';

import '../../../../../core/utils/failure.dart';
import '../../models/sign_in_model/sign_in_model.dart';

abstract class SignInRepo {
  Future<Either<Failure, SignInModel>> signIn(
      {required String email, required String password});
}
