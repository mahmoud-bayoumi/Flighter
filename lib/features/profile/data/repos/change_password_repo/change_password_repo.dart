import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/profile/data/models/change_password_model.dart';

abstract class ChangePasswordRepo {
  Future<Either<Failure, ChangePasswordModel>> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmNewPassword});
}
