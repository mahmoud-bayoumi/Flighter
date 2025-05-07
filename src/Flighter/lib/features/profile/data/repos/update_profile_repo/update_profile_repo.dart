import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/profile/data/models/update_profile_model/profile_model.dart';

abstract class UpdateProfileRepo {
  Future<Either<Failure, ProfileModel>> updateProfile(
      {File? profilePhoto, // File --> data type of profile photo
      required String name,
      String? dateOfBirth,
      String? country});
}
