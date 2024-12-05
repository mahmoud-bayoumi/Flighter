import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';

abstract class GetProfilePhotoRepo {
  Future<Either<Failure, dynamic>> getUserProfilePhoto();
}
