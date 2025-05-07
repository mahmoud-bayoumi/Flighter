import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/home/data/models/to_model.dart';

abstract class ToRepo {
  Future<Either<Failure, ToModel>> getToCountries();
}
