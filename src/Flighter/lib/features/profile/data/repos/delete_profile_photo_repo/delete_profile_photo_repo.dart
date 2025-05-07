import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';

abstract class DeleteProfilePhotoRepo {
  Future<Either<Failure, String>> deleteProfilePhoto();
}
