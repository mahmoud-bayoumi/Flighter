import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';

import '../../models/airline.dart';

abstract class AirlinesRepo {
  Future<Either<Failure, List<Airline>>> getAirlines();
}
