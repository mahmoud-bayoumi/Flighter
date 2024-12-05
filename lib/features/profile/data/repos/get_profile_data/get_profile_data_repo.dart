import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/profile/data/models/get_profile_data_model.dart';

abstract class GetProfileDataRepo {
  Future<Either<Failure, ProfileDataModel>> getProfileData();
}
