import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';

import '../../../models/verify_reset_pass_code_model.dart';

abstract class VerifyResetPassCodeRepo {
  Future<Either<Failure, VerifyResetPassCodeModel>> verifyResetPassCode(
      {required String email, required String code});
}
