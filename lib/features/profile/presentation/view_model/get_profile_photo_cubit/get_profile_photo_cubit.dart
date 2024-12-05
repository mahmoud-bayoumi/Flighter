import 'dart:developer';

import 'package:flighter/features/profile/data/repos/get_profile_photo_repo/get_profile_photo_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_profile_photo_state.dart';

class GetProfilePhotoCubit extends Cubit<GetProfilePhotoState> {
  final GetProfilePhotoRepo getProfilePhotoRepo;
  GetProfilePhotoCubit(this.getProfilePhotoRepo)
      : super(GetProfilePhotoInitial());

  Future<void> getProfilePhoto() async {
    emit(GetProfilePhotoLoading());
    log('ProfilePhoto Loading');
    var response = await getProfilePhotoRepo.getUserProfilePhoto();
    return response.fold(
      (l) {
        log('ProfilePhoto Failure');
        emit(GetProfilePhotoFailure(errMessage: l.errMessage));
      },
      (r) {
        log('ProfilePhoto Success');
        emit(GetProfilePhotoSuccess());
      },
    );
  }
}
