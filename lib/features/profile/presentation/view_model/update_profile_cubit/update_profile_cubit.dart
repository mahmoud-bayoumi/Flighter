import 'dart:developer';
import 'dart:io';
import 'package:flighter/features/profile/data/repos/update_profile_repo/update_profile_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this._updateProfileRepoImpl)
      : super(UpdateProfileInitial());

  final UpdateProfileRepoImpl _updateProfileRepoImpl;

  final TextEditingController name = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();
  final TextEditingController country = TextEditingController();

  File? imageFile;

  Future<void> updateProfile() async {
    emit(UpdateProfileLoading());
    log('Loading update profile');
    var data = await _updateProfileRepoImpl.updateProfile(
      profilePhoto: imageFile,
      name: name.text.trim(),
      dateOfBirth: dateOfBirth.text.trim(),
      country: country.text.trim(),
    );

    data.fold(
      (failure) {
        log('failure to update profile');
        emit(UpdateProfileFailure(errMsh: failure.errMessage));
      },
      (r) {
        log('Success to update profile');
        emit(UpdateProfileSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    emit(UpdateProfileInitial());
    return super.close(); // Always call the super.close() method
  }
}
