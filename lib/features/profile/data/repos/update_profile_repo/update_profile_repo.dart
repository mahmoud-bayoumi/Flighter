import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';

abstract class UpdateProfileRepo {

  Future<Either<Failure,dynamic>> updateProfile();
}