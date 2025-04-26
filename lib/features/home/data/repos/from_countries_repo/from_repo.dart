import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/home/data/models/class_type/from_model.dart';

abstract class FromRepo {
  Future<Either<Failure, FromModel>> getFromCountries();
}
