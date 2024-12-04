import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';

import '../../models/send_reset_password_model.dart';

abstract class SendResetPasswordCodeRepo {
  Future<Either<Failure, SendResetPasswordModel>> sendResetPassCode({required String email});
}
