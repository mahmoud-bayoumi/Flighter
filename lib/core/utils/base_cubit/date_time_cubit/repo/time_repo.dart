import 'package:flighter/core/utils/base_cubit/date_time_cubit/model/time_model.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class TimeRepo {
  final Dio dio;

  TimeRepo(this.dio);

  Future<Either<String, TimeModel>> getCurrentUtcTime() async {
    try {
      final response = await dio.get('https://timeapi.io/api/Time/current/zone?timeZone=UTC');
      return Right(TimeModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(e.message ?? "Unknown Dio error");
    } catch (e) {
      return Left("Unexpected error: $e");
    }
  }
}
