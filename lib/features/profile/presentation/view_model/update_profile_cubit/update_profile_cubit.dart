import 'dart:developer';
import 'dart:io';
import 'package:flighter/features/profile/data/repos/update_profile_repo/update_profile_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
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
      name: name.text,
      dateOfBirth: dateOfBirth.text,
      country: country.text,
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

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      //  final imageTemporary = File(image.path);
      imageFile = File(image.path);
      final imagePermanent = await saveImagePermanently(
          image.path); // this one it will be send to the backend endpoint
    } on PlatformException catch (e) {
      log('Failed to pick iamge : $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }
}
