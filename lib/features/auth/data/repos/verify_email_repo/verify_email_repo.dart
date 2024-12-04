import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/auth/data/models/verify_email_model.dart';

abstract class VerifyEmailRepo {
  Future<Either<Failure, VerifyEmailModel>> verifyEmail(
      {required String email, required String code});
}
