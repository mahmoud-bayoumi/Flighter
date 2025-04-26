import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';

import '../../../../../profile/data/models/change_password_model.dart';

abstract class ResetPasswordRepo {
  Future<Either<Failure, ChangePasswordModel>> resetPassword(
      {required String email,
      required String newPassword,
      required String confirmNewPassword});
}
