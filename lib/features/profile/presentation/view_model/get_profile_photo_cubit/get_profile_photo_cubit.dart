import 'dart:typed_data';

import 'package:flighter/features/profile/data/repos/get_profile_photo_repo/get_profile_photo_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_profile_photo_state.dart';

class GetProfilePhotoCubit extends Cubit<GetProfilePhotoState> {
  final GetProfilePhotoRepo getProfilePhotoRepo;
  Uint8List? imageBits;
  bool hasImage = false;
  GetProfilePhotoCubit(this.getProfilePhotoRepo)
      : super(GetProfilePhotoInitial());

  Future<void> getProfilePhoto() async {
    emit(GetProfilePhotoLoading());
    var response = await getProfilePhotoRepo.getUserProfilePhoto();

    return response.fold(
      (l) {
        imageBits = null;
        hasImage = false;
        emit(GetProfilePhotoFailure(errMessage: l.errMessage));
      },
      (r) {
        imageBits = r;
        hasImage = true;
        emit(GetProfilePhotoSuccess());
      },
    );
  }

  void clearProfilePhoto() {
    hasImage = false;
    imageBits = null; // Clear the in-memory image data
    // emit(GetProfilePhotoInitial());  // Optionally, emit an initial state
  }

  @override
  Future<void> close() {
    emit(GetProfilePhotoInitial());
    return super.close(); // Always call the super.close() method
  }
}
