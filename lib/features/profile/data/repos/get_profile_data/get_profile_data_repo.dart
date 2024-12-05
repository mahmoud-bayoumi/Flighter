import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';

abstract class GetProfileDataRepo {
  Future<Either<Failure, dynamic>> getProfileData();
}
