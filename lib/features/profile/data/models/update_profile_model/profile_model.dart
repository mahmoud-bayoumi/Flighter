import 'package:flighter/features/profile/data/models/update_profile_model/update_profile_model.dart';

class ProfileModel {
  UpdateProfileModel? updateProfileModel;
  String? message;

  ProfileModel({this.updateProfileModel, this.message});

  factory ProfileModel.fromJosn(json) {
    return ProfileModel(
      updateProfileModel: UpdateProfileModel.fromJson(
        json,
      ),
      message: json['message'],
    );
  }
}
