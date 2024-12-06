import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';

abstract class GetProfilePhotoRepo {
  Future<Either<Failure,  Uint8List>> getUserProfilePhoto();
}
