import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/auth/data/models/verify_model/verify_model.dart';

abstract class VerifyEmailRepo {
  Future<Either<Failure, VerifyModel>> verifyEmail(
      {required String email, required String code});
}
