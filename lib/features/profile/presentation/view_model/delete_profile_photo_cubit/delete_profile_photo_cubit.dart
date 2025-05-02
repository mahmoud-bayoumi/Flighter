import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/delete_profile_photo_repo/delete_profile_photo_repo.dart';

part 'delete_profile_photo_state.dart';

class DeleteProfilePhotoCubit extends Cubit<DeleteProfilePhotoState> {
  final DeleteProfilePhotoRepo deleteProfilePhotoRepo;
  DeleteProfilePhotoCubit(this.deleteProfilePhotoRepo)
      : super(DeleteProfilePhotoInitial());
  Future<void> deleteProfilePhoto() async {
    emit(DeleteProfilePhotoLoading());
    var response = await deleteProfilePhotoRepo.deleteProfilePhoto();
    return response.fold(
      (failure) {
        emit(DeleteProfilePhotoFailure(errMessage: failure.errMessage));
      },
      (r) {
        emit(DeleteProfilePhotoSuccess());
      },
    );
  }
}
