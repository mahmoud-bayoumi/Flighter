import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';

abstract class DeleteAccountRepo {
  Future<Either<Failure, String>> deleteAccount({required String password});
}
